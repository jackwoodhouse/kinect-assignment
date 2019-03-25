int red = 0;
int green = 0;
int blue = 0;
import mqtt.*;

int background = 0;


MQTTClient client;

void setup() {
  size(640, 360);
  noStroke();   
  
  client = new MQTTClient(this);
  client.connect("mqtt://jack:wood@127.0.0.1", "subscriber");
  client.subscribe("JACK");
  // client.unsubscribe("/example");
}

void draw() {
  background(background,0,0);
}

void messageReceived(String topic, byte[] payload) {
  println("new message: " + topic + " - " + new String(payload));
  background = int(new String(payload));
}


// Add a function to receive messages from the broker 
// and change the colour variables here
