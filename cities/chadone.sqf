"chamark" setmarkercolor "colorblack";
tasksdone = tasksdone +1;
deletevehicle chalinout;
_radius = 200;
_dorcivarr = nearestObjects [foodveh, ["C_man_p_beggar_F"], _radius];
{
	deleteVehicle _x
} forEach _dorcivarr;
lamp_0 setPos (getMarkerPos "panlamp_0");
lamp_1 setPos (getMarkerPos "panlamp_1");
lamp_2 setPos (getMarkerPos "panlamp_2");
lamp_3 setPos (getMarkerPos "panlamp_3");