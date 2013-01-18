private["_inVehicle","_wallTypes","_wall","_vehPos","_nearestVeh","_nearestVehs","_isVehicle"];

if (animationstate player == "acrgpknlmstpsnonwnondnon_amovpercmstpsnonwnondnon_getoutlow" || animationstate player == "acrgpknlmstpsnonwnondnon_amovpercmstpsraswrfldnon_getoutlow" || animationstate player == "acrgpknlmstpsnonwnondnon_amovpercmstpsraswpstdnon_getoutlow") then {
_inVehicle = (vehicle player != player);
_isVehicle = (vehicle player);
//_nearBool = true;
		_wallTypes = nearestObjects [player, ["Fence_Ind","Fort_RazorWire","Fence_Ind_long","Fence_corrugated_plate","Land_fort_rampart_EP1","Land_Fort_Watchtower","Concrete_Wall_EP1","Base_WarfareBBarrier10xTall","Land_HBarrier_large","Land_Misc_Cargo2E","Misc_Cargo1Bo_military","Ins_WarfareBContructionSite","Misc_cargo_cont_small_EP1"], 16];
		if (count _wallTypes > 0) then {
				_wall = [_wallTypes, player] call BIS_fnc_nearestPosition;
				if (player distance _wall < 8) then {
						_nearestVehs = nearestObjects [player, ["LandVehicle"], 10];
						sleep .1;
						_nearestVeh = [_nearestVehs, player] call BIS_fnc_nearestPosition;
						sleep .1;
						_vehPos = getPosATL _nearestVeh;

						sleep .1;
						player allowdamage false;
						player setpos _vehPos;
						//player action ["eject", _isVehicle];//player moveInDriver (vehicle player);
						sleep 2;
						player allowdamage true;
						};
						
		};
	};