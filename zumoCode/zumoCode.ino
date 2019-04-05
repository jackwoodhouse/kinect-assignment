#include <Wire.h> // import the wire class header file - need for the Zumo
#include "movement.h" // import the movement header file- created by us to for the Zumo movements

ZumoBuzzer buzzer; // create an istance of the ZumoBuzzer class
Pushbutton button(ZUMO_BUTTON); // create an instance of the Pushbutton class

void setup() // a function that sets up the Zumo
{
  Serial.begin(9600); // initialize the serial communication
  buzzer.play(">g32>>c32"); // play sound so we know set up is complete
  button.waitForButton(); // wait until that button is pressed to start accepting commands

}

void loop() { // a loop function that is always looping
  commands(); // function call for the commands translated from body movements
}

void commands() // a function that holds the commands
{
  if (Serial.available() > 0) // see if there's incoming serial data
  {
    String commandLetter = Serial.readStringUntil(','); // the incoming data until a comma and store it in the string variable named command letter
    Serial.read(); // read the serial again
    String speedValueStr = Serial.readStringUntil('!'); // read the incoming data until the exclamation mark and store it in the string variable named speedValueStr
    int speedValue = speedValueStr.toInt(); // convert the value stored in speedValueStr to an integer

    if (commandLetter == "w") // if the commandLetter string is set to w
    {
      Movement::forward(speedValue); // move the Zumo forward using the integer stored in speedValue
    }
    else if (commandLetter == "a") // else if the command string is set to a
    {
      Movement::left(speedValue); // turn the Zumo left using the integer stored in speedValue
    }
    else if (commandLetter == "s") // else if the commandLetter string is set to s
    {
      Movement::backward(speedValue); // move the Zumo backward using the integer stored in speedValue
    }
    else if (commandLetter == "d") // else if commandLetter string is set to d
    {
      Movement::right(speedValue); // // turn the Zumo right using the integer stored in speedValue
    }
    else if (commandLetter == "x") // else if the commandLetter string is set to x
    {
      Movement::halt(); // Set the motor speeds to 0 bringing the Zumo to a stop
    }
  }
}
