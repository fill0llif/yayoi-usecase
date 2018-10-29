import it.feelburst.yayoi.marker {
	yayoi
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
import it.feelburst.yayoi.model {
	swingFramework
}

yayoi(
	{`package it.feelburst.yayoi.usecase`},
	`value swingFramework`)
shared class App() satisfies Runnable {
	
	autowired
	shared late Window<JFrame> login;
	
	shared actual void run() {}
	
}