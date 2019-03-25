#include <Wire.h>
#include "movement.h"

ZumoBuzzer buzzer;
Pushbutton button(ZUMO_BUTTON);

void setup() 
{
  Serial.begin(9600);
  buzzer.play(">g32>>c32");
  button.waitForButton();

}

void loop() {
  // put your main code here, to run repeatedly:
  commands();
}

void commands()
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
      Serial.println("Moving forward at speed " + speedValueStr);
    }
    else if (commandLetter == "a") // else if the incomingBytes string is set to a
    {
      Movement::left(speedValue); // move the Zumo left at a speed of 125
      Serial.println("Moving left speed " + speedValueStr);
    }
    else if (commandLetter == "s") // else if the incomingBytes string is set to s
    {
      Movement::backward(speedValue); // move the Zumo forwards at a speed of 150
      Serial.println("Moving backward at speed " + speedValueStr);
    }
    else if (commandLetter == "d") // else if incomingBytes string is set to d
    {
      Movement::right(speedValue); // move the Zumo right at a speed of 125
      Serial.println("Moving right at speed " + speedValueStr);
    }
    else if (commandLetter == "x") // else if the incomingBytes string is empty
    {
      Movement::halt(); // Set the motor speeds to 0 bringing the Zumo to a stop
      Serial.println("Zumo has come to a stop");
    }
  }
}
