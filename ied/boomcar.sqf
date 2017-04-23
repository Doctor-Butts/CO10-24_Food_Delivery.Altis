
_pos = getPos _this;
//"Bo_GBU12_LGB_MI10" createVehicle _pos;
"Bo_GBU12_LGB_MI10" createVehicle [_pos select 0, _pos select 1, -0.1];
playSound3d["A3\Missions_F_EPA\data\sounds\combat_deafness.wss", objNull, false, _pos, 1, 1];