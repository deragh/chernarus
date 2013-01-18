private["_objectID","_objectUID","_obj","_cnt","_classname","_id","_tblProb","_locationPlayer","_randNum2","_smallWloop","_medWloop","_longWloop","_text","_wait","_longWait","_medWait","_smallWait","_highP","_medP","_lowP","_failRemove","_canRemove","_randNum","_classname","_dir","_pos","_text","_isWater","_inVehicle","_onLadder","_hasToolbox","_canDo","_hasEtool"];
_obj = cursorTarget;
_dir = direction _obj;
_pos = getposATL _obj;
if (!isNull _obj) then {
_objectID = _obj getVariable["ObjectID",0];
_objectUID = _obj getVariable["ObjectUID","0"];
};
_locationPlayer = player modeltoworld [0,0,0];
_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_isWater = 		(surfaceIsWater _locationPlayer) or dayz_isSwimming;
_inVehicle = (vehicle player != player);
_building = nearestObject [player, "Building"];
_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_hasToolbox = 	"ItemToolbox" in items player;
_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder); //USE!!
_hasEtool = 	"ItemEtool" in weapons player;
_canRemove = false;
_failRemove = false;
_longWait = false;
_medWait = false;
_smallWait = false;
_longWloop = 6;
_medWloop = 4;
_smallWloop = 3;
_tblProb = 30;
_lowP = 40;
_medP = 70;
_highP = 90;
_cnt = 0;
_text = "";
_wait = 10;
if(_isWater) then {cutText [localize "str_player_26", "PLAIN DOWN"];breakOut "exit";};
if(_onLadder) then {cutText [localize "str_player_21", "PLAIN DOWN"];breakOut "exit";};
if (_inVehicle) then {cutText [localize "Can't do this in vehicle", "PLAIN DOWN"];breakOut "exit";};
remProc = false;
if ((camoNetB_East distance player < 10 or 
camoNetVar_East distance player < 10 or 
camoNet_East distance player < 10 or 
camoNetB_Nato distance player < 10 or 
camoNetVar_Nato distance player < 10 or 
camoNet_Nato distance player < 10) && isNull _obj) then {
if (camoNetB_East distance player < 10) then {
_obj = camoNetB_East;
_objectID = _obj getVariable["ObjectID",0];
_objectUID = _obj getVariable["ObjectUID","0"];
} else {
	if (camoNetVar_East distance player < 10) then {
	_obj = camoNetVar_East;
	_objectID = _obj getVariable["ObjectID",0];
	_objectUID = _obj getVariable["ObjectUID","0"];
	} else { 
	if (camoNet_East distance player < 10) then {
		_obj = camoNet_East;
		_objectID = _obj getVariable["ObjectID",0];
		_objectUID = _obj getVariable["ObjectUID","0"];
		} else {
		if (camoNetB_Nato distance player < 10) then {
			_obj = camoNetB_Nato;
			_objectID = _obj getVariable["ObjectID",0];
			_objectUID = _obj getVariable["ObjectUID","0"];
			} else {
			if (camoNetVar_Nato distance player < 10) then {
				_obj = camoNetVar_Nato;
				_objectID = _obj getVariable["ObjectID",0];
				_objectUID = _obj getVariable["ObjectUID","0"];
				} else {
				if (camoNet_Nato distance player < 10) then {
					_obj = camoNet_Nato;
					_objectID = _obj getVariable["ObjectID",0];
					_objectUID = _obj getVariable["ObjectUID","0"];
					} else {
};};};};};};};
// Do percentages
_randNum = round(random 100);
_randNum2 = round(random 100);

