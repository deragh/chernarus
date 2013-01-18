/*
Base Building DayZ by Daimyo
*/
private["_alreadyBuilt","_uidDir","_p1","_p2","_uid","_worldspace","_panelNearest2","_staticObj","_onRoad","_itemL","_itemM","_itemG","_qtyL","_qtyM","_qtyG","_cntLoop","_finished","_checkComplete","_objectTemp","_locationPlayer","_object","_id","_isOk","_text","_mags","_hasEtool","_canDo","_hasToolbox","_inVehicle","_isWater","_onLadder","_building","_wait1","_wait2","_location","_isOk","_dir","_classname","_item","_itemT","_itemS","_itemW","_qtyT","_qtyS","_qtyW","_si","_convertInput","_strKeyCode"];
_locationPlayer = player modeltoworld [0,0,0];
//_location set [2,0];
_location = player modeltoworld [0,0,0];
//_location set [2,0];
_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_isWater = 		(surfaceIsWater _location) or dayz_isSwimming;
_inVehicle = (vehicle player != player);
_building = nearestObject [player, "Building"];
_staticObj = nearestObject [player, "Static"];
_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_hasToolbox = 	"ItemToolbox" in items player;
_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder); //USE!!
_hasEtool = 	"ItemEtool" in weapons player;

