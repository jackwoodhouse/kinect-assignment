import processing.serial.*;
import g4p_controls.*;
import mqtt.*;

MQTTClient client;

Serial serialPort;

final char LF = 10;
String message;

public void setup() {
  size(650, 400);
  createGUI();

  client = new MQTTClient(this);
  client.connect("mqtt://liam:sykes@127.0.0.1", "pub");

  String xBeePort = "COM11";
  serialPort = new Serial(this, xBeePort, 9600);
}

public void draw() {
  background(200, 200, 200);
  if (serialPort.available() > 0) 
  {

    String incomingMessage = serialPort.readStringUntil('!');
    println(incomingMessage);
    //serialPort.read();
    //String speedValue = serialPort.readStringUntil(LF);
    //println(speedValue);

  if(incomingMessage != null)
  {
    String splitCommand[] = incomingMessage.split(",");
    String commandLetter = splitCommand[0];
      if (commandLetter.equals("w"))
      {
        println("w");
        message = "Zumo moving forward at speed ";
      } 
      else if (commandLetter.equals("a"))
      { 
        println("a");
        message = "Zumo turning left at speed ";
      } 
      else if (commandLetter.equals("s"))
      {
        println("s");
        message = "Zumo moving backwards at speed ";
      } 
      else if (commandLetter.equals("d"))
      {
        println("d");
        message = "Zumo turning right at speed";
      } 
      else if (commandLetter.equals("x"))
      {
        println("x");
        message = "Zumo has come to a stop";
      }
      else 
      {
        println("error Liam is dumb!");
      }
      //println(message);
    

    //message = message.replace("\r\n", "");
      if(message != null)
      {
      println("setting text area");
      String text = textarea1.getText();
      if (text == "Messages from Zumo")
      {
        textarea1.setText(message);
      } else
      {
        textarea1.appendText(message);
      }
      println("just before publish");
      client.publish("liam", message);
      }
    }
  }
}
