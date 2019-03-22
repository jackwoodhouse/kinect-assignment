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
        string lastMessage = null;

        public Connection()
        {
            port = new SerialPort("COM12", 9600);

        }
     
        public void SendCommands(string text) // change to params
        {

            if (!port.IsOpen)
            {
                port.Open();

            }

            if (lastMessage == null || lastMessage != text)
            {
                lastMessage = text;
                port.Write(text); // change to params from extensions class
            }

        }

    }
        
}
