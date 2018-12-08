import it.feelburst.yayoi.marker {
	yayoi
}
import it.feelburst.yayoi.model.impl {
	swingFramework
}
import it.feelburst.yayoi.model.window {
	Window
}

import java.lang {
	Runnable
}

import javax.swing {
	JFrame
}

import org.springframework.beans.factory.annotation {
	autowired
}

yayoi(
	{`package it.feelburst.yayoi.usecase`},
	`value swingFramework`)
shared class App() satisfies Runnable {
	
	autowired
	shared late Window<JFrame> login;
	
	shared actual void run() {}
	
}
