using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using InTheHand.Net;
using InTheHand.Net.Sockets;


namespace CakeRobot.Controllers.Kinect
{
    public class BluetoothConnection : CakeRobot.Portable.Connection
    {
        private StreamWriter _bwriter = null;
        private readonly string _address = null;

        public BluetoothConnection(string address = null)
        {
            _address = address;
        }

        public override void Initialize()
        {
            var cli = new BluetoothClient();
            BluetoothDeviceInfo[] peers = cli.DiscoverDevices();
            BluetoothDeviceInfo device;
            if (string.IsNullOrEmpty(_address))
                device = peers.FirstOrDefault();
            else
            {
                device = peers.FirstOrDefault((d) => d.DeviceAddress.ToString() == _address);
            }

            if (device != null)
            {
                BluetoothAddress addr = device.DeviceAddress;
                Guid service = device.InstalledServices.FirstOrDefault();

                cli.Connect(addr, service);
                var stream = cli.GetStream();
                _bwriter = new StreamWriter(stream);
            }

            Initialized = true;
        }

        public override void Send(string command)
        {                                      
            if (_bwriter != null)
            {
                _bwriter.WriteLine(command);
                _bwriter.Flush();

                Debug.WriteLine(DateTime.Now + " - Send - " + command);

            }
        }

        public void Close()
        {
            if (_bwriter!=null)
                _bwriter.Close();

            //Close client too
        }
    }
}
