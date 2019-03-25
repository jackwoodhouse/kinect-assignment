public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:500642:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
  // on the click event of the send messages to Zumo button do:
  String text = textfield1.getText(); // get the text of the textfield1 which is the text field which is 
                                      // used to send messages tp the Zumo and set it into a string called text
  serialPort.write(text); // write the text field text out to the serial which will execute code in the Arduino files to complete various commands
  textfield1.setText(""); // set the textfield to an empty string so that once the message has sent the text field becomes empty
} //_CODE_:button1:500642:
public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:textfield1:568846:
  println("textfield1 - GTextField >> GEvent." + event + " @ " + millis());
  // on the change event of the messages to zumo text field
  String text = textfield1.getText(); // get the text of the textfield1 which is the text field which is 
                                      // used to send messages tp the Zumo and set it into a string called text

  if (text == "Messages To Zumo") // if the text of the field is equal to Messages To Zumo
  {
    textfield1.setText(""); // set the text in the field to empty string
  }
} //_CODE_:textfield1:568846:
public void button2_click1(GButton source, GEvent event) { //_CODE_:button2:308221:
  println("button2 - GButton >> GEvent." + event + " @ " + millis());
  // on the click event of the left button 
  serialPort.write("a"); // write an a to the serial which will excute code in the Arduino files to turn the Zumo left
} //_CODE_:button2:308221:
public void button3_click1(GButton source, GEvent event) { //_CODE_:button3:604378:
  println("button3 - GButton >> GEvent." + event + " @ " + millis());
  // on the click event of the right button
  serialPort.write("d"); // write a d to the serial which will execute code in the Arduino files to turn the Zumo right
} //_CODE_:button3:604378:
public void button4_click1(GButton source, GEvent event) { //_CODE_:button4:348760:
  println("button4 - GButton >> GEvent." + event + " @ " + millis());
  // on the click event of the forward button
  serialPort.write("w"); // write a w to the serial which will execute code in the Arduino files to move the Zumo forwards
} //_CODE_:button4:348760:
//back
public void button5_click1(GButton source, GEvent event) { //_CODE_:button5:984108:
  println("button5 - GButton >> GEvent." + event + " @ " + millis());
  // on the click event of the back button
  serialPort.write("s"); // write a s to the serial which will execute code in the Arduino files to move the Zumo backwards
} //_CODE_:button5:984108:
public void button6_click1(GButton source, GEvent event) { //_CODE_:button6:984108:
  println("button6 - GButton >> GEvent." + event + " @ " + millis());
  // on the click event of the stop button
  serialPort.write(" "); // write a space to the serial which will execute code in the Arduino files to bring the zumo to a stop
} //_CODE_:button6:984108:
public void button7_click1(GButton source, GEvent event) { //_CODE_:button7:984108:
  println("button7 - GButton >> GEvent." + event + " @ " + millis());
  // on the click event of the left 90 button
  serialPort.write("l"); // write a l to the seriaL which will execute code in the Arduino files to turn the Zumo left 90 degrees 
} //_CODE_:button7:984108:
public void button8_click1(GButton source, GEvent event) { //_CODE_:button8:984108:
  println("button8 - GButton >> GEvent." + event + " @ " + millis());
  // on the click event of the left 180 button 
  serialPort.write("ll"); // write ll to the seriaL which will execute code in the Arduino files to turn the Zumo left 180 degrees 
} //_CODE_:button8:984108:
public void button9_click1(GButton source, GEvent event) { //_CODE_:button9:984108:
  println("button9 - GButton >> GEvent." + event + " @ " + millis());
  // on the click event of the left adjust button
  serialPort.write("lda"); // write a lda to the seriaL which will execute code in the Arduino files to turn the Zumo slightly left
} //_CODE_:button9:984108:
public void button10_click1(GButton source, GEvent event) { //_CODE_:button10:984108: 
  println("button10 - GButton >> GEvent." + event + " @ " + millis());
  // on the click event of the right adjust button
  serialPort.write("rda"); // write an rda to the seriaL which will execute code in the Arduino files to turn the Zumo slightly right 
} //_CODE_:button10:984108:
public void button11_click1(GButton source, GEvent event) { //_CODE_:button11:984108:
  println("button12 - GButton >> GEvent." + event + " @ " + millis());
    // on the click event of the right 180 button
  serialPort.write("rr"); // write rr to the seriaL which will execute code in the Arduino files to turn the Zumo right 180 degrees
} //_CODE_:button11:984108:
public void button12_click1(GButton source, GEvent event) { //_CODE_:button12:984108:
  println("button12 - GButton >> GEvent." + event + " @ " + millis());
  // on the click event of the right 90 button
  serialPort.write("r"); // write a r to the seriaL which will execute code in the Arduino files to turn the Zumo right 90 degrees
} //_CODE_:button12:984108:


// Create all the GUI controls. 
public void createGUI() {
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  textarea1 = new GTextArea(this, 300, 11, 300, 300, G4P.SCROLLBARS_BOTH | G4P.SCROLLBARS_AUTOHIDE);
  textarea1.setText("Messages from Zumo");
  textarea1.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  textarea1.setOpaque(true);
  textarea1.addEventHandler(this, "textarea1_change1");
  button1 = new GButton(this, 19, 275, 91, 60);
  button1.setTextAlign(GAlign.LEFT, GAlign.TOP);
  button1.setText("Send message to Zumo");
  button1.setTextBold();
  button1.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  button1.addEventHandler(this, "button1_click1");
  textfield1 = new GTextField(this, 110, 300, 160, 30, G4P.SCROLLBARS_NONE);
  textfield1.setText("Messages To Zumo");
  textfield1.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  textfield1.setOpaque(true);
  textfield1.addEventHandler(this, "textfield1_change1");
  button2 = new GButton(this, 11, 169, 80, 30);
  button2.setText("Left");
  button2.setTextBold();
  button2.addEventHandler(this, "button2_click1");
  button3 = new GButton(this, 127, 171, 80, 30);
  button3.setText("Right");
  button3.setTextBold();
  button3.addEventHandler(this, "button3_click1");
  button4 = new GButton(this, 71, 121, 80, 30);
  button4.setText("Forward");
  button4.setTextBold();
  button4.addEventHandler(this, "button4_click1");
  button5 = new GButton(this, 69, 225, 80, 30);
  button5.setText("Back");
  button5.setTextBold();
  button5.addEventHandler(this, "button5_click1");
  button6 = new GButton(this, 160, 225, 80, 30);
  button6.setText("Stop");
  button6.setTextBold();
  button6.addEventHandler(this, "button6_click1");
  button7 = new GButton(this, 19, 350, 80, 30);
  button7.setText("Left 90");
  button7.setTextBold();
  button7.addEventHandler(this, "button7_click1");
  button8 = new GButton(this, 100, 350, 80, 30);
  button8.setText("Left 180");
  button8.setTextBold();
  button8.addEventHandler(this, "button8_click1");
  button9 = new GButton(this, 181, 350, 80, 30);
  button9.setText("Left Adjust");
  button9.setTextBold();
  button9.addEventHandler(this, "button9_click1");
  button10 = new GButton(this, 262, 350, 80, 30);
  button10.setText("Right Adjust");
  button10.setTextBold();
  button10.addEventHandler(this, "button10_click1");
  button11 = new GButton(this, 343, 350, 80, 30);
  button11.setText("Right 180");
  button11.setTextBold();
  button11.addEventHandler(this, "button11_click1");
  button12 = new GButton(this, 424, 350, 80, 30);
  button12.setText("Right 90");
  button12.setTextBold();
  button12.addEventHandler(this, "button12_click1");
  
}

// Variable declarations 
GTextArea textarea1;
GButton button1;
GTextField textfield1; 
GButton button2; 
GButton button3; 
GButton button4; 
GButton button5; 
GButton button6;
GButton button7;
GButton button8;
GButton button9;
GButton button10;
GButton button11;
GButton button12;
