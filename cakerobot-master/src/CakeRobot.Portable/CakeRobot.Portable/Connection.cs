using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;

namespace CakeRobot.Portable
{
    public enum Motor
    {
        Right,
        Left
    }

    public abstract class Connection
    {
        public abstract void Send(string command);
        public abstract void Initialize();

        public bool Initialized { get; set; }

        public void Send(string command,string value)
        {
           Send(command + ' ' + value); 
        }
        public void SetSpeed(Motor m, int speed)
        {

            if (speed<0 || speed>255) 
                throw new ArgumentException("Speed should be between 0 and 255");

            string motor = m == Motor.Right ? "r" : "l";
            string cmd="speed" + motor;
            Send(cmd, speed.ToString());
        }

        public void SetDirection(Motor m, bool direction)
        {
            string motor = m == Motor.Right ? "r" : "l";
            Send("dir" + motor, (direction?1:0).ToString());
        }
    }
}
