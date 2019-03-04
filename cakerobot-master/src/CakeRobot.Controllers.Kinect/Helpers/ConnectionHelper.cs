using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using CakeRobot.Portable;
using Microsoft.Kinect;

namespace CakeRobot.Controllers.Kinect
{

    class ConnectionHelper
    {
        /// <summary>
        /// Bluetooth connection
        /// </summary>
        private BluetoothConnection _btCon = new BluetoothConnection();


        /// <summary>
        /// Previous time. To avoid flooding, let us send signals only once in
        /// a second
        /// </summary>
        private DateTime _prevTime;


        internal void Initialize()
        {
            try
            {
                _prevTime = DateTime.Now;
                _btCon.Initialize();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Can't establish bluetooth connection with the robot. " +
                                "Please ensure your bluetooth shield is paired with your laptop" + ex.Message);
            }
        }
        

        internal void ProcessCommand(Skeleton skeleton)
        {

            var now = DateTime.Now;
            if (now.Subtract(_prevTime).TotalMilliseconds < 600)
                return;

            _prevTime = DateTime.Now;

            Joint handRight = skeleton.Joints[JointType.HandRight];
            Joint handLeft = skeleton.Joints[JointType.HandLeft];
            Joint shoulderRight = skeleton.Joints[JointType.ShoulderRight];
            Joint shoulderLeft = skeleton.Joints[JointType.ShoulderLeft];
            Joint hipLeft = skeleton.Joints[JointType.HipLeft];
            Joint hipRight = skeleton.Joints[JointType.HipRight];
            Joint kneeLeft = skeleton.Joints[JointType.KneeLeft];

            if (handRight.Position.Y < hipRight.Position.Y)
            {
                _btCon.SetSpeed(Motor.Left, 0);
            }

            if (handLeft.Position.Y < hipLeft.Position.Y)
            {
                _btCon.SetSpeed(Motor.Right, 0);
            }

            if (handRight.Position.Y > hipRight.Position.Y)
            {
                var speed = (handRight.Position.Y - hipRight.Position.Y) * 200;
                if (speed > 230) speed = 230;
                _btCon.SetSpeed(Motor.Left, (int)speed);
            }

            if (handLeft.Position.Y > hipLeft.Position.Y)
            {
                var speed = (handLeft.Position.Y - hipLeft.Position.Y) * 200;
                if (speed > 230) speed = 230;
                _btCon.SetSpeed(Motor.Right, (int)speed);
            }

        }
    }

}
