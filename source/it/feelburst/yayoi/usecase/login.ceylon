import it.feelburst.yayoi.marker {
	window,
	title,
	size,
	centered,
	exitOnClose,
	parent,
	component,
	listener,
	doLayout,
	layout,
	container,
	onActionPerformed,
	withLayout,
	setLookAndFeel
}

import java.awt.event {
	ActionListener,
	ActionEvent
}

import javax.swing {
	JFrame,
	JPanel,
	JTextField,
	JPasswordField,
	GroupLayout {
		preferredSize,
		defaultSize
	},
	JButton,
	UIManager
}

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
	GroupLayout panelGroupLayout, 
	JPanel panel, 
	JTextField emailTextField,
	JButton loginButton, 
	JPasswordField passwordField) {
	panelGroupLayout.setHorizontalGroup(
		panelGroupLayout.createParallelGroup()
		.addComponent(emailTextField, preferredSize, defaultSize, preferredSize)
		.addComponent(passwordField, preferredSize, defaultSize, preferredSize)
		.addComponent(loginButton, preferredSize, defaultSize, preferredSize));
	panelGroupLayout.setVerticalGroup(
		panelGroupLayout.createSequentialGroup()
		.addComponent(emailTextField, preferredSize, defaultSize, preferredSize)
		.addComponent(passwordField, preferredSize, defaultSize, preferredSize)
		.addComponent(loginButton, preferredSize, defaultSize, preferredSize));
}
