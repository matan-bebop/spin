all: spin.html

spin.svg: spin.svg.m4 set_viewport.m4 transform.m4
	m4 spin.svg.m4 > spin.svg

spin.js: spin.js.m4 set_viewport.m4 transform.m4
	m4 spin.js.m4 > spin.js

spin.html: spin.html.m4 spin.js spin.svg set_viewport.m4 transform.m4
	m4 spin.html.m4 > spin.html
