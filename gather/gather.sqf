_this playActionNow "PlayerCrouch";
sleep 3;
_this addBackpack "B_Carryall_khk"; 
_this playAction "Stand";
//_this enableAI "FSM";
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