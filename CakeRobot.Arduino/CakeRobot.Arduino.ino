/*

  CAKE Robot - A C# (Server), Arduino (Client), Kinect Enabled Bot

*/

// constants
const int ledPin =  13;      // the number of the LED pin

const int leftMotorSpeed = 9;
const int leftMotorDirection = 7;
const int rightMotorSpeed = 10;
const int rightMotorDirection = 8;
const int distancePin = 12;

// Variables
int ledState = LOW;             // ledState used to set the LED

// For interval calc
long previousMillis = 0;
long interval = 1000;
long tick = 0;


//Bluetooth Reading
byte serialIn = 0;
int commandAvailable = false;
String strReceived = "";



void setup() {
  // set the digital pin as output:
  pinMode(ledPin, OUTPUT);

  //-- Motors
  pinMode(leftMotorSpeed, OUTPUT);
  pinMode(rightMotorSpeed, OUTPUT);
  pinMode(leftMotorDirection, OUTPUT);
  pinMode(rightMotorDirection, OUTPUT);

  //-- Distance Reader
  digitalWrite(distancePin, LOW);
  pinMode(distancePin, INPUT);

  digitalWrite(leftMotorDirection, LOW);
  digitalWrite(rightMotorDirection, LOW);

  //Let us stop and not move
  analogWrite(leftMotorSpeed, 0);
  analogWrite(rightMotorSpeed, 0);

  Serial.begin(115200);  // rn42 bt
}


void loop()
{
  getSerialLine();
  if (commandAvailable) {
    processCommand (strReceived);
    strReceived = "";
    commandAvailable = false;
  }
}

void doStuffOnTick()
{
  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis > interval) {
    previousMillis = currentMillis;
    tick++;
  }
}

void blinkLed()
{
  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis > interval) {
    // save the last time you blinked the LED
    previousMillis = currentMillis;

    // if the LED is off turn it on and vice-versa:
    if (ledState == LOW)
      ledState = HIGH;
    else
      ledState = LOW;

    // set the LED with the ledState of the variable:
    digitalWrite(ledPin, ledState);
  }
}

void processCommand(String input)
{
  String command = getValue(input, ' ', 0);
  int val;
  if (command == "start")
  {
    analogWrite(leftMotorSpeed, 140);
    analogWrite(rightMotorSpeed, 140);
  }
  else if (command == "stop")
  {
    analogWrite(leftMotorSpeed, 0);
    analogWrite(rightMotorSpeed, 0);
  }
  else if (command == "speedl")
  {
    val = getValue(input, ' ', 1).toInt();
    analogWrite(leftMotorSpeed, val);
  }
  else if (command == "speedr")
  {
    val = getValue(input, ' ', 1).toInt();
    analogWrite(rightMotorSpeed, val);
  }
  else if (command == "speed")
  {
    val = getValue(input, ' ', 1).toInt();
    analogWrite(rightMotorSpeed, val);
    analogWrite(leftMotorSpeed, val);
  }
  else if (command == "dirr")
  {
    val = getValue(input, ' ', 1).toInt();
    analogWrite(rightMotorSpeed, val == 0 ? LOW : HIGH);
  }
  else if (command == "dirl")
  {
    val = getValue(input, ' ', 1).toInt();
    digitalWrite(leftMotorDirection, val == 0 ? LOW : HIGH);
  }

  else if (command == "right")
  {
    analogWrite(leftMotorSpeed, 100);
    analogWrite(rightMotorSpeed, 0);
  }

  else if (command == "left")
  {
    analogWrite(leftMotorSpeed, 0);
    analogWrite(rightMotorSpeed, 100);
  }

  else if (command == "reverse")
  {
    digitalWrite(leftMotorDirection, HIGH);
    digitalWrite(rightMotorDirection, HIGH);
  }

  else if (command == "forward")
  {
    digitalWrite(leftMotorDirection, LOW);
    digitalWrite(rightMotorDirection, LOW);
  }

}

String getValue(String data, char separator, int index)
{
  int found = 0;
  int strIndex[] = {
    0, -1
  };
  int maxIndex = data.length() - 1;

  for (int i = 0; i <= maxIndex && found <= index; i++) {
    if (data.charAt(i) == separator || i == maxIndex) {
      found++;
      strIndex[0] = strIndex[1] + 1;
      strIndex[1] = (i == maxIndex) ? i + 1 : i;
    }
  }

  return found > index ? data.substring(strIndex[0], strIndex[1]) : "";
}


void getSerialLine()
{

  while (serialIn != '\n')
  {
    if (!(Serial.available() > 0))
    {
      return;
    }

    serialIn = Serial.read();
    if (serialIn != '\n') {
      char a = char(serialIn);
      strReceived += a;
    }
  }

  if (serialIn == '\n') {
    commandAvailable = true;
    serialIn = 0;
  }

}
