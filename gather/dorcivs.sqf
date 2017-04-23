_radius = 200;
_dorcivarr = nearestObjects [foodveh, ["C_man_p_beggar_F"], _radius];

{
	while 
	{(count (waypoints group _x)) > 0}
	do 
	{ 
	deleteWaypoint ((waypoints group _x) select 0); 
	};

	_swp0 = group _x addWaypoint [position foodveh, 0];
	[group _x, 0] setWaypointCompletionRadius 0;
	_x setBehaviour "CARELESS";
	_swp0 setWaypointStatements ["true", "_nul = this execVM 'gather\gather.sqf'"];
} forEach _dorcivarr;