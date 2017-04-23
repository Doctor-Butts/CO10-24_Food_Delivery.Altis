"panmark" setmarkercolor "ColorBlack";
tasksdone = tasksdone +1;
deletevehicle paninandout;
deleteVehicle truckonoffroad;
deleteVehicle foodvehoffroad;
deleteVehicle trucksdead;
_radius = 200;
_dorcivarr = nearestObjects [foodveh, ["C_man_p_beggar_F"], _radius];
{
	deleteVehicle _x
} forEach _dorcivarr;
sleep 10;