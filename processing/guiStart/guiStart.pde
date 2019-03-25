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

  String xBeePort = "COM12";
  serialPort = new Serial(this, xBeePort, 9600);
}

public void draw() {
  background(200, 200, 200);
  if (serialPort.available() > 0) 
  { 
    message = serialPort.readStringUntil(LF);
    println(message);
    //message = message.replace("\r\n", "");
    if (message!=null)
    {
      String text = textarea1.getText();
      if (text == "Messages from Zumo")
      {
         textarea1.setText(message);
         
      }
      else
      {
             textarea1.appendText(message); 
      }
      client.publish("liam", message);

    }
  }
}
