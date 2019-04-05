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
        // create a new serial port variabl for our xbee connection.
        SerialPort port;
        // set the last message sent to null, this variable allows us to limit duplicate messages being sent.
        string lastMessage = null;

        public Connection()
        {
            // connect to the xbee.
            port = new SerialPort("COM12", 9600);
        }
        // take the command from Extentions and write them to the xbee.
        public void SendCommands(string command)
        {
            // If the port isnt already open or in use, then open it. 
            if (!port.IsOpen) 
            {
                port.Open();
            }
            //if the last message is null, or not the same command as just sent, write the new command to xbee.
            if (lastMessage == null || lastMessage != command) 
            {
                lastMessage = command;
                // write the command to the xbee.
                port.Write(command); 
            }
        }
    }       
}
