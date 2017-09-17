# spin

An HTML5 interactive Bloch sphere.

## How to build a working HTML

### Prerequisites

To build you need an m4 preprocessor.
To install it e.g. in Debian run

```
apt-get install m4
```

### Building

Simply type

```
make
```

## Run and use

Open spin.html in your favorite browser.

To rotate the Bloch vector interactively, push the left mouse button on an axis.It will rotate around that axe.

To apply a pulse sequence to the spin, use the ``pulse_seq`` function in the JavaScript console.
Its argument is an array of objects [{axis:[x,y,z], phi:angle}, ...].
Here x, y, z give the rotation axis direction; phi is the rotation angle
For example,

```
pulse_seq([{axis:[0,1,0], phi:Math.PI/2}, {axis:[0,0,1], phi:Math.PI}])
```

rotates the spin first by π/2 around the y axis, then by π around the z axis.
