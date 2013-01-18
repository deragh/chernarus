startLoadingScreen ["","DayZ_loadingScreen"];
enableSaving [false, false];

dayZ_instance = 1;	//The instance
hiveInUse	=	true;
initialized = false;
dayz_previousID = 0;

call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf"; //Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";	//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf"; //Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf"; //Compile regular functions
progressLoadingScreen 1.0;

player_build = compile preprocessFileLineNumbers "tweaks\player_build.sqf";
//player_disarmBomb = compile preprocessFileLineNumbers "tweaks\player_disarmBomb.sqf";
player_recipeBook = compile preprocessFileLineNumbers "tweaks\player_recipeBook.sqf";
player_remove = compile preprocessFileLineNumbers "tweaks\player_remove.sqf";
fnc_usec_selfActions = compile preprocessFileLineNumbers "fixes\fn_selfActions.sqf";

antiWall = compile preprocessFileLineNumbers "tweaks\antiWall.sqf";
anti_discWall = compile preprocessFileLineNumbers "tweaks\anti_discWall.sqf";
player_chopWood = compile preprocessFileLineNumbers "tweaks\player_chopWood.sqf";

remProc = true;
hasBuildItem = false;

CODEINPUT = [];
keyCode = [];
keyValid = false;

player setVariable ["BIS_noCoreConversations", true];
//enableRadio false;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	hiveInUse = true;
	_serverMonitor = [] execVM "\z\addons\dayz_server\system\server_monitor.sqf";
};

if (!isDedicated) then {
	0 fadeSound 0;
	0 cutText [(localize "STR_AUTHENTICATING"), "BLACK FADED",60];
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";

	_null = [] execVM "tweaks\player_addActions.sqf";
	_null = [] execVM "tweaks\take_itemFix.sqf";
	//_null = [] execVM "tweaks\player_bomb.sqf";

	_null = [] execVM "tweaks\initWall.sqf"; // (must be used with antiWall and anti_discWall)
	_null = [] execVM "tweaks\antiHeli.sqf";
	_null = [] execVM "tweaks\take_itemFix.sqf";

};
