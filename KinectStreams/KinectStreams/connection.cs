using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO.Ports;

namespace KinectStreams
{
    public partial class Connection
    {
        SerialPort port;
     
        public void SendCommands(string d, float s) // change to params
        {
            port = new SerialPort(port.PortName, 9600);
            port.Open();
            //int speed = 5;
            //string speedValue = speed.ToString();

            //port.Write("w," + speedValue); // change to params from extensions class

        }

      
    }
        
}
