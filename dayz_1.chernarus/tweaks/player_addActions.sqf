private["_mags","_dogsFly","_playerChanged","_ehWall"];
while {speed player < 2.5} do {sleep 1;};

remProc = true;
_playerChanged = true;
_dogsFly = true;
hasBuildItem = false;
sleep 1;
//Out Temporarily:
//cursortarget iskindof 'Base_WarfareBBarrier10xTall' && cursorTarget distance player < 5 or 

while {_dogsFly} do {
if (_playerChanged) then {
player addaction [("<t color=""#F01313"">" + ("Remove Object") +"</t>"),"tweaks\player_remove.sqf","",1,true,true,"",
"remProc && (cursortarget iskindof 'Base_WarfareBBarrier10x' && cursorTarget distance player < 5 or 
cursortarget iskindof 'Land_fort_rampart_EP1' && cursorTarget distance player < 5 or 
cursortarget iskindof 'Land_HBarrier_large' && cursorTarget distance player < 5 or 
cursortarget iskindof 'Land_fortified_nest_small' && cursorTarget distance player < 5 or 
cursortarget iskindof 'Land_HBarrier1' && cursorTarget distance player < 5 or 
cursortarget iskindof 'Land_BagFenceRound' && cursorTarget distance player < 5 or 
cursortarget iskindof 'Land_fort_bagfence_long' && cursorTarget distance player < 5 or 
cursortarget iskindof 'Misc_Cargo1Bo_military' && cursorTarget distance player < 5 or 
cursortarget iskindof 'Ins_WarfareBContructionSite' && cursorTarget distance player < 5 or 
cursortarget iskindof 'Hhedgehog_concrete' && cursorTarget distance player < 5 or 
cursortarget iskindof 'Misc_cargo_cont_small_EP1' && cursorTarget distance player < 5 or 
cursortarget iskindof 'Land_prebehlavka' && cursorTarget distance player < 5 or 
cursortarget iskindof 'Fence_corrugated_plate' && cursorTarget distance player < 5 or 
cursortarget iskindof 'Land_CncBlock' && cursorTarget distance player < 5 or 
cursortarget iskindof 'ZavoraAnim' && cursorTarget distance player < 5 or 
cursortarget iskindof 'Fort_RazorWire' && cursorTarget distance player < 5 or 
cursortarget iskindof 'Fence_Ind' && cursorTarget distance player < 5 or 
cursortarget iskindof 'Land_tent_east' && cursorTarget distance player < 5 or
cursortarget iskindof 'Fence_Ind_long' && cursorTarget distance player < 5 or 
cursortarget iskindof 'Land_tent_east' && cursorTarget distance player < 5)"];
player addaction [("<t color=""#F01313"">" + ("Remove Netting") +"</t>"),"tweaks\player_remove.sqf","",1,true,true,"",
"remProc && isNull cursortarget && (camoNetB_East distance player < 10 or 
camoNetVar_East distance player < 10 or 
camoNet_East distance player < 10 or 
camoNetB_Nato distance player < 10 or 
camoNetVar_Nato distance player < 10 or 
camoNet_Nato distance player < 10)"];
// player addaction [("<t color=""#F01313"">" + ("Disarm Bomb") +"</t>"),"tweaks\player_disarmBomb.sqf","",1,true,true,"",
// "remProc && cursortarget iskindof 'Grave' && cursortarget distance player < 2.5"];
player addaction [("<t color=""#0074E8"">" + ("Build Recipes") +"</t>"),"tweaks\player_recipeBook.sqf","",5,false,true,"",
"(speed player <= 1) && hasBuildItem"];
player addaction [("<t color=""#4DFF0D"">" + ("Enter Key Code to Operate Gate") +"</t>"),"fnc_keyPad\enterCode.sqf","",5,false,true,"",
"(speed player <= 1) && !keyValid &&  cursortarget iskindof 'Infostand_2_EP1' cursorTarget distance player < 5"];
_ehWall = player addEventHandler ["AnimChanged", { player call antiWall; } ];
_playerChanged = false;
};

//survivor skin 1
	if (player iskindof "SurvivorW2_DZ") then {
		while {player iskindof "SurvivorW2_DZ"} do 
		{
			_mags = magazines player;
			if ("ItemTankTrap" in _mags || "ItemSandbag" in _mags || "ItemWire" in _mags || "PartWoodPile" in _mags || "PartGeneric" in _mags) then {
				hasBuildItem = true;
			} else { hasBuildItem = false;};
			camoNetB_East = nearestObject [player, "Land_CamoNetB_EAST"];
			camoNetVar_East = nearestObject [player, "Land_CamoNetVar_EAST"];
			camoNet_East = nearestObject [player, "Land_CamoNet_EAST"];
			camoNetB_Nato = nearestObject [player, "Land_CamoNetB_NATO"];
			camoNetVar_Nato = nearestObject [player, "Land_CamoNetVar_NATO"];
			camoNet_Nato = nearestObject [player, "Land_CamoNet_NATO"];
			sleep 5;
		};
		_playerChanged = true;
	} else {
//survivor skin 2
	if (player iskindof "Survivor2_DZ") then {
		while {player iskindof "Survivor2_DZ"} do 
		{
			_mags = magazines player;
			if ("ItemTankTrap" in _mags || "ItemSandbag" in _mags || "ItemWire" in _mags || "PartWoodPile" in _mags || "PartGeneric" in _mags) then {
				hasBuildItem = true;
			} else { hasBuildItem = false;};
			camoNetB_East = nearestObject [player, "Land_CamoNetB_EAST"];
			camoNetVar_East = nearestObject [player, "Land_CamoNetVar_EAST"];
			camoNet_East = nearestObject [player, "Land_CamoNet_EAST"];
			camoNetB_Nato = nearestObject [player, "Land_CamoNetB_NATO"];
			camoNetVar_Nato = nearestObject [player, "Land_CamoNetVar_NATO"];
			camoNet_Nato = nearestObject [player, "Land_CamoNet_NATO"];
			sleep 5;
		};
		_playerChanged = true;
	} else {
//survivor skin 3
	if (player iskindof "Survivor3_DZ") then {
		while {player iskindof "Survivor3_DZ"} do 
		{
			_mags = magazines player;
			if ("ItemTankTrap" in _mags || "ItemSandbag" in _mags || "ItemWire" in _mags || "PartWoodPile" in _mags || "PartGeneric" in _mags) then {
				hasBuildItem = true;
			} else { hasBuildItem = false;};
			camoNetB_East = nearestObject [player, "Land_CamoNetB_EAST"];
			camoNetVar_East = nearestObject [player, "Land_CamoNetVar_EAST"];
			camoNet_East = nearestObject [player, "Land_CamoNet_EAST"];
			camoNetB_Nato = nearestObject [player, "Land_CamoNetB_NATO"];
			camoNetVar_Nato = nearestObject [player, "Land_CamoNetVar_NATO"];
			camoNet_Nato = nearestObject [player, "Land_CamoNet_NATO"];
			sleep 5;
		};
		_playerChanged = true;
	} else {
//survivor skin 4
	if (player iskindof "Sniper1_DZ") then {
		while {player iskindof "Sniper1_DZ"} do 
		{
			_mags = magazines player;
			if ("ItemTankTrap" in _mags || "ItemSandbag" in _mags || "ItemWire" in _mags || "PartWoodPile" in _mags || "PartGeneric" in _mags) then {
				hasBuildItem = true;
			} else { hasBuildItem = false;};
			camoNetB_East = nearestObject [player, "Land_CamoNetB_EAST"];
			camoNetVar_East = nearestObject [player, "Land_CamoNetVar_EAST"];
			camoNet_East = nearestObject [player, "Land_CamoNet_EAST"];
			camoNetB_Nato = nearestObject [player, "Land_CamoNetB_NATO"];
			camoNetVar_Nato = nearestObject [player, "Land_CamoNetVar_NATO"];
			camoNet_Nato = nearestObject [player, "Land_CamoNet_NATO"];
			sleep 5;
		};
		_playerChanged = true;
	} else {
//survivor skin 5
	if (player iskindof "Soldier1_DZ") then {
		while {player iskindof "Soldier1_DZ"} do 
		{
			_mags = magazines player;
			if ("ItemTankTrap" in _mags || "ItemSandbag" in _mags || "ItemWire" in _mags || "PartWoodPile" in _mags || "PartGeneric" in _mags) then {
				hasBuildItem = true;
			} else { hasBuildItem = false;};
			camoNetB_East = nearestObject [player, "Land_CamoNetB_EAST"];
			camoNetVar_East = nearestObject [player, "Land_CamoNetVar_EAST"];
			camoNet_East = nearestObject [player, "Land_CamoNet_EAST"];
			camoNetB_Nato = nearestObject [player, "Land_CamoNetB_NATO"];
			camoNetVar_Nato = nearestObject [player, "Land_CamoNetVar_NATO"];
			camoNet_Nato = nearestObject [player, "Land_CamoNet_NATO"];
			sleep 5;
		};
		_playerChanged = true;
	} else {
//survivor skin 6
if (player iskindof "Camo1_DZ") then {
	while {player iskindof "Camo1_DZ"} do 
	{
			_mags = magazines player;
			if ("ItemTankTrap" in _mags || "ItemSandbag" in _mags || "ItemWire" in _mags || "PartWoodPile" in _mags || "PartGeneric" in _mags) then {
				hasBuildItem = true;
			} else { hasBuildItem = false;};
			camoNetB_East = nearestObject [player, "Land_CamoNetB_EAST"];
			camoNetVar_East = nearestObject [player, "Land_CamoNetVar_EAST"];
			camoNet_East = nearestObject [player, "Land_CamoNet_EAST"];
			camoNetB_Nato = nearestObject [player, "Land_CamoNetB_NATO"];
			camoNetVar_Nato = nearestObject [player, "Land_CamoNetVar_NATO"];
			camoNet_Nato = nearestObject [player, "Land_CamoNet_NATO"];
		sleep 5;
	};
	_playerChanged = true;
} else {
//survivor skin 7
if (player iskindof "Bandit1_DZ") then {
	while {player iskindof "Bandit1_DZ"} do 
	{
			_mags = magazines player;
			if ("ItemTankTrap" in _mags || "ItemSandbag" in _mags || "ItemWire" in _mags || "PartWoodPile" in _mags || "PartGeneric" in _mags) then {
				hasBuildItem = true;
			} else { hasBuildItem = false;};
			camoNetB_East = nearestObject [player, "Land_CamoNetB_EAST"];
			camoNetVar_East = nearestObject [player, "Land_CamoNetVar_EAST"];
			camoNet_East = nearestObject [player, "Land_CamoNet_EAST"];
			camoNetB_Nato = nearestObject [player, "Land_CamoNetB_NATO"];
			camoNetVar_Nato = nearestObject [player, "Land_CamoNetVar_NATO"];
			camoNet_Nato = nearestObject [player, "Land_CamoNet_NATO"];
		sleep 5;
	};
	_playerChanged = true;
} else {
//survivor skin 8
if (player iskindof "Rocket_DZ") then {
	while {player iskindof "Rocket_DZ"} do 
	{
			_mags = magazines player;
			if ("ItemTankTrap" in _mags || "ItemSandbag" in _mags || "ItemWire" in _mags || "PartWoodPile" in _mags || "PartGeneric" in _mags) then {
				hasBuildItem = true;
			} else { hasBuildItem = false;};
			camoNetB_East = nearestObject [player, "Land_CamoNetB_EAST"];
			camoNetVar_East = nearestObject [player, "Land_CamoNetVar_EAST"];
			camoNet_East = nearestObject [player, "Land_CamoNet_EAST"];
			camoNetB_Nato = nearestObject [player, "Land_CamoNetB_NATO"];
			camoNetVar_Nato = nearestObject [player, "Land_CamoNetVar_NATO"];
			camoNet_Nato = nearestObject [player, "Land_CamoNet_NATO"];
		sleep 5;
	};
	_playerChanged = true;
} else {
//survivor skin 9
if (player iskindof "CamoWinter_DZN") then {
	while {player iskindof "CamoWinter_DZN"} do 
	{
			_mags = magazines player;
			if ("ItemTankTrap" in _mags || "ItemSandbag" in _mags || "ItemWire" in _mags || "PartWoodPile" in _mags || "PartGeneric" in _mags) then {
				hasBuildItem = true;
			} else { hasBuildItem = false;};
			camoNetB_East = nearestObject [player, "Land_CamoNetB_EAST"];
			camoNetVar_East = nearestObject [player, "Land_CamoNetVar_EAST"];
			camoNet_East = nearestObject [player, "Land_CamoNet_EAST"];
			camoNetB_Nato = nearestObject [player, "Land_CamoNetB_NATO"];
			camoNetVar_Nato = nearestObject [player, "Land_CamoNetVar_NATO"];
			camoNet_Nato = nearestObject [player, "Land_CamoNet_NATO"];
		sleep 5;
	};
	_playerChanged = true;
} else {

sleep 3;
};};};};};};};};};
};