#include <ZumoShield.h>

class Movement{

    private:
    static ZumoMotors motors; //declare a variable called motors of type ZumoMotors so that we can set the speeds of the motors to control the robot
                            // static because can't call non static variable from inside static method

    public:
    // static methods so I didn't need to istaniate the class
    static void forward(int speed) // method for the forward movement
    {
        motors.setSpeeds(speed, speed); // set both motors to the speed passed in
    };
    static void backward(int speed) // method for the reverse movement
    {
        motors.setSpeeds(-speed, -speed); // set both motors in reverse to the speed passed in
    };
    static void left(int speed) // method for moving the Zumo left
    {
        motors.setSpeeds(-speed, speed); // set the left motor in reverse to the speed passed and the right motor to the speed passed in forwards
    };
    static void right(int speed) // method for moving the Zumo right
    {
        motors.setSpeeds(speed, -speed); // set the right motor in reverse to the speed passed and the left motor to the speed passed in forwards
    };
    static void halt() // method making the Zumo come to a stop
    {
        motors.setSpeeds(0,0); // set both the motors to a speed of Zumo
    };
    static void adjust(int left, int right) // method to make the Zumo adjust can return the white when it slightly touches black
    {
        motors.setSpeeds(left,right); // set the left and right motors based on the values passed in
    };
    static void right90(int speed)
    {
      right(125);
      delay(890); // rotate 90 degrees
      halt();
    };
    static void right180(int speed)
    {
      right(125);
      delay(1790); // rotate 180 degrees
      halt();
    };
    static void left90(int speed)
    {
      left(125);
      delay(890); // rotate 180 degrees
      halt();
    };
    static void left180(int speed)
    {
      left(125);
      delay(1790);
      halt();
    };
    static void leftDegreeAdjust(int speed)
    {
      left(125);
      delay(100);
      halt();
    };
    static void rightDegreeAdjust(int speed)
    {
      right(125);
      delay(100);
      halt();
    };
};
