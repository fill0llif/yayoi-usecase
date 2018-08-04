# Yayoi Use Case
Use case project for _Yayoi_ GUI annotation framework

# Building

	ceylon compile
	
# Use Case

App entry point:

```ceylon
shared void run() =>
	Yayoi(`class App`).run();
```

User app:

```ceylon
yayoi({`package it.feelburst.yayoi.usecase`})
shared class App() satisfies Runnable {
	
	autowired
	shared late Window<JFrame> login;
	
	shared actual void run() {}
	
}
```

Components file:

```ceylon
setLookAndFeel
shared String lookAndFeel() =>
	UIManager.systemLookAndFeelClassName;

window
title("Login")
size(270,150)
centered
exitOnClose
shared object login extends JFrame() {}

container
parent("login")
withLayout("panelGroupLayout")
shared object panel extends JPanel() {}
	
layout
shared GroupLayout panelGroupLayout {
	value groupLayout = GroupLayout(panel);
	groupLayout.autoCreateContainerGaps = true;
	groupLayout.autoCreateGaps = true;
	return groupLayout;
}
	
component
parent("login.panel")
shared object emailTextField extends JTextField(20) {}
	
component
parent("login.panel")
shared object passwordField extends JPasswordField(20) {}
	
component
parent("login.panel")
onActionPerformed("loginButtonListener")
shared object loginButton extends JButton("Ok") {}
	

listener
shared object loginButtonListener satisfies ActionListener {
	shared actual void actionPerformed(ActionEvent? e) {
		print("On Action Performed");
	}
}

doLayout("login.panel")
shared void doPanelLayout(
	GroupLayout panelLayout, 
	JPanel panel, 
	JTextField emailTextField,
	JButton loginButton, 
	JPasswordField passwordField) {
	panelLayout.setHorizontalGroup(
		panelLayout.createParallelGroup()
		.addComponent(emailTextField, preferredSize, defaultSize, preferredSize)
		.addComponent(passwordField, preferredSize, defaultSize, preferredSize)
		.addComponent(loginButton, preferredSize, defaultSize, preferredSize));
	panelLayout.setVerticalGroup(
		panelLayout.createSequentialGroup()
		.addComponent(emailTextField, preferredSize, defaultSize, preferredSize)
		.addComponent(passwordField, preferredSize, defaultSize, preferredSize)
		.addComponent(loginButton, preferredSize, defaultSize, preferredSize));
}
```

Class autowiring support (default WindowListener from Yayoi framework):

```ceylon
listener
shared class DefaultWindowClosedAdapter() extends WindowAdapter() {
	
	autowired
	late ApplicationEventPublisher eventPublisher;
	
	shared actual void windowClosing(WindowEvent? e) =>
		eventPublisher.publishEvent(ShutdownRequested(this));
}
```