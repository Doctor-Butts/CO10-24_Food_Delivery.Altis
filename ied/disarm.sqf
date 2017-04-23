private ["_bomb","_pos","_ratio"];

_bomb = _this select 0;
_pos = getPos _bomb;

hint "Attempting to Disarm IED";
player SwitchMove "AinvPknlMstpSnonWnonDnon_medic0";
sleep 6;

	_ratio = 50;
	if (typeOf player == "rhsusf_army_ocp_explosives") then {_ratio = 100;};
	if (random 100 > _ratio) then {
		deleteVehicle _bomb;
		"Bo_GBU12_LGB_MI10" createVehicle _pos;
		playSound3d["A3\Missions_F_EPA\data\sounds\combat_deafness.wss", objNull, false, _pos, 1, 1];
		} else	{
		hint "IED disarmed!";
		deleteVehicle _bomb;
	};

