_thebrief = [] execVM "briefing.sqf";
//enableSentences false;
enableRadio false;
{ 
    _x addAction ["Disarm IED","ied\disarm.sqf",nil,6,true,true,"","",3];
    _neartrig = createTrigger ["EmptyDetector", getPos _x]; 
    _neartrig setTriggerArea [20, 20, 0, false]; 
    _neartrig triggerAttachVehicle [foodveh];
	_neartrig setvariable ["myBarrel", _x];
    _neartrig setTriggerStatements ["this","(thisTrigger getVariable 'myBarrel') execVM 'ied\boom.sqf'", ""]; 
} forEach (allMissionObjects "Land_BarrelSand_grey_F");

{
    if(side _x == east) then
    {
		_x execVM "gear\eastGear.sqf";
		_x disableAI "AUTOCOMBAT";
		_x disableAI "FSM";
		_x setBehaviour "CARELESS";
    };
} foreach (allUnits);

{
    if(side _x == resistance) then
    {
		_x setSkill ["commanding", 0.8];
		_x setSkill ["spotDistance", 0.7];
		_x setSkill ["spotTime", 0.6];
    };
} foreach (allUnits);

{
    if(side _x == civilian) then
    {
		_x execVM "gear\civGear.sqf";
		_x disableAI "AUTOCOMBAT";
		//_x disableAI "FSM";
		_x setBehaviour "CARELESS";
    };
} foreach (allUnits);

tasksdone = 0;
nearcity = false;


SHK_DeadCivilianCount = 20;
SHK_DeadCivilianLimit = 0;
SHK_EndMission = false;
[] spawn {
 waituntil {sleep 10; SHK_EndMission};
 cuttext ["Too many civilians have died.","PLAIN",2];
  "end3" call BIS_fnc_endMissionServer;;
};

SHK_fnc_deadCivilians = {
 hintsilent format ['If %1 more Civilians die, the mission will fail.',_this];
 if (_this <= SHK_DeadCivilianLimit) then {
   SHK_EndMission = true;
   publicvariable "SHK_EndMission";
 };
};
SHK_eh_killed = {
waituntil {triggerActivated safety};
 SHK_DeadCivilianCount = SHK_DeadCivilianCount - 1;
 publicvariable "SHK_DeadCivilianCount";
 if isdedicated then {
   if (_this >= SHK_DeadCivilianLimit) then {
     SHK_EndMission = true;
     publicvariable "SHK_EndMission";
   };
 } else {
   SHK_DeadCivilianCount call SHK_fnc_deadCivilians;
 };
};
if isserver then {
 {
   if (side _x == Civilian && _x iskindof "Man") then {
     _x addEventHandler ["killed", SHK_eh_killed];
   };
 } foreach allunits;
} else {
 "SHK_DeadCivilianCount" addpublicvariableeventhandler { (_this select 1) call SHK_fnc_deadCivilians };
};

out_of_safe_zone = {
_imgl  = "<img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\intel_ca.paa' align='left' color='#ffff00'/>";
_title  = "<t size='1.2' align='center' color='#ffff00'>Out of Safe Zone</t>
";
_text   = "<t align='left'><br/><br/>Food Truck has left the safe zone and must stay on roads. If it leaves the road for 10 seconds, mission will fail.<br/><br/>Civilian deaths should now count against your side.</t>";
hint parseText (_imgl + _title +_text);
playSound "oosafezone";
};
off_road = {
_imgl  = "<img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\danger_ca.paa' align='left' color='#ff0000'/>";
_imgr  = "<img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\danger_ca.paa' align='right' color='#ff0000'/>";
_title  = "<t color='#ff0000' size='1.2' align='center'>WARNING!</t>
";
_text   = "<t align='left' color='#ff0000'><br/><br/>Food Truck must return to road in 10 seconds or mission will fail</t>";
hint parseText (_imgl + _title + _imgr +_text);
playSound "offroad1";
sleep 3;
hint "";
};
on_road = {
_imgl  = "<img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\truck_ca.paa' align='left' color='#00ff00'/>";
_title  = "<t color='00ff00' size='1.2' align='center' color='#00ff00'>Truck On Road</t>
";
_text   = "<t align='left'><br/><br/>Food Truck is back on the road</t>";
hint parseText (_imgl + _title +_text);
playSound "onroad1";
sleep 3;
hint "";
};
in_trigger = {
_imgl  = "<img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\meet_ca.paa' align='left' color='#00ffff'/>";
_title  = "<t color='#00ffff' size='1.2' align='center'>In Delivery Area</t>
";
_text   = "<t align='left'><br/><br/>Give Citizens 3 minutes to gather food.</t>";
hint parseText (_imgl + _title +_text);
playSound "onroad1";
sleep 3;
hint "";
};
out_trigger =  {
_imgl  = "<img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\navigate_ca.paa' align='left' color='#ff8000'/>";
_title  = "<t color='#ff8000' size='1.2' align='center'>Left Delivery Area</t>
";
_text   = "<t align='left'><br/><br/>Food Truck must be in delivery zone for 3 minutes before task will be completed.</t>";
hint parseText (_imgl + _title +_text);
playSound "offroad1";
sleep 3;
hint "";
};
get_to_end = {
_imgl  = "<img image='\A3\ui_f\data\IGUI\Cfg\simpleTasks\types\intel_ca.paa' align='left' color='#ff72ad'/>";
_title  = "<t size='1.2' align='center' color='#ff72ad'>Almost There</t>
";
_text   = "<t align='left'><br/><br/>Food Truck no longer has to be operational nor does it have to stick to the road to complete the mission.</t>";
hint parseText (_imgl + _title +_text);
playSound "oosafezone";
};

group command_sq_1 setGroupIDGlobal ["Command"];
group transport_sq_1 setGroupIDGlobal ["Transport"];
group escort1_sq_1 setGroupIDGlobal ["Escort 1"];
group escort2_sq_1 setGroupIDGlobal ["Escort 2"];
group escort3_sq_1 setGroupIDGlobal ["Escort 3"];
group escort4_sq_1 setGroupIDGlobal ["Escort 4"];