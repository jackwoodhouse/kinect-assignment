// Create all the GUI controls. 
public void createGUI() {
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  textarea1 = new GTextArea(this, 20, 20, 300, 300, G4P.SCROLLBARS_BOTH | G4P.SCROLLBARS_AUTOHIDE);
  textarea1.setText("Messages from Zumo");
  textarea1.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  textarea1.setOpaque(true);
}

// Variable declarations 
GTextArea textarea1;
