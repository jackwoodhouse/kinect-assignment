import processing.serial.*; // import the processing serial library
import g4p_controls.*; // import the GUI for Processing controls library
import mqtt.*; // import the mqtt library

MQTTClient client; // create an instance of the MQTTClient class

Serial serialPort; // create an instance of the Serial class

public void setup() // a function that sets up the GUI
{ 
  size(350, 400); // set the size of the GUI
  createGUI(); // call the GUI constructor

  client = new MQTTClient(this); // initialise the instance of the MQTTClient using the MQTTClient constructor
  client.connect("mqtt://jack:wood@127.0.0.1", "pub"); // connect the client instance to the broker as a publisher

  String xBeePort = "COM12"; // create a string variable to hold the COM port value
  serialPort = new Serial(this, xBeePort, 9600); // initalise the instance of the Serial using the Serial constructor
}

public void draw() { // a function that draws the GUI
  background(200, 200, 200); // set the background colour of the GUI
  if (serialPort.available() > 0)  // check to see if there is data in the serial 
  {
    String incomingMessage = serialPort.readStringUntil('!'); // read the serial data until the exclamation mark and store in the string variable incomingMessage
    if (incomingMessage != null) // check to see if incomingMessage is not null
    {
      String splitCommand[] = incomingMessage.split(","); // split the string stored incomingMessage at the comma and store in a string array named splitCommand
      String commandLetter = splitCommand[0]; // store the first element of splitCommand into the string variable named commandLetter
      if (commandLetter != null) // check to see if the commandLetter is not equal to null
      {
        String outgoingMessage = null; // create a string variable named outgoingMessage to be used when sending and publishing messages

        if (commandLetter.equals("w")) // check to see if the commandLetter is equal to w
        {
          outgoingMessage = "Zumo moving forward"; // store the value 'Zumo moving forward' in to the outgoingMessage string variable
        } else if (commandLetter.equals("a")) // check to see if the commandLetter is equal to a
        { 
          outgoingMessage = "Zumo turning left"; // store the value 'Zumo turning left' in to the outgoingMessage string variable
        } else if (commandLetter.equals("s")) // check to see if the commandLetter is equal to s
        {
          outgoingMessage = "Zumo moving backwards"; // store the value 'Zumo moving backwards' in to the outgoingMessage string variable
        } else if (commandLetter.equals("d")) // check to see if the commandLetter is equal to d
        {
          outgoingMessage = "Zumo turning right"; // store the value 'Zumo turning right' in to the outgoingMessage string variable
        } else if (commandLetter.equals("x")) // check to see if the commandLetter is equal to x
        {
          outgoingMessage = "Zumo has come to a stop"; // store the value 'Zumo turning right' in to the outgoingMessage string variable
        }

        if (outgoingMessage != null) // check to see if the outgoingMessage is not equal to null
        {
          String text = textarea1.getText(); // retrieve the text of the textarea1 and store it in a string variable named text
          if (text == "Messages from Zumo") // check to see if the value of text is equal to 'Messages from Zumo'
          {
            textarea1.setText(outgoingMessage); // set the text of the textarea1 to the value of outgoingMessage
          } else
          {
            textarea1.appendText(outgoingMessage); // append the text of the textarea1 with the value of outgoingMessage
          }
          client.publish("liam", outgoingMessage); // publish to the mqtt client using the topic 'liam' and the value of the outgoingMessage
        }
      }
    }
  }
}
