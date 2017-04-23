//REMEMBER: OPFOR supposed to look civilian, receive weapons on script, not at mission begin. OPFOR are sui bombers, tricksters, etc.
_class = typeOf _this;

removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;

	randomuni = round (random 12);
	//diag_log("randomvar = " + str(randomvar));
	randomvest = round (random 3);
	randomhat = round (random 8);
	
	switch (randomuni) do
	{
		case 0:
		{
			_this forceAddUniform "U_C_Poloshirt_blue";
		};
		case 1:
		{
			_this forceAddUniform "U_C_Poloshirt_stripped";
		};
		case 2:
		{
			_this forceAddUniform "U_Rangemaster";
		};
		case 3:
		{
			_this forceAddUniform "U_OrestesBody";
		};
		case 4:
		{
			_this forceAddUniform "U_C_HunterBody_grn";
		};
		case 5:
		{
			_this forceAddUniform "U_C_WorkerCoveralls";
		};
		case 6:
		{
			_this forceAddUniform "U_C_Journalist";
		};
		case 7:
		{
			_this forceAddUniform "U_C_Poloshirt_redwhite";
		};
		case 8:
		{
			_this forceAddUniform "U_Competitor";
		};
		case 9:
		{
			_this forceAddUniform "U_C_Poor_1";
		};
		case 10:
		{
			_this forceAddUniform "U_C_Poloshirt_blue";
		};
		case 11:
		{
			_this forceAddUniform "U_Marshal";
		};
		case 12:
		{
			_this forceAddUniform "U_C_Man_casual_6_F";
		};
	};
	switch (randomhat) do
	{
		case 0:
		{
			_this addHeadgear "H_Booniehat_khk";
		};
		case 1:
		{
			_this addHeadgear "H_Cap_blu";
		};
		case 2:
		{
			_this addHeadgear "H_Cap_blk_ION";
		};
		case 3:
		{
			_this addHeadgear "H_Hat_tan";
		};
		case 4:
		{
			_this addHeadgear "H_Beret_red";
		};
		case 5:
		{
			removeHeadgear _this;
		};
		case 6:
		{
			removeHeadgear _this;
		};
		case 7:
		{
			removeHeadgear _this;
		};
		case 8:
		{
			removeHeadgear _this;
		};
	};
	
	_this addItemToUniform "ACE_epinephrine";