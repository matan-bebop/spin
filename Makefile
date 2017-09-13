all: spin.html

spin.html: spin.html.m4 transform.m4
	m4 spin.html.m4 > spin.html
