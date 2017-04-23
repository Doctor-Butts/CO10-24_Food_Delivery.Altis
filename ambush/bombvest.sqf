	_vbomb = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _this;
	_vbomb attachTo [_this, [0, 0.14, 0], "spine3"]; 
	_vbomb setVectorDirAndUp [ [0, 0, -1], [0, 1, 0] ];
	waitUntil {sleep 0.4; (alive _this) and (vehicle foodveh distance vehicle _this < 15 )};
	_vbomb setDamage 1;