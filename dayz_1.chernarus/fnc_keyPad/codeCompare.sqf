private ["_convertInput","_code", "_inputCode", "_validMatch"];
keyCode = _this select 0;
//hint format["keycode after enter: %1", keyCode];
sleep 3;
_code = keyCode;
_inputCode = _this select 1;

//hint format["Keycode: %1 | CodeInput: %2", _code, _inputCode];

_convertInput =+ _inputCode;

for "_i" from 0 to (count _convertInput - 1) do {_convertInput set [_i, (_convertInput select _i) + 48]};

//hint format["Keycode: %1 | CodeInput: %2", _code, (toString _convertInput)];

// compare arrays to see if code matches
_validMatch = [_code, (toString _convertInput)] call BIS_fnc_areEqual;


if (_validMatch) then {
	cutText ["### ACCESS GRANTED ###", "PLAIN DOWN"];
	keyValid = true;
	sleep 2;
	cutText ["You can now operate the bases gate panel(s) for 35 seconds", "PLAIN DOWN"];
	sleep 35;
	keyValid = false;
	cutText ["You no longer have gate access, type code in again to have access", "PLAIN DOWN"];
};
if (!_validMatch) then {
	cutText ["!!! ACCESS DENIED !!!", "PLAIN DOWN"];
	sleep 2;
	cutText ["Wrong code was entered", "PLAIN DOWN"];
};

CODEINPUT = [];
