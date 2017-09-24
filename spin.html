<!DOCTYPE html>
<html>
<head>
	<meta name="author" content="Андрій Соколов">
	<meta charset="UTF-8">
</head>

<body>

<object id="spin" width="320" height="320" type="image/svg+xml" data="spin.svg"></object>

<script src="spin.js"></script>

<script>

var s = new Spin,
	sv // to be a SpinView instance

window.onload = function() { // Hook to the SVG DOM when it is ready
	var svg_doc = document.getElementById("spin").contentDocument
	sv = new SpinView(s, svg_doc)

	// Setup controls
	svg_doc.getElementById("rot-x").onmousedown = function() { Wx = W }
	svg_doc.getElementById("rot-y").onmousedown = function() { Wy = W }
	svg_doc.getElementById("rot-z").onmousedown = function() { Wz = W }

	svg_doc.getElementById("rot-x").onmouseup = function() { Wx = 0 }
	svg_doc.getElementById("rot-y").onmouseup = function() { Wy = 0 }
	svg_doc.getElementById("rot-z").onmouseup = function() { Wz = 0 }
}

var Wx, Wy, Wz; Wx = Wy = Wz = 0
const W = 0.5e-3

var prev_t = null

function animation_step(t) // [t] = ms
{
	var dt

	if (!prev_t) prev_t = t
	else if (Wx != 0 || Wy != 0 || Wz != 0){
		dt = t - prev_t; prev_t = t

		// Don't move if we were idling for too much, e.g. the window was 
		// inactive for some time
		if(W*dt < 0.1) { 
			s.advance_paulis(dt, Wx, Wy, Wz)
			sv.move_all()
		}
	}

	window.requestAnimationFrame(animation_step)
}

window.requestAnimationFrame(animation_step)

// Applies a sequence of pulses.
// An argument is an array of objects [{axis:[x,y,z], phi:angle}, ...].
// Here x, y, z give the rotation axis direction; phi is the rotation angle
function pulse_seq(vs)
{	
	function normalize(v)
	{	
		len = Math.sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
		v[0] /= len; v[1] /= len; v[2] /= len
	}
		
	if(!vs.length) {
		Wx = Wy = Wz = 0
		return
	}

	normalize(vs[0].axis)

	Wx = W * vs[0].axis[0] * Math.sign(vs[0].phi)
	Wy = W * vs[0].axis[1] * Math.sign(vs[0].phi)
	Wz = W * vs[0].axis[2] * Math.sign(vs[0].phi)

	window.setTimeout(function () { pulse_seq(vs.slice(1)) },
						 Math.abs(vs[0].phi)/W)
}

</script>

</body>
</html>
