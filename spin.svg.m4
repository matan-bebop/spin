include(set_viewport.m4)

<svg id="svg-qubit" width="320" height="320"
	xmlns="http://www.w3.org/2000/svg">

	<!-- Axes arrow -->
	<marker id="triangle"
		viewBox="0 0 2 2" refX="0" refY="1" 
		markerUnits="userSpaceOnUse"
		markerWidth="LX(0.1)" markerHeight="LY(0.1)"
		orient="auto">
		<path d="M 0 0 L 2 1 L 0 2 z" fill="gray" />
	</marker>

	<!-- Red arrow for the qubit Bloch vector  -->
	<marker id="qu-triangle"
		viewBox="0 0 2 2" refX="0" refY="1" 
		markerUnits="userSpaceOnUse"
		preserveAspectRatio="none"
		markerWidth="LX(0.1)" markerHeight="LY(0.1)"
		orient="auto">
		<path d="M 0 0 L 2 1 L 0 2 z" fill="red"/>
	</marker>

	<!-- Axes and the Bloch sphere -->
	<g stroke="gray" fill="gray">

	<g id="xy">

	<circle cx="0" cy="0" r="1" fill="transparent"
		transform="matrix(LX(-sqrt(3)/2), LX(.5), LY(1), 0, DX, DY)"
		vector-effect="non-scaling-stroke"/>

	<line x1="X(0)" y1="Y(0)" x2="X(-1.3)" y2="Y(-.75)"
		marker-end="url(#triangle)"/> <!-- 0x -->

	<line x1="X(0)" y1="Y(0)" x2="X(1.5)" y2="Y(0)"
		marker-end="url(#triangle)"/> <!-- 0y -->

	</g>

	<g id="z">

	<line x1="X(0)" y1="Y(0)" x2="X(0)" y2="Y(1.5)"
		marker-end="url(#triangle)"/> <!-- 0z -->
	
	<circle cx="X(0)" cy="Y(0)" r="LX(1)" fill="transparent"/>

	</g>

	</g>

	<!-- Labels -->
	<g fill="black">

	<text x="X(-1.3)" y="BC(Y(-.75)+20)"> x </text>
	<text x="X(1.5)" y="BC(Y(0)+17)"> y </text>
	<text x="BC(X(0)+10)" y="Y(1.5)"> z </text>

	<g id="points" fill="black">
	<circle cx="X(0)" cy="Y(1)" r="3"/>
	<circle cx="X(0)" cy="Y(-1)" r="3"/>
	</g>

	<text x="BC(X(0)+5)" y="BC(Y(1)-7)"> |1⟩ </text>
	<text x="BC(X(0)+5)" y="BC(Y(-1)+17)"> |0⟩ </text>

	</g>

	<!-- The Bloch vector projection eye-helpers -->
	<g id="xyhelpers" stroke="gray" stroke-width="1" stroke-dasharray="2 2">
	<line id="helpx" x1="X(0)" y1="Y(0)" x2="X(0)" y2="Y(0)"/>
	<line id="helpy" x1="X(0)" y1="Y(0)" x2="X(0)" y2="Y(0)"/>
	</g>
	<line id="helpxy" x1="X(0)" y1="Y(0)" x2="X(0)" y2="Y(0)"
		stroke="gray" stroke-width="1" stroke-dasharray="2 2"/>
	<!-- Bloch vector projections on 0x and 0y -->
	<g id="projs" stroke="black" stroke-width="1">
	<line id="projx" x1="X(0)" y1="Y(0)" x2="X(0)" y2="Y(0)"/>
	<line id="projy" x1="X(0)" y1="Y(0)" x2="X(0)" y2="Y(0)"/>
	</g>

	<!-- Bloch vector; length is 0.9 due to the arrowhead -->
	<line id="bloch-vector" x1="X(0)" y1="Y(0)" x2="X(0)" y2="Y(-0.9)"
		stroke="red" stroke-width="3" marker-end="url(#qu-triangle)"/>

	<!-- Redraw elements if they are in front of the Bloch vector -->
	<g id="overxy" opacity="1">
	<use href="#xy" stroke="gray"/>
	<use href="#xyhelpers"/>
	<use href="#projs"/>
	</g>

	<g id="overz" opacity="0">
	<use href="#z" stroke="gray"/>
	<use href="#points"/>
	</g>

	<use id="overhelpxy" href="#helpxy"/>

	<!-- Trace of the Bloch vector tip -->
	<path id="trace" d="M X(0) Y(-1)" fill="transparent" stroke="blue"/>

	<!-- Rotation buttons -->
	<g opacity="0">
	<polygon id="rot-x" points="X(0),Y(0) X(-1.3),Y(-.9) X(-1.3),Y(-.6)"/>
	<polygon id="rot-y" points="X(0),Y(0) X(1.5),Y(-.15) X(1.5),Y(.15)"/>
	<polygon id="rot-z" points="X(0),Y(0) X(-.15),Y(1.5) X(.15),Y(1.5)"/>
	</g>

</svg>

