private["_cntLoop","_finished","_location","_item"];
_item = _this;
_finished = false;
_cntLoop = 0;
_location = getposATL player;
call gear_ui_init;
if (procChop) then {cutText ["Your already chopping wood!", "PLAIN DOWN"];breakOut "exit";};
r_interrupt = false;
r_doLoop = true;
procChop = true;
if (["forest",dayz_surfaceType] call fnc_inString) then {
	player playActionNow "Medic";
	[player,"repair",0,false] call dayz_zombieSpeak;
	cutText ["You begin chopping wood, to stop, move position.", "PLAIN DOWN"];
	sleep 1;
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
	//if (player distance _location > 0.1) then {cutText ["You canceled chopping wood by moving", "PLAIN DOWN"]; r_doLoop = true; procChop = false; breakOut "exit";};
	r_doLoop = true;
	_cntLoop = 0;
	procChop = false;
	if (_finished) then {
		_result = [player,"PartWoodPile"] call BIS_fnc_invAdd;
		if (_result) then {
			cutText [localize "str_player_25", "PLAIN DOWN"];
		} else { cutText [localize "str_player_24", "PLAIN DOWN"];};
	} else {
		r_interrupt = false;
		[objNull, player, rSwitchMove,""] call RE;
		player playActionNow "stop";
		cutText ["You canceled chopping wood by moving", "PLAIN DOWN"];
	};
} else {
	procChop = false;
	cutText [localize "str_player_23", "PLAIN DOWN"];
};