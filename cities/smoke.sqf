_pos = _this select 0;
while {true} do
{
  _smoke="SmokeShellGreen" createVehicle [getPos _pos select 0,getPos _pos select 1, .2];
  sleep 60;
};