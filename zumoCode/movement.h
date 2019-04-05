#include <ZumoShield.h> // import the ZumoShield header file

class Movement { // Movement class declaration

  private:
    static ZumoMotors motors; //create an instance of the ZumoMotors class so that we can set the speeds of the motors to control the robot
    // static because can't call non static variable from inside static method

  public:
    // static methods so we didn't need to istaniate the class
    static void forward(int speed) // method for the forward movement
    {
      int newSpeed = restrictSpeedIfNeeded(speed); // call the restrict speed if needed method and set return value into the integer newSpeed variable
      motors.setSpeeds(newSpeed, newSpeed); // set both the motor speeds to the value of speed
    };
    static void backward(int speed) // method for the reverse movement
    {
      int newSpeed = restrictSpeedIfNeeded(speed); // call the restrict speed if needed method and set return value into the integer newSpeed variable
      motors.setSpeeds(-newSpeed, -newSpeed); // set both the motor speeds in reverse to the value of speed
    };
    static void left(int speed) // method for moving the Zumo left
    {
      int newSpeed = restrictSpeedIfNeeded(speed); // call the restrict speed if needed method and set return value into the integer newSpeed variable
      motors.setSpeeds(-newSpeed, newSpeed); // set the left motor in reverse to the value of speedand the right motor to the value of speed in forwards
      delay(445); // to prevent the Zumo turning more than 90 degrees
      halt(); // stop the Zumo
    };
    static void right(int speed) // method for moving the Zumo right
    {
      int newSpeed = restrictSpeedIfNeeded(speed); // call the restrict speed if needed method and set return value into the integer newSpeed variable
      motors.setSpeeds(newSpeed, -newSpeed); // set the right motor in reverse to the value of speed and the left motor to the value of speed in forwards
      delay(445); // to prevent the Zumo from turning more than 90 degrees
      halt(); // stop the Zumo
    };
    static void halt() // method making the Zumo come to a stop
    {
      motors.setSpeeds(0, 0); // set both the motors to a speed of 0
    };
    static int restrictSpeedIfNeeded(int speed) // restrict the speed to prevent damaging the Zumo motors
    {
      if (speed < 0 || speed > 125) // if the value of speed is greater than 125
      {
        speed = 125; // set speed to 125
      }
      return speed; // return the speed of either the orginial speed passed in or 125
    };

};
