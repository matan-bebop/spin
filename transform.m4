divert(-1)

define(`BC', `esyscmd(echo "scale=4; print $1" | bc)')
define(`ABS', `translit($1, `-', `')')

define(`DX', 0)
define(`DY', 0)

define(`TRANSLATE', `define(`DX', BC(DX+$1*SX))define(`DY', BC(DY+$2*SY))')

define(`SX', 1)
define(`SY', 1)

define(`SCALE',`define(`SX', BC(SX*$1))define(`SY', BC(SY*$2))')

define(`REMEMBER',dnl
``define(`DX','DX`)define(`DY','DY`)define(`SX','SX`)define(`SY','SY`)'')

define(`PUSH',`pushdef(`POP',REMEMBER`popdef(`POP')')')

define(`X', `BC($1*SX + DX)')
define(`Y', `BC($1*SY + DY)')
define(`LX', `BC($1*ABS(SX))')
define(`LY', `BC($1*ABS(SY))')

divert
