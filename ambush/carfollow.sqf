_fol = [] spawn { 
 while {alive suicardriver_2} do { 
  suicardriver_2 doMove (position foodveh); 
  sleep 1; 
 }; 
};

suicardriver_2 moveindriver suicar_2;
suicardriver_2 setBehaviour "CARELESS";
suicardriver_2  setSpeedMode "FULL";