include(set_viewport.m4)

function Spin() {

this.Sx = 0; this.Sy = 0; this.Sz = -1

this.advance_paulis = function(dt, Wx, Wy, Wz)
{
	this.Sx += (Wy*this.Sz - Wz*this.Sy)*dt
	this.Sy += (-Wx*this.Sz + Wz*this.Sx)*dt
	this.Sz += (Wx*this.Sy - Wy*this.Sx)*dt
}

} // end Spin


function cabinet_projector(theta)
{
	const pi = Math.PI, sin = Math.sin, cos = Math.cos

	return function project(x, y, z) {
		var	px = y - x*sin(pi*theta/180),
			py = z - x*cos(pi*theta/180) 

		return [px, py]
	}
}


function SpinView(s, doc, projector) {

this.trace_on = false

var proj = projector
if(typeof proj === 'undefined')
	proj = cabinet_projector(60)

var bloch_vec = doc.getElementById("bloch-vector"),
	projx = doc.getElementById("projx"),
	projy = doc.getElementById("projy"),
	helpx = doc.getElementById("helpx"),
	helpy = doc.getElementById("helpy"),
	helpxy = doc.getElementById("helpxy"),
	qu_head = doc.getElementById("qu-triangle"),
	overxy = doc.getElementById("overxy"),
	overz = doc.getElementById("overz"),
	overhelpxy = doc.getElementById("overhelpxy"),
	trace = doc.getElementById("trace")

function move_bloch_vector()
{
	var xy = proj(s.Sx, s.Sy, s.Sz)
	var x = xy[0], y = xy[1]

	var scr_bx = 0.9*x*SX + DX,
		scr_by = 0.9*y*SY + DY; // vector shaft tip
	bloch_vec.setAttribute("x2", scr_bx)
	bloch_vec.setAttribute("y2", scr_by)
	scr_bx = x*SX + DX; scr_by = y*SY + DY; // shaft + arrowhead
	// set the arrowhead length
	qu_head.setAttribute("markerWidth",
		0.1*Math.sqrt(BC(SX^2)*x*x + BC(SY^2)*y*y))

	return {x:scr_bx, y:scr_by}
}

function correct_depth_order()
{
	// Behind or over the XY plane elements?
	overxy.setAttribute("opacity", 1*(s.Sz < 0))
	// ... the 0z axis?
	overz.setAttribute("opacity", 1*(s.Sx < 0))
	// ... the xy plane projection helper
	overhelpxy.setAttribute("opacity", 1*(s.Sx > 0))
}

function move_projections(scr_b)
{
	var scr_pyx = s.Sy*SX + DX, scr_pzy = s.Sz*SY + DY;
	projy.setAttribute("x2", scr_pyx)
	xy = proj(s.Sx, 0, 0)
	var x = xy[0], y = xy[1]
	var scr_pxx = x*SX + DX, scr_pxy = y*SY + DY
	projx.setAttribute("x2", scr_pxx)
	projx.setAttribute("y2", scr_pxy)

	xy = proj(s.Sx, s.Sy, 0)
	x = xy[0], y = xy[1]
	var scr_pxy_x = x*SX + DX, scr_pxy_y = y*SY + DY

	helpx.setAttribute("x1", scr_pxy_x)
	helpx.setAttribute("y1", scr_pxy_y)
	helpy.setAttribute("x1", scr_pxy_x)
	helpy.setAttribute("y1", scr_pxy_y)
	helpx.setAttribute("y2", scr_pxy)
	helpx.setAttribute("x2", scr_pxx)
	helpy.setAttribute("x2", scr_pyx)
	helpxy.setAttribute("x1", scr_pxy_x)
	helpxy.setAttribute("y1", scr_pxy_y)
	helpxy.setAttribute("x2", scr_b.x)
	helpxy.setAttribute("y2", scr_b.y)
}

this.prev_scr_b = {x:Infinity, y:Infinity}
var this_trace_add_node = (function(scr_b)
{
	var d = trace.getAttribute("d"),
		// Start a new trace if we are too far away from the old one
		new_trace = Math.abs(this.prev_scr_b.x - scr_b.x) > 5.00 &&
					Math.abs(this.prev_scr_b.y - scr_b.y) > 5.00
	
	// If we are to start a new trace, merely move to its start;
	// continue the old trace otherwise
	trace.setAttribute("d", d + (new_trace? " M ":" L ")
		   					+ scr_b.x + " " + scr_b.y)

	this.prev_scr_b = scr_b
}).bind(this)

this.move_all = function()
{
	var scr_b = move_bloch_vector()
	move_projections(scr_b)
	correct_depth_order()
	if(this.trace_on) 
		this_trace_add_node(scr_b)
}

this.clear_trace = function()
{
	var xy = proj(s.Sx, s.Sy, s.Sz),
		scr_x = xy[0]*SX + DX, scr_y = xy[1]*SY + DY;
	trace.setAttribute("d", "M " + scr_x + " " + scr_y)
}

} // end SpinView

