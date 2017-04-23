/*     _bartthing = _this;
	_bartthing addAction ["Disarm IED","ied\disarm.sqf",nil,6,true,true,"","",1]; 
    _neartrig = createTrigger ["EmptyDetector", getPos _bartthing]; 
    _neartrig setTriggerArea [20, 20, 0, false]; 
    _neartrig triggerAttachVehicle [foodveh]; 
	_neartrig setvariable ["aBarrel", _bartthing];
    _neartrig setTriggerStatements ["this","(thisTrigger getVariable 'aBarrel') execVM 'ied\boom.sqf'", ""];  */