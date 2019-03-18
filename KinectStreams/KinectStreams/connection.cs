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
     
        public void SendCommands(string text) // change to params
        {
            port = new SerialPort("COM12", 9600);
            
            if (!port.IsOpen)
            {
                port.Open();

            }

            port.Write(text); // change to params from extensions class
        }

    }
        
}
