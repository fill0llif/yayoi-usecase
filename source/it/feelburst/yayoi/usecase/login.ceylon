import it.feelburst.yayoi.marker {
	window,
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
	setLookAndFeel,
	named
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
size(270,150)
centered
exitOnClose
shared JFrame login() =>
	JFrame("Takane");

container
parent("login()")
withLayout("panelGroupLayout()")
shared JPanel panel() =>
	JPanel();
	
layout
shared GroupLayout panelGroupLayout(
	named("login().panel()") JPanel panel) {
	value groupLayout = GroupLayout(panel);
	groupLayout.autoCreateContainerGaps = true;
	groupLayout.autoCreateGaps = true;
	return groupLayout;
}
	
component
parent("login().panel()")
shared object emailTextField extends JTextField(20) {}
	
component
parent("login().panel()")
shared object passwordField extends JPasswordField(20) {}
	
component
parent("login().panel()")
onActionPerformed("loginButtonListener")
shared object loginButton extends JButton("Ok") {}
	

listener
shared object loginButtonListener satisfies ActionListener {
	shared actual void actionPerformed(ActionEvent? e) {
		print("On Action Performed");
	}
}

doLayout("login().panel()")
shared void doPanelLayout(
	named("panelGroupLayout()") GroupLayout panelGroupLayout, 
	named("login().panel()") JPanel panel, 
	named("login().panel().emailTextField") JTextField emailTextField,
	named("login().panel().loginButton") JButton loginButton, 
	named("login().panel().passwordField") JPasswordField passwordField) {
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
