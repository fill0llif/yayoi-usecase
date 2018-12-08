import it.feelburst.yayoi {
	Yayoi
}
import ceylon.logging {

	logger,
	debug
}

shared void run() =>
	Yayoi(`class App`,
	() {
		logger(`package it.feelburst.yayoi.model.window.swing`).priority = debug;
	}).run();