//BuiltItems = ["Land_CncBlock","Land_ladder_half","Land_prebehlavka","Misc_cargo_cont_small_EP1","Land_fort_rampart_EP1","Hhedgehog_concrete","Land_ladder_half","Land_A_Castle_Stairs_A","Ins_WarfareBContructionSite","Misc_Cargo1Bo_military","Land_Misc_Cargo2E","Barrack2","Land_rails_bridge_40","Land_HBarrier1","Land_BagFenceRound","Land_fortified_nest_small","Land_HBarrier_large","Base_WarfareBBarrier10x","bunkerMedium02","Base_WarfareBBarrier10xTall","Land_Fort_Watchtower","Land_fortified_net_big","Fence_Ind","Fort_RazorWire","Land_podlejzacka","Land_camoNet_Nato","Land_camoNetB_Nato","Land_camoNetVar_Nato"];
// what is cursor?
_classname = _obj;
if (_classname isKindof "WarfareBDepot") then {
	_classname = "WarfareBDepot";
	} else {
	if (_classname isKindof "Base_WarfareBBarrier10xTall") then {
	_classname = "Base_WarfareBBarrier10xTall";
	} else {
		if (_classname isKindof "WarfareBCamp") then {
	_classname = "WarfareBCamp";
	} else {
		if (_classname isKindof "Base_WarfareBBarrier10x") then {
	_classname = "Base_WarfareBBarrier10x";
	} else {
		if (_classname isKindof "Land_fortified_nest_big") then {
	_classname = "Land_fortified_nest_big";
	} else {
		if (_classname isKindof "Land_Fort_Watchtower") then {
	_classname = "Land_Fort_Watchtower";
	} else {
		if (_classname isKindof "Land_fort_rampart_EP1") then {
	_classname = "Land_fort_rampart_EP1";
	} else {	if (_classname isKindof "Land_HBarrier_large") then {
	_classname = "Land_HBarrier_large";
	} else {
		if (_classname isKindof "Land_fortified_nest_small") then {
	_classname = "Land_fortified_nest_small";
	} else {
		if (_classname isKindof "Land_HBarrier1") then {
	_classname = "Land_HBarrier1";
	} else {
		if (_classname isKindof "Land_BagFenceRound") then {
	_classname = "Land_BagFenceRound";
	} else {
		if (_classname isKindof "Land_fort_bagfence_long") then {
	_classname = "Land_fort_bagfence_long";
	} else {
		if (_classname isKindof "Land_Misc_Cargo2E") then {
	_classname = "Land_Misc_Cargo2E";
	} else {
		if (_classname isKindof "Misc_Cargo1Bo_military") then {
	_classname = "Misc_Cargo1Bo_military";
	} else {
		if (_classname isKindof "Ins_WarfareBContructionSite") then {
	_classname = "Ins_WarfareBContructionSite";
	} else {
		if (_classname isKindof "Hhedgehog_concrete") then {
	_classname = "Hhedgehog_concrete";
	} else {
		if (_classname isKindof "Misc_cargo_cont_small_EP1") then {
	_classname = "Misc_cargo_cont_small_EP1";
	} else {
		if (_classname isKindof "Land_prebehlavka") then {
	_classname = "Land_prebehlavka";
	} else {	
		if (_classname isKindof "Fence_corrugated_plate") then {
	_classname = "Fence_corrugated_plate";
	} else {
		if (_classname isKindof "ZavoraAnim") then {
	_classname = "ZavoraAnim";
	} else {
		if (_classname isKindof "Land_CncBlock") then {
	_classname = "Land_CncBlock";
	} else {
		if (_classname isKindof "Land_camoNetB_Nato") then {
	_classname = "Land_camoNetB_Nato";
	} else {
		if (_classname isKindof "Land_camoNetVar_Nato") then {
	_classname = "Land_camoNetVar_Nato";
	} else {
		if (_classname isKindof "Land_camoNet_Nato") then {
	_classname = "Land_camoNet_Nato";
	} else {
		if (_classname isKindof "Fort_RazorWire") then {
	_classname = "Fort_RazorWire";
	} else {
		if (_classname isKindof "Fence_Ind") then {
	_classname = "Fence_Ind";
	} else {
		if (_classname isKindof "Land_camoNet_East") then {
	_classname = "Land_camoNet_East";
	} else {
		if (_classname isKindof "Land_camoNetVar_East") then {
	_classname = "Land_camoNetVar_East";
	} else {
		if (_classname isKindof "Land_camoNetB_East") then {
	_classname = "Land_camoNetB_East";
	} else {
		if (_classname isKindof "Land_tent_east") then {
	_classname = "Land_tent_east";
	} else {
		if (_classname isKindof "Land_pumpa") then {
	_classname = "Land_pumpa";
	} else {
		if (_classname isKindof "Fence_Ind_long") then {
	_classname = "Fence_Ind_long";
	} else {
};};};};};};};};};};};};};};};};};};};};};};};};};};};};};};};};

