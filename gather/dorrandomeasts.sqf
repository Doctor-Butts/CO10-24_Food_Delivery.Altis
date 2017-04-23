_radius = 200;
_dorrandeastarr = nearestObjects [foodveh, ["O_Soldier_A_F"], _radius];

{
	while 
	{(count (waypoints group _x)) > 0}
	do 
	{ 
	deleteWaypoint ((waypoints group _x) select 0); 
	};
	
	randomeast = round (random 2);
	
	switch (randomeast) do
	{
		case 0:
		{
		_vbomb = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _x;
		_vbomb attachTo [_x, [0, 0.14, 0], "spine3"];
		_vbomb setVectorDirAndUp [ [0, 0, -1], [0, 1, 0] ];
		_swp0 = group _x addWaypoint [position foodveh, 0];
		[group _x, 0] setWaypointCompletionRadius 0;
		_x setSpeedMode "FULL";
		_x setBehaviour "CARELESS";
		waitUntil {sleep 0.2; (alive _x) and (foodveh distance _x < 15 )};
		_vbomb setDamage 1;
		};
		case 1:
		{
		removeHeadgear _x;
		removeGoggles _x;
		_x addGoggles "G_Bandanna_aviator";
		_x enableAI "ALL";
		_x setBehaviour "COMBAT";
		for "_i" from 1 to 3 do {_x addItemToUniform "HandGrenade";};
		_swp1 = group _x addWaypoint [position foodveh, 0];
		[group _x, 0] setWaypointCompletionRadius 20;
		[group _x, 0] setWaypointType "SAD";
		};
		case 2:
		{
		_swp2 = group _x addWaypoint [position foodveh, 0];
		[group _x, 0] setWaypointCompletionRadius 0;
		_x setBehaviour "CARELESS";
		_swp2 setWaypointStatements ["true", "_nul = this execVM 'gather\placebomb.sqf'"];
		};
	};

} forEach _dorrandeastarr;