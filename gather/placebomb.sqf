//_bombplacer = _this select 0;
_this addBackpack "B_AssaultPack_blk"; 
_this addMagazine "SatchelCharge_Remote_Mag"; 
_this playActionNow "PlayerCrouch";
_this fire ["pipebombmuzzle", "pipebombmuzzle", "SatchelCharge_Remote_Mag"];
removeBackpack _this;
sleep 0.5;
_this playAction "Stand";
_this enableAI "ALL";
_this setSpeedMode "NORMAL";
_this setBehaviour "CARELESS";

randomflee = round (random 3);

switch (randomflee) do
{
case 0:
		{
		_this doMove (position lamp_0);
		};
case 1:
		{
		_this doMove (position lamp_1);
		};
case 2:
		{
		_this doMove (position lamp_2);
		};
case 3:
		{
		_this doMove (position lamp_3);
		};
};
sleep 20;
_this action ["TouchOff", _this];