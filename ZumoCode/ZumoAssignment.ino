#include <Wire.h>
#include "movement.h"

ZumoBuzzer buzzer;
Pushbutton button(ZUMO_BUTTON); // declare a variable so that the Pushbutton on the zumo can be used

void setup()  // a function that sets up the Zumo
{
  Serial.begin(9600); // initialize the serial communication
  buzzer.play(">g32>>c32");

  // Wait for the user button to be pressed and released
  button.waitForButton();

  // Play music and wait for it to finish before we start driving.
  buzzer.play("L16 cdegreg4");
  while(buzzer.isPlaying());
}

void loop() // a loop function that is always looping
{
  commands(); // function call for the commands sent from the GUI
}

void commands() // a function that holds the commands functionality
{
  if (Serial.available() > 0) // see if there's incoming serial data
  { 
    String commandLetter = Serial.readStringUntil(',');
    Serial.read();
    String speedValueStr = Serial.readStringUntil('\n\r');
    int speedValue = speedValueStr.toInt();
    
    if (commandLetter == "w") // if the incomingBytes string is set to w
    {
      Movement::forward(speedValue); // move the Zumo forwards at a speed of 150
    }
    else if (commandLetter == "a") // else if the incomingBytes string is set to a
    {
      Movement::left(speedValue); // move the Zumo left at a speed of 125
    }
    else if (commandLetter == "s") // else if the incomingBytes string is set to s
    {
      Movement::backward(speedValue); // move the Zumo forwards at a speed of 150
    }
    else if (commandLetter == "d") // else if incomingBytes string is set to d
    {
      Movement::right(speedValue); // move the Zumo right at a speed of 125
    }
    else if (commandLetter == "x") // else if the incomingBytes string is empty
    {
      Movement::halt(speedValue); // Set the motor speeds to 0 bringing the Zumo to a stop
    }
  }
}
