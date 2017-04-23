/* _bombcar = _this;
_cbomb = "Land_MetalBarrel_F" createVehicle position _bombcar;
_cbomb attachTo [_bombcar, [0, -1, -0.2] ]; _cbomb setVectorDirAndUp [ [1, 90, 0], [0, 1, 0] ];
_ctrig = createTrigger ["EmptyDetector", getPos _bombcar];
_ctrig setTriggerArea [20, 20, 0, false]; 
_ctrig attachTo [_bombcar,[0,0,0]];
_ctrig setvariable ["expBarrel", _cbomb];
_ctrig setvariable ["bocar", _bombcar];
_ctrig setTriggerStatements ["(alive driver (thisTrigger getVariable 'bocar')) and (vehicle foodveh distance vehicle (thisTrigger getVariable 'expBarrel') < 20);","(thisTrigger getVariable 'expBarrel') execVM 'ied\boomcar.sqf'",""];
 */
_bombcar = _this;

_cbomb = "Land_MetalBarrel_F" createVehicle [0, 0, 0];
_cbomb attachTo [_bombcar, [0, -1, -0.2] ]; 
_cbomb setVectorDirAndUp [ [1, 90, 0], [0, 1, 0] ];
_cbomb setVectorDirAndUp [ [0, 1, 0], [0, 1, 0] ];

waitUntil { sleep 0.2; alive (driver _bombcar) && (foodVeh distance _cbomb) < 20; };

_cbomb execVM "ied\boomcar.sqf";