_wait1 = 0;
_wait2 = 0;
_classname = "";
_checkComplete = false;
_finished = false;
_dir = getDir player;
_cntLoop = 0;
_alreadyBuilt = false;
//if(!isNull _building) then {
_isOk = [player,_building] call fnc_isInsideBuilding;
//};
if (procBuild) then {cutText ["Your already building!", "PLAIN DOWN"];breakOut "exit";};
if(_isWater) then {cutText [localize "str_player_26", "PLAIN DOWN"];procBuild = false;breakOut "exit";};
if(_onLadder) then {cutText [localize "str_player_21", "PLAIN DOWN"];procBuild = false;breakOut "exit";};
if (_inVehicle) then {cutText ["Can't do this in vehicle", "PLAIN DOWN"];procBuild = false;breakOut "exit";};
_item = _this;
if (_item in (magazines player) ) then {
r_interrupt = false;
r_doLoop = true;
procBuild = true;
//_location = getPosASL player;
//_location set [2,0];
//_location = [ (getPosASL player select 0) + 1, (getPosASL player select 1), (getPosASL player select 2) - 10];
// if (_isOk) then {cutText [format["Can't build %1 in buildings",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };

call gear_ui_init;
//Count mags

_mags = magazines player;
if ("ItemTankTrap" in _mags) then {
_qtyT = {_x == "ItemTankTrap"} count magazines player;
_itemT = "ItemTankTrap";
} else { _qtyT = 0;};
if ("ItemSandbag" in _mags) then {
_qtyS = {_x == "ItemSandbag"} count magazines player;
_itemS = "ItemSandbag";
} else { _qtyS = 0;};
if ("ItemWire" in _mags) then {
_qtyW = {_x == "ItemWire"} count magazines player;
_itemW = "ItemWire";
} else { _qtyW = 0;};
if ("PartWoodPile" in _mags) then {
_qtyL = {_x == "PartWoodPile"} count magazines player;
_itemL = "PartWoodPile";
} else { _qtyL = 0;};
if ("PartGeneric" in _mags) then {
_qtyM = {_x == "PartGeneric"} count magazines player;
_itemM = "PartGeneric";
} else { _qtyM = 0;};
if ("HandGrenade_West" in _mags) then {
_qtyG = {_x == "HandGrenade_West"} count magazines player;
_itemG = "HandGrenade_West";
} else { _qtyG = 0;};
// Determine what combo item will be created
// Gate
if (_qtyS == 0 && _qtyT == 2 && _qtyW == 0 && _qtyL == 3 && _qtyM == 1 && _qtyG == 0) then {
_classname = "Concrete_Wall_EP1";
_text = "Gate Concrete Wall";
_wait1 = 1;
_wait2 = 1;
_location = player modeltoworld [0,2,0];
if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
} else {
//Gate Panel With Code
if (_qtyS == 0 && _qtyT == 1 && _qtyW == 1 && _qtyL == 0 && _qtyM == 1 && _qtyG == 0) then {
_classname = "Infostand_2_EP1";
_text = "Gate Panel Keypad Access";
_wait1 = 1;
_location = player modeltoworld [0,2,0];
if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
} else {
//Booby traps
if (_qtyS == 1 && _qtyT == 0 && _qtyW == 0 && _qtyL == 0 && _qtyM == 1 && _qtyG == 1) then {
cutText [format["A %1? Not doing it.",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit";
//_classname = "Grave";
//_text = "Booby Trap";
//_wait1 = 1;
//_wait2 = 1;
//_location = player modeltoworld [0,2,0];
//if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
//if (!_hasEtool) then {cutText [format["You need an entrenching tool to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
} else {

//--SandBags Main--

if (_qtyS == 3 && _qtyT == 3 && _qtyW == 2 && _qtyL == 2 && _qtyM == 0) then {
_classname = "WarfareBDepot";
_text = _classname;
if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
if (!_hasEtool) then {cutText [format["You need an entrenching tool to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_wait1 = 1;
_wait2 = 1;
_location = player modeltoworld [0,15,0];
_onRoad = isOnRoad _location;
if(_onRoad) then {cutText [format["You cannot build %1 on the road",_text], "PLAIN DOWN",1];procBuild = false;breakOut "exit";};
_dir = _dir + 90;
} else {
if (_qtyS == 1 && _qtyT == 4 && _qtyW == 2 && _qtyL == 2 && _qtyM == 0) then {
_classname = "Base_WarfareBBarrier10xTall";
_text = _classname;
if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
if (!_hasEtool) then {cutText [format["You need an entrenching tool to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_wait1 = 1;
_wait2 = 1;
_location = player modeltoworld [0,5,0];
_onRoad = isOnRoad _location;
if(_onRoad) then {cutText [format["You cannot build %1 on the road",_text], "PLAIN DOWN",1];procBuild = false;breakOut "exit";};
} else {
if (_qtyS == 1 && _qtyT == 2 && _qtyW == 2 && _qtyL == 1 && _qtyM == 0) then {
_classname = "WarfareBCamp";
_text = _classname;
if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
if (!_hasEtool) then {cutText [format["You need an entrenching tool to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_wait1 = 1;
_wait2 = 1;
_location = player modeltoworld [0,10,0];
_onRoad = isOnRoad _location;
if(_onRoad) then {cutText [format["You cannot build %1 on the road",_text], "PLAIN DOWN",1];procBuild = false;breakOut "exit";};
} else {
if (_qtyS == 1 && _qtyT == 2 && _qtyW == 1 && _qtyL == 1 && _qtyM == 0) then {
_classname = "Base_WarfareBBarrier10x";
_text = _classname;
if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
if (!_hasEtool) then {cutText [format["You need an entrenching tool to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_wait1 = 1;
_wait2 = 1;
_location = player modeltoworld [0,5,0];
} else {
if (_qtyS == 2 && _qtyT == 2 && _qtyW == 0 && _qtyL == 2 && _qtyM == 0) then {
_classname = "Land_fortified_nest_big";
_text = _classname;
if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
if (!_hasEtool) then {cutText [format["You need an entrenching tool to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_wait1 = 1;
_wait2 = 1;
_location = player modeltoworld [2,8,0];
_onRoad = isOnRoad _location;
if(_onRoad) then {cutText [format["You cannot build %1 on the road",_text], "PLAIN DOWN",1];procBuild = false;breakOut "exit";};
_dir = _dir + 180;
} else {
if (_qtyS == 1 && _qtyT == 2 && _qtyW == 2 && _qtyL == 2 && _qtyM == 0) then {
_classname = "Land_Fort_Watchtower";
_text = _classname;
if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
if (!_hasEtool) then {cutText [format["You need an entrenching tool to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_wait1 = 1;
_wait2 = 1;
_location = player modeltoworld [0,5,0];
_onRoad = isOnRoad _location;
if(_onRoad) then {cutText [format["You cannot build %1 on the road",_text], "PLAIN DOWN",1];procBuild = false;breakOut "exit";};
_dir = _dir + 90;
} else {
if (_qtyS == 1 && _qtyT == 4 && _qtyW == 1 && _qtyL == 3 && _qtyM == 0) then {
_classname = "Land_fort_rampart_EP1";
_text = _classname;
if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
if (!_hasEtool) then {cutText [format["You need an entrenching tool to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_wait1 = 1;
_wait2 = 1;
_location = player modeltoworld [0,5,0];
} else {
if (_qtyS == 1 && _qtyT == 2 && _qtyW == 1 && _qtyL == 0 && _qtyM == 0) then {
_classname = "Land_HBarrier_large";
_text = _classname;
if (!_hasEtool) then {cutText [format["You need an entrenching tool to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_wait1 = 1;
_location = player modeltoworld [0,4,0];
} else {
if (_qtyS == 1 && _qtyT == 2 && _qtyW == 0 && _qtyL == 1 && _qtyM == 0) then {
_classname = "Land_fortified_nest_small";
_text = _classname;
if (!_hasEtool) then {cutText [format["You need an entrenching tool to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_location = player modeltoworld [0,4,0];
_dir = _dir + 180;
_wait1 = 1;
} else {
if (_qtyS == 1 && _qtyT == 1 && _qtyW == 0 && _qtyL == 0 && _qtyM == 0) then {
_classname = "Land_HBarrier1";
_text = _classname;
if (!_hasEtool) then {cutText [format["You need an entrenching tool to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_location = player modeltoworld [0,3,0];
_dir = _dir + 90;
} else {
if (_qtyS == 1 && _qtyT == 0 && _qtyW == 1 && _qtyL == 0 && _qtyM == 0) then {
_classname = "Land_BagFenceRound";
_text = _classname;
if (!_hasEtool) then {cutText [format["You need an entrenching tool to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_location = player modeltoworld [0,2,0];
_dir = _dir + 180;
} else {
if (_qtyS == 1 && _qtyT == 0 && _qtyW == 0 && _qtyL == 0 && _qtyM == 0) then {
_classname = "Land_fort_bagfence_long";
_text = _classname;
if (!_hasEtool) then {cutText [format["You need an entrenching tool to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_location = player modeltoworld [0,2,0];
} else {
//--TankTraps Main--
if (_qtyS == 0 && _qtyT == 6 && _qtyW == 0 && _qtyL == 0 && _qtyM == 2) then {
_classname = "Land_Misc_Cargo2E";
_text = _classname;
if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_wait1 = 1;
_wait2 = 1;
_location = player modeltoworld [0,5,0];
_dir = _dir + 90;
} else {
if (_qtyS == 0 && _qtyT == 5 && _qtyW == 0 && _qtyL == 0 && _qtyM == 1) then {
_classname = "Misc_Cargo1Bo_military";
_text = _classname;
if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_wait1 = 1;
_wait2 = 1;
_location = player modeltoworld [0,5,0];
_dir = _dir + 90;
} else {
if (_qtyS == 0 && _qtyT == 3 && _qtyW == 0 && _qtyL == 0 && _qtyM == 1) then {
_classname = "Ins_WarfareBContructionSite";
_text = _classname;
if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_wait1 = 1;
_wait2 = 1;
_location = player modeltoworld [0,5,0];
_dir = _dir + 90;
} else {
if (_qtyS == 0 && _qtyT == 4 && _qtyW == 0 && _qtyL == 0 && _qtyM == 0) then {
_classname = "Hhedgehog_concrete";
_text = _classname;
if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_wait1 = 1;
_wait2 = 1;
_location = player modeltoworld [0,4,0];
} else {
if (_qtyS == 0 && _qtyT == 1 && _qtyW == 0 && _qtyL == 0 && _qtyM == 1) then {
_classname = "Misc_cargo_cont_small_EP1";
_text = _classname;
_wait1 = 1;
_location = player modeltoworld [0,4,0];
_dir = _dir + 90;
} else {
if (_qtyS == 0 && _qtyT == 1 && _qtyW == 0 && _qtyL == 2 && _qtyM == 0) then {
_classname = "Land_prebehlavka";
_text = _classname;
_wait1 = 1;
_location = player modeltoworld [0,3,0];
_dir = _dir + 90;
} else {
if (_qtyS == 0 && _qtyT == 2 && _qtyW == 0 && _qtyL == 0 && _qtyM == 0) then {
_classname = "Fence_corrugated_plate";
_text = _classname;
_location = player modeltoworld [0,3,0];
} else {
if (_qtyS == 0 && _qtyT == 2 && _qtyW == 1 && _qtyL == 0 && _qtyM == 0) then {
_classname = "ZavoraAnim";
_text = _classname;
_location = player modeltoworld [0,5,0];
} else {
if (_qtyS == 0 && _qtyT == 1 && _qtyW == 0 && _qtyL == 0 && _qtyM == 0) then {
_classname = "Land_CncBlock";
_text = _classname;
_location = player modeltoworld [0,2,0];
} else {
//--Wire Fencing--
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 7 && _qtyL == 0 && _qtyM == 1) then {
_classname = "Land_tent_east";
_text = _classname;
_location = player modeltoworld [0,6,0];
if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_wait1 = 1;
_wait2 = 1;
} else {
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 6 && _qtyL == 0 && _qtyM == 1) then {
_classname = "Land_CamoNetB_EAST";
_text = _classname;
if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_wait1 = 1;
_wait2 = 1;
_location = player modeltoworld [0,10,0];
} else {
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 5 && _qtyL == 0 && _qtyM == 1) then {
_classname = "Land_CamoNetB_NATO";
_text = _classname;
if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_wait1 = 1;
_wait2 = 1;
_location = player modeltoworld [0,10,0];
} else {
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 4 && _qtyL == 0 && _qtyM == 1) then {
_classname = "Land_CamoNetVar_EAST";
_text = _classname;
_wait1 = 1;
_location = player modeltoworld [0,7,0];
} else {
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 3 && _qtyL == 0 && _qtyM == 1) then {
_classname = "Land_CamoNetVar_NATO";
_text = _classname;
_wait1 = 1;
_location = player modeltoworld [0,7,0];
} else {
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 2 && _qtyL == 0 && _qtyM == 1) then {
_classname = "Land_CamoNet_EAST";
_text = _classname;
_location = player modeltoworld [0,7,0];
} else {
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 1 && _qtyL == 0 && _qtyM == 1) then {
_classname = "Land_CamoNet_NATO";
_text = _classname;
_location = player modeltoworld [0,7,0];
} else {
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 2 && _qtyL == 0 && _qtyM == 0) then {
_classname = "Fort_RazorWire";
_text = _classname;
_location = player modeltoworld [0,4,0];
} else {
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 1 && _qtyL == 0 && _qtyM == 0) then {
_classname = "Fence_Ind";
_text = _classname;
_location = player modeltoworld [0,2,0];
_onRoad = isOnRoad _location;
if(_onRoad) then {cutText [format["You cannot build %1 on the road",_text], "PLAIN DOWN",1];procBuild = false;breakOut "exit";};
} else {
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 2 && _qtyL == 2 && _qtyM == 0) then {
_classname = "Fence_Ind_long";
_text = _classname;
_location = player modeltoworld [-4,1.5,0];
_onRoad = isOnRoad _location;
_wait1 = 1;
if(_onRoad) then {cutText [format["You cannot build %1 on the road",_text], "PLAIN DOWN",1];procBuild = false;breakOut "exit";};
} else {
if (_qtyS == 1 && _qtyT == 1 && _qtyW == 0 && _qtyL == 2 && _qtyM == 1) then {
_classname = "Land_pumpa";
_text = _classname;
_location = player modeltoworld [0,3,0];
if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
if (!_hasEtool) then {cutText [format["You need an entrenching tool to build %1",_text], "PLAIN DOWN",1];procBuild = false; breakOut "exit"; };
_wait1 = 1;
_wait2 = 1;
_onRoad = isOnRoad _location;
if(_onRoad) then {cutText [format["You cannot build %1 on the road",_text], "PLAIN DOWN",1];procBuild = false;breakOut "exit";};
};};};};};};};};};};};};};};};};};};};};};};};};};};};};};};};};};};};
//Check if other panels nearby
_panelNearest2 = nearestObjects [player, ["Infostand_2_EP1"], 300];
//_panelClosest2 = [_panelNearest2, player] call BIS_fnc_nearestPosition;
//_panelClosest1 = [_panelNearest1, player] call BIS_fnc_nearestPosition;
if (_classname == "Infostand_2_EP1" && (count _panelNearest2 > 1)) then {cutText ["Only 2 gate panels per base in a 300 meter radius!", "PLAIN DOWN"];procBuild = false;breakOut "exit";};

//_classname = 	getText (configFile >> "CfgMagazines" >> _item >> "ItemActions" >> "Build" >> "create");
//if ((_classname) in ["Land_CncBlock","Land_fortified_nest_big","ZavoraAnim","Fence_corrugated_plate","Land_fort_bagfence_long","WarfareBDepot","WarfareBCamp","Land_prebehlavka","Misc_cargo_cont_small_EP1","Land_fort_rampart_EP1","Hhedgehog_concrete","Ins_WarfareBContructionSite","Misc_Cargo1Bo_military","Land_Misc_Cargo2E","Land_HBarrier1","Land_BagFenceRound","Land_fortified_nest_small","Land_HBarrier_large","Base_WarfareBBarrier10x","Base_WarfareBBarrier10xTall","Land_Fort_Watchtower","Land_fortified_net_big","Fence_Ind","Fort_RazorWire","Land_podlejzacka","Land_CamoNet_NATO","Land_CamoNetB_NATO","Land_CamoNetVar_NATO"]) then {

//Ensure classname is selected and that player is within allotted distance of buildings/buildables
if (_classname != "") then {

// Show player quick preview of object being built
cutText [format["You saw a quick preview of %1, to cancel move from current position",_text], "PLAIN DOWN"];
_isWater = 		(surfaceIsWater _location) or dayz_isSwimming;
if(_isWater) then {cutText ["Can't build over water!", "PLAIN DOWN"]; procBuild = false;breakOut "exit";};
player allowdamage false;
_objectTemp = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
_objectTemp setDir _dir;
_objectTemp setpos [(getposATL _objectTemp select 0),(getposATL _objectTemp select 1), 0];

//_location = getPos _objectTemp;
sleep 1.5;
deleteVehicle _objectTemp;
player allowdamage true;
if (_canDo && alive player) then {
if (player distance _locationPlayer > 0.1 && alive player) then {cutText [format["Build canceled for %1, position of player moved",_text], "PLAIN DOWN",6]; procBuild = false; breakOut "exit";};
player playActionNow "Medic";
sleep 1;
cutText [format["=Constructing %1=  To cancel move from current position",_text], "PLAIN DOWN",1];
[player,"repair",0,false] call dayz_zombieSpeak;
_id = [player,50,true,(getPos player)] spawn player_alertZombies;
while {r_doLoop} do {
	if (r_interrupt) then {
		r_doLoop = false;
		};
	if (_cntLoop >= 10) then {
		r_doLoop = false;
		_finished = true;
		};
	sleep 1;
	_cntLoop = _cntLoop + 1;
	};
	r_doLoop = true;
	_cntLoop = 0;
};
if (player distance _locationPlayer > 0.1 && alive player) then {cutText [format["Build canceled for %1, position of player moved",_text], "PLAIN DOWN",6]; procBuild = false; breakOut "exit";};
if (_finished && _wait1 > 0 && _canDo && alive player) then {
player playActionNow "Medic";
sleep 1;
cutText [format["==Constructing %1==  To cancel move from current position",_text], "PLAIN DOWN",1];
[player,"repair",0,false] call dayz_zombieSpeak;
_id = [player,50,true,(getPos player)] spawn player_alertZombies;
while {r_doLoop} do {
	if (r_interrupt) then {
		r_doLoop = false;
		};
	if (_cntLoop >= 10) then {
		r_doLoop = false;
		_finished = true;
		};
	sleep _wait1;
	_cntLoop = _cntLoop + 1;
	};
	r_doLoop = true;
	_cntLoop = 0;
};
if (player distance _locationPlayer > 0.1) then {cutText [format["Build canceled for %1, position of player moved",_text], "PLAIN DOWN",6]; procBuild = false; breakOut "exit";};
if (_finished && _wait2 > 0 && _canDo && alive player) then {
player playActionNow "Medic";
sleep 1;
cutText [format["===Constructing %1===  To cancel move from current position",_text], "PLAIN DOWN",1];
[player,"repair",0,false] call dayz_zombieSpeak;
_id = [player,50,true,(getPos player)] spawn player_alertZombies;
while {r_doLoop} do {
	if (r_interrupt) then {
		r_doLoop = false;
		};
	if (_cntLoop >= 10) then {
		r_doLoop = false;
		_finished = true;
		};
	sleep _wait2;
	_cntLoop = _cntLoop + 1;
	};
	r_doLoop = true;
	_cntLoop = 0;
	};
if (player distance _locationPlayer > 0.1) then {cutText [format["Build canceled for %1, position of player moved",_text], "PLAIN DOWN",6]; procBuild = false; breakOut "exit";};

if (_finished) then {
//player allowDamage false;
// Do last check to see if player removed magazines while building
if ("ItemTankTrap" in _mags) then {
_qtyT = {_x == "ItemTankTrap"} count magazines player;
_itemT = "ItemTankTrap";
} else { _qtyT = 0;};
if ("ItemSandbag" in _mags) then {
_qtyS = {_x == "ItemSandbag"} count magazines player;
_itemS = "ItemSandbag";
} else { _qtyS = 0;};
if ("ItemWire" in _mags) then {
_qtyW = {_x == "ItemWire"} count magazines player;
_itemW = "ItemWire";
} else { _qtyW = 0;};
if ("PartWoodPile" in _mags) then {
_qtyL = {_x == "PartWoodPile"} count magazines player;
_itemL = "PartWoodPile";
} else { _qtyL = 0;};
if ("PartGeneric" in _mags) then {
_qtyM = {_x == "PartGeneric"} count magazines player;
_itemM = "PartGeneric";
} else { _qtyM = 0;};
if ("HandGrenade_West" in _mags) then {
_qtyG = {_x == "HandGrenade_West"} count magazines player;
_itemG = "HandGrenade_West";
} else { _qtyG = 0;};

if (_qtyS == 0 && _qtyT == 2 && _qtyW == 0 && _qtyL == 3 && _qtyM == 1 && _qtyG == 0 && _classname == "Concrete_Wall_EP1") then {
_checkComplete = true;
} else {
if (_qtyS == 0 && _qtyT == 1 && _qtyW == 1 && _qtyL == 0 && _qtyM == 1 && _qtyG == 0 && _classname == "Infostand_2_EP1") then {
_checkComplete = true;
//} else {
//if (_qtyS == 1 && _qtyT == 0 && _qtyW == 0 && _qtyL == 0 && _qtyM == 1 && _qtyG == 1 && _classname == "Grave") then {
//_checkComplete = true;
} else {
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 2 && _qtyL == 2 && _qtyM == 0 && _classname == "Fence_Ind_long") then {
_checkComplete = true;
} else {
if (_qtyS == 1 && _qtyT == 1 && _qtyW == 0 && _qtyL == 2 && _qtyM == 1 && _classname == "Land_pumpa") then {
_checkComplete = true;
} else {
if (_qtyS == 3 && _qtyT == 3 && _qtyW == 2 && _qtyL == 2 && _qtyM == 0 && _classname == "WarfareBDepot") then {
_checkComplete = true;
} else {
if (_qtyS == 1 && _qtyT == 4 && _qtyW == 2 && _qtyL == 2 && _qtyM == 0 && _classname == "Base_WarfareBBarrier10xTall") then {
_checkComplete = true;
} else {
if (_qtyS == 1 && _qtyT == 2 && _qtyW == 2 && _qtyL == 1 && _qtyM == 0 && _classname == "WarfareBCamp") then {
_checkComplete = true;
} else {
if (_qtyS == 1 && _qtyT == 2 && _qtyW == 1 && _qtyL == 1 && _qtyM == 0 && _classname == "Base_WarfareBBarrier10x") then {
_checkComplete = true;
} else {
if (_qtyS == 2 && _qtyT == 2 && _qtyW == 0 && _qtyL == 2 && _qtyM == 0 && _classname == "Land_fortified_nest_big") then {
_checkComplete = true;
} else {
if (_qtyS == 1 && _qtyT == 2 && _qtyW == 2 && _qtyL == 2 && _qtyM == 0 && _classname == "Land_Fort_Watchtower") then {
_checkComplete = true;
} else {
if (_qtyS == 1 && _qtyT == 4 && _qtyW == 1 && _qtyL == 3 && _qtyM == 0 && _classname == "Land_fort_rampart_EP1") then {
_checkComplete = true;
} else {
if (_qtyS == 1 && _qtyT == 2 && _qtyW == 1 && _qtyL == 0 && _qtyM == 0 && _classname == "Land_HBarrier_large") then {
_checkComplete = true;
} else {
if (_qtyS == 1 && _qtyT == 2 && _qtyW == 0 && _qtyL == 1 && _qtyM == 0 && _classname == "Land_fortified_nest_small") then {
_checkComplete = true;
} else {
if (_qtyS == 1 && _qtyT == 1 && _qtyW == 0 && _qtyL == 0 && _qtyM == 0 && _classname == "Land_HBarrier1") then {
_checkComplete = true;
} else {
if (_qtyS == 1 && _qtyT == 0 && _qtyW == 1 && _qtyL == 0 && _qtyM == 0 && _classname == "Land_BagFenceRound") then {
_checkComplete = true;
} else {
if (_qtyS == 1 && _qtyT == 0 && _qtyW == 0 && _qtyL == 0 && _qtyM == 0 && _classname == "Land_fort_bagfence_long") then {
_checkComplete = true;
} else {
//--TankTraps Main--
if (_qtyS == 0 && _qtyT == 6 && _qtyW == 0 && _qtyL == 0 && _qtyM == 2 && _classname == "Land_Misc_Cargo2E") then {
_checkComplete = true;
} else {
if (_qtyS == 0 && _qtyT == 5 && _qtyW == 0 && _qtyL == 0 && _qtyM == 1 && _classname == "Misc_Cargo1Bo_military") then {
_checkComplete = true;
} else {
if (_qtyS == 0 && _qtyT == 3 && _qtyW == 0 && _qtyL == 0 && _qtyM == 1 && _classname == "Ins_WarfareBContructionSite") then {
_checkComplete = true;
} else {
if (_qtyS == 0 && _qtyT == 4 && _qtyW == 0 && _qtyL == 0 && _qtyM == 0 && _classname == "Hhedgehog_concrete") then {
_checkComplete = true;
} else {
if (_qtyS == 0 && _qtyT == 1 && _qtyW == 0 && _qtyL == 0 && _qtyM == 1 && _classname == "Misc_cargo_cont_small_EP1") then {
_checkComplete = true;
} else {
if (_qtyS == 0 && _qtyT == 1 && _qtyW == 0 && _qtyL == 2 && _qtyM == 0 && _classname == "Land_prebehlavka") then {
_checkComplete = true;
} else {
if (_qtyS == 0 && _qtyT == 2 && _qtyW == 0 && _qtyL == 0 && _qtyM == 0 && _classname == "Fence_corrugated_plate") then {
_checkComplete = true;
} else {
if (_qtyS == 0 && _qtyT == 2 && _qtyW == 1 && _qtyL == 0 && _qtyM == 0 && _classname == "ZavoraAnim") then {
_checkComplete = true;
} else {
if (_qtyS == 0 && _qtyT == 1 && _qtyW == 0 && _qtyL == 0 && _qtyM == 0 && _classname == "Land_CncBlock") then {
_checkComplete = true;
} else {
//--Wire Fencing--
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 6 && _qtyL == 0 && _qtyM == 1 && _classname == "Land_CamoNetB_EAST") then {
_checkComplete = true;
} else {
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 5 && _qtyL == 0 && _qtyM == 1 && _classname == "Land_CamoNetB_NATO") then {
_checkComplete = true;
} else {
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 4 && _qtyL == 0 && _qtyM == 1 && _classname == "Land_CamoNetVar_EAST") then {
_checkComplete = true;
} else {
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 3 && _qtyL == 0 && _qtyM == 1 && _classname == "Land_CamoNetVar_NATO") then {
_checkComplete = true;
} else {
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 4 && _qtyL == 0 && _qtyM == 0 && _classname == "Land_CamoNet_EAST") then {
_checkComplete = true;
} else {
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 1 && _qtyL == 0 && _qtyM == 1 && _classname == "Land_CamoNet_NATO") then {
_checkComplete = true;
} else {
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 2 && _qtyL == 0 && _qtyM == 0 && _classname == "Fort_RazorWire") then {
_checkComplete = true;
} else {
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 1 && _qtyL == 0 && _qtyM == 0 && _classname == "Fence_Ind") then {
_checkComplete = true;
} else {
if (_qtyS == 0 && _qtyT == 0 && _qtyW == 7 && _qtyL == 0 && _qtyM == 1 && _classname == "Land_tent_east") then {
_checkComplete = true;
};};};};};};};};};};};};};};};};};};};};};};};};};};};};};};};};};};};


// BUILD IT!
sleep .1;
if (_checkComplete) then {
if (player distance _locationPlayer > 0.1 && !_canDo && !alive player) then {cutText ["Build interrupted and canceled","PLAIN DOWN"]; procBuild = false; breakOut "exit";};
if (_onLadder) then {cutText [localize "str_player_21", "PLAIN DOWN"];procBuild = false;breakOut "exit";};
if (_inVehicle) then {cutText ["Can't do this in vehicle", "PLAIN DOWN"];procBuild = false;breakOut "exit";};
cutText [format["You built a %1",_text], "PLAIN DOWN",5];
player allowdamage false;
_object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
//_object setposATLATL [0,0,0];
_object setDir _dir;
_object setpos [(getposATL _object select 0),(getposATL _object select 1), 0];
player reveal _object;
//_object setposATL [_location select 0, _location select 1, _location select 2 - _toGround];\



//_uid = _worldspace call dayz_objectUID2;
//_object setVariable ["ObjectUID", _uid, true];
// set the codes for gate
//--------------------------------
	_dir = round(_dir);
	_p1 = round((_location select 0) * 10);
	_p2 = round((_location select 1) * 10);
	_p3 = (_location select 2);
	if (_p3 < 0) then {
		_p3 = round((_location select 2) * -10);
	} else {
		_p3 = round((_location select 2) * 10);
	};
	
	//_uid = format["%1,%2,%3,%4",_p1,_p2,_p3,_dir];
	_uid = format["%1%2%3%4",_p1,_p2,_p3,_dir];
//--------------------------------

	
switch (_classname) do
{
	//case "Grave":
	//{
	//cutText [format["You have constructed a %1, crawl away so you dont set it off!",_text], "PLAIN DOWN",1];	
	//};
	case "Infostand_2_EP1":
	{
	_si = 0;
	_convertInput = [0,0,0,0,0,0];
	_strKeyCode = toArray(_uid);

	//hint format["Uid:%1 Location2:%2 strKeycode:%3",_uid ,_location select 2, _strKeyCode];
	//sleep 3;
	//hint format["convertInput:%1 ", _convertInput];
	//sleep 3;

	for "_i" from 0 to ((count _strKeyCode) - 1) 
	do {
		//hint format["Keycode i:%1  Value:%2", _i, _strKeyCode select _i];
		//sleep 3;
		
		_convertInput set[_si, ((_convertInput select _si) + ((_strKeyCode select _i) - 48))];
		
		if((_convertInput select _si) >= 10) then {
			_convertInput set [_si, (_convertInput select _si) - 10];
		};
		
		//hint format["Keycode si:%1  Value:%2  ConvertInput:%3", _si, _convertInput select _si, _convertInput];
		//sleep 3;
		
		if(_si == 5) then {
			_si = 0;
		} else {
			_si = _si + 1;
		};
	 };

	for "_i" from 0 to ((count _convertInput) - 1) 
	do {
		_convertInput set[_i, ((_convertInput select _i) + 48)];
	};
	
	cutText [format["You have constructed a %1, REMEMBER THIS PERMANENT KEYCODE: %2 .  Make sure to build 2 Key Panels (one in/one out) as soon as possible!",_text, toString _convertInput], "PLAIN DOWN",60];
	};
	default {
	cutText [format[localize "str_build_01",_text], "PLAIN DOWN"];
	};
};


//Remove required magazines
if (_qtyT > 0) then {
	for "_i" from 0 to _qtyT do
	{
	player removeMagazine _itemT;
	};
};
if (_qtyS > 0) then {
	for "_i" from 0 to _qtyS do
	{
	player removeMagazine _itemS;
	};
};
if (_qtyW > 0) then {
	for "_i" from 0 to _qtyW do
	{
	player removeMagazine _itemW;
	};
};
if (_qtyL > 0) then {
	for "_i" from 0 to _qtyL do
	{
	player removeMagazine _itemL;
	};
};
if (_qtyM > 0) then {
	for "_i" from 0 to _qtyM do
	{
	player removeMagazine _itemM;
	};
};
//Grenade only is needed when building booby trap
// if (_qtyG > 0 && _classname == "Grave") then {
	// for "_i" from 0 to _qtyG do
	// {
	// player removeMagazine _itemG;
	// };
// };
// Send to database
player allowdamage true;
dayzPublishObj = [dayz_characterID,_object,[_dir,_location],_classname];
publicVariableServer "dayzPublishObj";
if (isServer) then {
	dayzPublishObj call server_publishObj;
};
} else {cutText ["You don't have the proper amount of materials! If you tried to dupe, this is a bannable offense and has been noted in the logs! Repeat offenders will be banned.", "PLAIN DOWN"];procBuild = false; breakOut "exit";};
} else {
	r_interrupt = false;
	[objNull, player, rSwitchMove,""] call RE;
	player playActionNow "stop";
	procBuild = false;
	};
} else {cutText ["You need the EXACT amount of whatever you are trying to build without extras.", "PLAIN DOWN"];procBuild = false; breakOut "exit";};
};
procBuild = false;
//sleep 2;
//player allowDamage true;

