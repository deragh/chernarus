//addaction sends [target, caller, ID, (arguments)]

private ["_displayok","_lever","_convertInput", "_strKeyCode", "_si"];
_lever = cursortarget;

//try {

_si = 0;
_convertInput = [0,0,0,0,0,0];
_strKeyCode = toArray(_lever getVariable ["ObjectUID","0"]);	

//hint format["strKeycode:%1 ", _strKeyCode];
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
//} catch {
	//hint format["Error:%1", _exception];
	//sleep 3;
//};

//hint format["convertInput:%1 ", _convertInput];
//hint format["convertInput:%1 ", _convertInput];
//sleep 3;	

// keyCode = _lever getVariable ["ObjectUID","0"];
 
 keyCode = (toString _convertInput);
 
 //hint format["Keycode: %1 New Code: %2", keyCode, toString _convertInput];
    // (toString _convertInput)];

_displayok = createdialog "KeypadGate";
