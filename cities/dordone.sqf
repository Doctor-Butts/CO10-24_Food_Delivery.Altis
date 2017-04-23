"dormark" setmarkercolor "ColorBlack";
tasksdone = tasksdone +1;
deletevehicle doridainout;
_radius = 200;
_dorcivarr = nearestObjects [foodveh, ["C_man_p_beggar_F"], _radius];
{
	deleteVehicle _x
} forEach _dorcivarr;
lamp_0 setPos (getMarkerPos "chalklamp_0");
lamp_1 setPos (getMarkerPos "chalklamp_1");
lamp_2 setPos (getMarkerPos "chalklamp_2");
lamp_3 setPos (getMarkerPos "chalklamp_3");