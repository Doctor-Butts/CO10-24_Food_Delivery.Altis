_radius = 100;
_ambush1 = nearestObjects [ambushtrig_1, ["O_Soldier_A_F"], _radius];
//rem to change all _this to _x in block below
{
	_x addVest "V_Chestrig_blk";
	_x doMove (position ambushtrig_1);
	randomguns = round (random 4);

		switch (randomguns) do
	{
		case 0:
		{
		for "_i" from 1 to 5 do {_x addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		_x addweapon "arifle_TRG21_ACO_pointer_F";
		};
		case 1:
		{
		_x addBackpack "B_AssaultPack_blk";
		for "_i" from 1 to 2 do {_x addItemToBackpack "150Rnd_93x64_Mag";};
		_x addweapon "MMG_01_tan_F";
		};
		case 2:
		{
		_x addBackpack "B_AssaultPack_blk";
		for "_i" from 1 to 5 do {_x addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		for "_i" from 1 to 5 do {_x addItemToBackpack "1Rnd_HE_Grenade_shell";};
		_x addweapon "arifle_TRG21_GL_MRCO_F";
		};
		case 3:
		{
		for "_i" from 1 to 5 do {_x addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		_x addweapon "arifle_TRG20_ACO_Flash_F";
		};
		case 4:
		{
		_x addBackpack "B_AssaultPack_blk";
		for "_i" from 1 to 2 do {_x addItemToBackpack "RPG32_F";};
		for "_i" from 1 to 5 do {_x addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
		_x addweapon "arifle_TRG20_F";
		_x addWeapon "launch_RPG32_F";
		_x doMove (position foodveh);
		_x reveal foodveh;
		_x doTarget foodveh;
		};
	};
	
	
	_x doMove (position ambushtrig_1);
	_x setBehaviour "COMBAT";
	_x setCombatMode "RED";
	_x setSpeedMode "NORMAL";

} forEach _ambush1;