//_isDestructable = cursorTarget isKindOf "BuiltItems";

//High chance sandbags
switch (_classname) do
{
	case "Base_WarfareBBarrier10xTall":
	{
		_text = "Base_WarfareBBarrier10xTall";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (!_hasEtool) then {cutText [format["You need an entrenching tool to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _highP) then {_tblProb = _tblProb + 40;_canRemove = true; _longWait = true;} else {_tblProb = _tblProb + 40;_failRemove = true;_longWait = true; };
	};
	case "Base_WarfareBBarrier10x":
	{
		_text = "Base_WarfareBBarrier10x";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (!_hasEtool) then {cutText [format["You need an entrenching tool to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _highP) then {_tblProb = _tblProb + 40;_canRemove = true; _longWait = true;} else {_tblProb = _tblProb + 40; _failRemove = true; _longWait = true;};
	};
	case "Land_HBarrier_large":
	{
		_text = "Land_HBarrier_large";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (!_hasEtool) then {cutText [format["You need an entrenching tool to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _highP) then {_tblProb = _tblProb + 40;_canRemove = true; _longWait = true;} else {_tblProb = _tblProb + 40; _failRemove = true; _longWait = true;};
	};
	// Medium Chance Sandbags
	case "Land_fort_rampart_EP1":
	{
		_text = "Land_fort_rampart_EP1";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (!_hasEtool) then {cutText [format["You need an entrenching tool to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _medP) then {_tblProb = _tblProb + 20;_canRemove = true; _medWait = true;} else {_tblProb = _tblProb + 20; _failRemove = true; _medWait = true;};
	};
	case "Land_HBarrier1":
	{
		_text = "Land_HBarrier1";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (!_hasEtool) then {cutText [format["You need an entrenching tool to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _medP) then {_tblProb = _tblProb + 20;_canRemove = true; _medWait = true;} else {_tblProb = _tblProb + 20; _failRemove = true; _medWait = true;};
	};
	case "Land_fortified_nest_small":
	{
		_text = "Land_fortified_nest_small";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (!_hasEtool) then {cutText [format["You need an entrenching tool to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _medP) then {_tblProb = _tblProb + 20;_canRemove = true; _medWait = true;} else {_tblProb = _tblProb + 20; _failRemove = true; _medWait = true;};
	};
	case "Land_pumpa":
	{
		_text = "Land_pumpa";
		if (!_hasEtool) then {cutText [format["You need an entrenching tool to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _medP) then {_tblProb = _tblProb + 20;_canRemove = true; _medWait = true;} else {_tblProb = _tblProb + 20; _failRemove = true; _medWait = true;};
	};
	// Low Chance Sandbags
	case "Land_BagFenceRound":
	{
		_text = "Land_BagFenceRound";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (!_hasEtool) then {cutText [format["You need an entrenching tool to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _lowP) then {_canRemove = true; _smallWait = true;} else { _failRemove = true; _smallWait = true;};
	};
	case "Land_fort_bagfence_long":
	{
		_text = "Land_fort_bagfence_long";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (!_hasEtool) then {cutText [format["You need an entrenching tool to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _lowP) then {_canRemove = true; _smallWait = true;} else { _failRemove = true; _smallWait = true;};
	};
	// High Chance TankTraps
	case "Land_Misc_Cargo2E":
	{
		_text = "Land_Misc_Cargo2E";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _highP) then {_tblProb = _tblProb + 40;_canRemove = true; _longWait = true;} else {_tblProb = _tblProb + 40; _failRemove = true; _longWait = true;};
	};
	case "Misc_Cargo1Bo_military":
	{
		_text = "Misc_Cargo1Bo_military";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _highP) then {_tblProb = _tblProb + 40;_canRemove = true; _longWait = true;} else {_tblProb = _tblProb + 40; _failRemove = true; _longWait = true;};
	};
	case "Ins_WarfareBContructionSite":
	{
		_text = "Ins_WarfareBContructionSite";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _highP) then {_tblProb = _tblProb + 40;_canRemove = true; _longWait = true;} else {_tblProb = _tblProb + 40; _failRemove = true; _longWait = true;};
	};
	case "Hhedgehog_concrete":
	{
		_text = "Hhedgehog_concrete";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (!_hasEtool) then {cutText [format["You need an entrenching tool to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _highP) then {_tblProb = _tblProb + 40;_canRemove = true; _longWait = true;} else {_tblProb = _tblProb + 40; _failRemove = true; _longWait = true;};
	};
	// Medium Chance TankTraps
	case "Misc_cargo_cont_small_EP1":
	{
		_text = "Misc_cargo_cont_small_EP1";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _medP) then {_tblProb = _tblProb + 20;_canRemove = true; _medWait = true;} else {_tblProb = _tblProb + 20; _failRemove = true; _medWait = true;};
	};
	case "Land_prebehlavka":
	{
		_text = "Land_prebehlavka";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _medP) then {_tblProb = _tblProb + 20;_canRemove = true; _medWait = true;} else {_tblProb = _tblProb + 20; _failRemove = true; _medWait = true;};
	};
	case "Fence_corrugated_plate":
	{
		_text = "Fence_corrugated_plate";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _medP) then {_tblProb = _tblProb + 20;_canRemove = true; _medWait = true;} else {_tblProb = _tblProb + 20; _failRemove = true; _medWait = true;};
	};
	
	// Low Chance TankTraps
	case "ZavoraAnim":
	{
		_text = "ZavoraAnim";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _lowP) then {_canRemove = true; _smallWait = true;} else { _failRemove = true; _smallWait = true;};
	};
	case "Land_CncBlock":
	{
		_text = "Land_CncBlock";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _lowP) then {_canRemove = true; _smallWait = true;} else { _failRemove = true; _smallWait = true;};
	};
	// High Chance Wires
	case "Land_camoNetB_Nato":
	{
		_text = "Land_camoNetB_Nato";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _highP) then {_tblProb = _tblProb + 40;_canRemove = true; _longWait = true;} else {_tblProb = _tblProb + 40; _failRemove = true; _longWait = true;};
	};
	case "Land_camoNetB_East":
	{
		_text = "Land_camoNetB_East";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _medP) then {_tblProb = _tblProb + 20;_canRemove = true; _medWait = true;} else {_tblProb = _tblProb + 20; _failRemove = true; _medWait = true;};
	};
	// Medium Chance Wires
	case "Land_camoNetVar_East":
	{
		_text = "Land_camoNetVar_East";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _medP) then {_tblProb = _tblProb + 20;_canRemove = true; _medWait = true;} else {_tblProb = _tblProb + 20; _failRemove = true; _medWait = true;};
	};
	case "Land_camoNetVar_Nato":
	{
		_text = "Land_camoNetVar_Nato";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _medP) then {_tblProb = _tblProb + 20;_canRemove = true; _medWait = true;} else {_tblProb = _tblProb + 20; _failRemove = true; _medWait = true;};
	};
	case "Land_camoNet_Nato":
	{
		_text = "Land_camoNet_Nato";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _medP) then {_tblProb = _tblProb + 20;_canRemove = true; _medWait = true;} else {_tblProb = _tblProb + 20; _failRemove = true; _medWait = true;};
	};
	case "Land_camoNet_East":
	{
		_text = "Land_camoNet_East";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _medP) then {_tblProb = _tblProb + 20;_canRemove = true; _medWait = true;} else {_tblProb = _tblProb + 20; _failRemove = true; _medWait = true;};
	};
	case "Fence_Ind_long":
	{
		_text = "Fence_Ind_long";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _medP) then {_tblProb = _tblProb + 20;_canRemove = true; _medWait = true;} else {_tblProb = _tblProb + 20; _failRemove = true; _medWait = true;};
	};
	// Low Chance Wires
	case "Fort_RazorWire":
	{
		_text = "Fort_RazorWire";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _lowP) then {_canRemove = true; _smallWait = true;} else { _failRemove = true; _smallWait = true;};
	};
	case "Fence_Ind":
	{
		_text = "Fence_Ind";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _lowP) then {_canRemove = true; _smallWait = true;} else { _failRemove = true; _smallWait = true;};
	};
	case "Land_tent_east":
	{
		_text = "Land_tent_east";
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (_randNum > _highP) then {_canRemove = true; _longWait = true;} else { _failRemove = true; _longWait = true;};
	};
	default {
		cutText ["You didnt select an object!", "PLAIN DOWN"];
		remProc = true; breakOut "exit";
	};
};

if (_longWait && _canRemove) then {
	_cnt = _longWloop;
	_cnt = _cnt * 10 + 10;
	for "_i" from 0 to _longWloop do
	{
		cutText [format["Attempting to deconstruct %1  %2 seconds left.  Move from current position to cancel",_classname,_cnt], "PLAIN DOWN",1];
		if (player distance _locationPlayer > 0.2) then {cutText [format["Removal canceled for %1, position of player moved",_text], "PLAIN DOWN",1]; remProc = true; breakOut "exit";};
		if (!_canDo || _onLadder || _inVehicle) then {cutText [format["Removal canceled for %1, player is unable to continue",_text], "PLAIN DOWN",1]; remProc = true; breakOut "exit";};
		player playActionNow "Medic";
		sleep 1;
		[player,"repair",0,false] call dayz_zombieSpeak;
		_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
		sleep _wait;
		_hasToolbox = 	"ItemToolbox" in items player;
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		_cnt = _cnt - 10;
	};
	_hasToolbox = 	"ItemToolbox" in items player;
	if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
	if (!isNull _obj && _randNum2 < _tblProb) then {player removeWeapon "ItemToolbox"; cutText ["Your toolbox was used up!", "PLAIN DOWN"];};
		sleep 1.5;
} else {
if (_medWait && _canRemove) then {
	_cnt = _medWloop;
	_cnt = _cnt * 10 + 10;
	for "_i" from 0 to _medWloop do
	{
		cutText [format["Attempting to deconstruct %1  %2 seconds left.  Move from current position to cancel",_classname,_cnt], "PLAIN DOWN",1];
		if (player distance _locationPlayer > 0.2) then {cutText [format["Removal canceled for %1, position of player moved",_text], "PLAIN DOWN",1]; remProc = true; breakOut "exit";};
		if (!_canDo || _onLadder || _inVehicle) then {cutText [format["Removal canceled for %1, player is unable to continue",_text], "PLAIN DOWN",1]; remProc = true; breakOut "exit";};
		player playActionNow "Medic";
		sleep 1;
		[player,"repair",0,false] call dayz_zombieSpeak;
		_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
		sleep _wait;
		_hasToolbox = 	"ItemToolbox" in items player;
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		_cnt = _cnt - 10;
	};
		_hasToolbox = 	"ItemToolbox" in items player;
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (!isNull _obj && _randNum2 < _tblProb) then {player removeWeapon "ItemToolbox"; cutText ["Your toolbox was used up!", "PLAIN DOWN"];};
		sleep 1.5;
} else {
if (_smallWait && _canRemove) then {
	_cnt = _smallWloop;
	_cnt = _cnt * 10 + 10;
	for "_i" from 0 to _smallWloop do
	{
		cutText [format["Attempting to deconstruct %1  %2 seconds left.  Move from current position to cancel",_classname,_cnt], "PLAIN DOWN",1];
		if (player distance _locationPlayer > 0.2) then {cutText [format["Removal canceled for %1, position of player moved",_text], "PLAIN DOWN",1]; remProc = true; breakOut "exit";};
		if (!_canDo || _onLadder || _inVehicle) then {cutText [format["Removal canceled for %1, player is unable to continue",_text], "PLAIN DOWN",1]; remProc = true; breakOut "exit";};
		player playActionNow "Medic";
		sleep 1;
		[player,"repair",0,false] call dayz_zombieSpeak;
		_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
		sleep _wait;
		_hasToolbox = 	"ItemToolbox" in items player;
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		_cnt = _cnt - 10;
	};
		_hasToolbox = 	"ItemToolbox" in items player;
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (!isNull _obj && _randNum2 < _tblProb) then {player removeWeapon "ItemToolbox"; cutText ["Your toolbox was used up!", "PLAIN DOWN"];};
		sleep 1.5;
};
};
};

if (_longWait && _failRemove) then {
	_cnt = _longWloop;
	_cnt = _cnt * 10 + 10;
	for "_i" from 0 to _longWloop do
	{
		cutText [format["Attempting to deconstruct %1  %2 seconds left.  Move from current position to cancel",_classname,_cnt], "PLAIN DOWN",1];
		if (player distance _locationPlayer > 0.2) then {cutText [format["Removal canceled for %1, position of player moved",_text], "PLAIN DOWN",1]; remProc = true; breakOut "exit";};
		if (!_canDo || _onLadder || _inVehicle) then {cutText [format["Removal canceled for %1, player is unable to continue",_text], "PLAIN DOWN",1]; remProc = true; breakOut "exit";};
		player playActionNow "Medic";
		sleep 1;
		[player,"repair",0,false] call dayz_zombieSpeak;
		_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
		sleep _wait;
		_hasToolbox = 	"ItemToolbox" in items player;
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		_cnt = _cnt - 10;
	};
		_hasToolbox = 	"ItemToolbox" in items player;
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (!isNull _obj && _randNum2 < _tblProb) then {player removeWeapon "ItemToolbox"; cutText ["Your toolbox was used up!", "PLAIN DOWN"];};
		sleep 1.5;
		cutText [format["You failed to remove %1!",_text], "PLAIN DOWN",6]; remProc = true; breakOut "exit";
} else {
if (_medWait && _failRemove) then {
	_cnt = _medWloop;
	_cnt = _cnt * 10 + 10;
	for "_i" from 0 to _medWloop do
	{
		cutText [format["Attempting to deconstruct %1  %2 seconds left.  Move from current position to cancel",_classname,_cnt], "PLAIN DOWN",1];
		if (player distance _locationPlayer > 0.2) then {cutText [format["Removal canceled for %1, position of player moved",_text], "PLAIN DOWN",1]; remProc = true; breakOut "exit";};
		if (!_canDo || _onLadder || _inVehicle) then {cutText [format["Removal canceled for %1, player is unable to continue",_text], "PLAIN DOWN",1]; remProc = true; breakOut "exit";};
		player playActionNow "Medic";
		sleep 1;
		[player,"repair",0,false] call dayz_zombieSpeak;
		_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
		sleep _wait;
		_hasToolbox = 	"ItemToolbox" in items player;
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		_cnt = _cnt - 10;
	};
		_hasToolbox = 	"ItemToolbox" in items player;
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (!isNull _obj && _randNum2 < _tblProb) then {player removeWeapon "ItemToolbox"; cutText ["Your toolbox was used up!", "PLAIN DOWN"];};
		sleep 1.5;
		cutText [format["You failed to remove %1!",_text], "PLAIN DOWN",6]; remProc = true; breakOut "exit";
} else {
if (_smallWait && _failRemove) then {
	_cnt = _smallWloop;
	_cnt = _cnt * 10 + 10;
	for "_i" from 0 to _smallWloop do
	{
		cutText [format["Attempting to deconstruct %1  %2 seconds left.  Move from current position to cancel",_classname,_cnt], "PLAIN DOWN",1];
		if (player distance _locationPlayer > 0.2) then {cutText [format["Removal canceled for %1, position of player moved",_text], "PLAIN DOWN",1]; remProc = true; breakOut "exit";};
		if (!_canDo || _onLadder || _inVehicle) then {cutText [format["Removal canceled for %1, player is unable to continue",_text], "PLAIN DOWN",1]; remProc = true; breakOut "exit";};
		player playActionNow "Medic";
		sleep 1;
		[player,"repair",0,false] call dayz_zombieSpeak;
		_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
		sleep _wait;
		_hasToolbox = 	"ItemToolbox" in items player;
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		_cnt = _cnt - 10;
	};
		_hasToolbox = 	"ItemToolbox" in items player;
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_classname], "PLAIN DOWN",1];remProc = true; breakOut "exit"; };
		if (!isNull _obj && _randNum2 < _tblProb) then {player removeWeapon "ItemToolbox"; cutText ["Your toolbox was used up!", "PLAIN DOWN"];};
		sleep 1.5;
		cutText [format["You failed to remove %1!",_text], "PLAIN DOWN",6]; remProc = true; breakOut "exit";
};
};
};

//Player removes object successfully
if (!isNull _obj) then {
cutText [format["You removed a %1 successfully!",_text], "PLAIN DOWN"];
	//dayzDeleteObj = [_dir, _pos, _objectID, _objectUID];
	dayzDeleteObj = [_objectID,_objectUID];
publicVariableServer "dayzDeleteObj";
if (isServer) then {
	dayzDeleteObj call local_deleteObj;
};
sleep .1;
deleteVehicle _obj;
};
remProc = true;