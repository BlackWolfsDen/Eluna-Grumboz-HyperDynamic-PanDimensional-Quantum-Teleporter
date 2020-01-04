-- by slp13at420
-- Designed For Mangos Eluna

-- EMU : Mangos
-- Build : non-specific
-- Type : Eluna script
-- Map/GPS Patch Support : <= 4.3.4 {DoW, TBC, WotLK, Cata}

-- Start Date : 01/01/2020
-- Finish Date : 01/03/2020

-- tele points are all from Rochet2's sql teleporter. yes 1 at a time I added them manually.
-- parses for team, level, AND GM's


print();
print("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+")
print("+                           +");

local expansion = (GetCoreName()..GetCoreExpansion());
-- Define the Table --
local Teleport = {};

-- Table BluePrint --
-- {"Menu Title", menu_icon, menu_team, expansion,
--							 {"location title", loc_icon, loc_team, loc_minimum_level, map, x, y, z, o, expansion},}

-- icon 0=bubble::1=bag::2=flight::3=book::4=wheel::5=wheel::6=bag dot::7=bubble dots::8=tabard::9=2swords::10=dot

-- team :: 0 = ally, 1 = horde,  2 = horde/ally, 3 = gm /:T:\ 2 team menu/location checks for a reason
-- 1 menu team check so you can make faction only menus // 1 location team check so
-- yea ofc so you can have faction specific tele points.
-- 2 expansion checks Menu/location so this script can work seamlesly on any Mangos build
-- without any editing. it just adapts ...


-- Populate the Table --
Teleporter = {
			{"|cff000000Eastern Kingdoms|r", 2, 2, 0,
					{
				{"GuruBashi Arena", 9, 2, 1, 0, -13232.232422, 220.996262, 32.145123, 1.095633, 0},
				{"Elwynn Forest", 2, 2, 1, 0, -9449.059570, 64.839203, 56.112045, 3.070470, 0},
				{"Dun Morogh", 2, 0, 1, 0, -5603.759766, -482.704010, 396.980011, 5.234990, 0},
				{"Loch Modan", 2, 0, 1, 0, -5405.850098, -2894.149902, 341.971985, 5.482380, 0},
				{"Westfall", 2, 0, 1, 0, -10684.900391, 1033.630005, 32.538898, 6.073840, 0},
				{"RedRidge Mountains", 2, 0, 1, 0, -9447.799805, -2270.850098, 71.822052, 6.260733, 0},
				{"Duskwood", 2, 0, 1, 0, -10531.700195, -1281.910034, 38.859528, 1.455707, 0},
				{"EverSong Woods", 2, 2, 1, 530, 9024.370117, -6682.549805, 16.897291, 3.141310, 1},
				{"TirisFal Glades", 2, 1, 1, 0, 2274.949951, 323.917999, 34.114174, 4.243670, 0},
				{"Ghostlands", 2, 1, 1, 530, 7595.729980, -6819.600098, 84.371803, 2.565610, 1},
				{"SilverPine Forest", 2, 1, 1, 0, 505.126007, 1504.630005, 124.807999, 1.779870, 0},
				{"Hillsbrad Foothills", 2, 2, 1, 0, -385.804993, -787.953979, 54.665501, 1.039260, 0},
				{"Wetlands", 2, 0, 1, 0, -3517.750000, -913.401001, 8.866250, 2.607050, 0},
				{"Alterac Mountains", 2, 2, 1, 0, 275.049011, -652.044006, 130.296005, 0.502032, 0},
				{"Arathi HighLands", 2, 2, 1, 0, -1581.449951, -2704.060059, 35.416801, 0.490373, 0},
				{"StrangleThorn Vale", 2, 2, 1, 0, -11921.70195, -59.543999, 39.726200, 3.735740, 0},
				{"BadLands", 2, 2, 1, 0, -6782.560059, -3128.139893, 240.479996, 5.659120, 0},
				{"Swamp of Sorrows", 2, 2, 1, 0, -10368.599609, -2731.300049, 21.653700, 5.292380, 0},
				{"The HinterLands", 2, 2, 1, 0, 112.405998, -3929.739990, 136.358002, 0.981903, 0},
				{"Searing Gorge", 2, 2, 1, 0, -6686.330078, -1198.550049, 240.026978, 0.916887, 0},
				{"The Blasted Lands", 2, 2, 1, 0, -11184.700195, -3019.310059, 7.292380, 3.205420, 0},
				{"Burning Steppes", 2, 2, 1, 0, -7980.850098, -2106.816406, 127.943581, 5.509886, 0},
				{"Western PlagueLands", 2, 2, 1, 0, 1745.388916, -1723.411987, 59.671574, 4.970188, 0},
				{"Eastern PlagueLands", 2, 2, 1, 0, 2280.639893, -5275.049805, 82.016602, 4.747900, 0},
				{"Isle of Quel'Danas", 2, 2, 1, 530, 12806.500000, -6911.109863, 41.115601, 2.229350, 1},
					};
			},
		
			{"|cff000000Kalimdor|r", 2, 2, 0,
						{
				{"Azuremyste Isle", 2, 0, 1, 530, -4192.620117, -12576.700195, 36.759800, 1.628130, 1},
				{"Teldrassil", 2, 0, 1, 1, 9887.541992, 918.218750, 1307.431885, 0.313330, 0},
				{"Bloodmyst Isle", 2, 0, 1, 530, -2095.699951, -11841.099609, 51.155701, 6.192880, 1},
				{"Durotar", 2, 1, 1, 1, -601.652100, -4238.582520, 38.956200, 4.618780, 0},
				{"Mulgore", 2, 1, 1, 1, -2473.870117, -501.225006, -9.424650, 0.652500, 0},
				{"The Barrens", 2, 1, 1, 1, -575.771973, -2652.449951, 95.638397, 0.006469, 0},
				{"DarkShore", 2, 0, 1, 1, 6463.250000, 683.986023, 8.927920, 4.335340, 0},
				{"StoneTalon Mountains", 2, 2, 1, 1, 1577.100586, 1031.691772, 137.103836, 4.586700, 0},
				{"Ashenvale Forest", 2, 2, 1, 1, 1919.770020, -2169.679932, 94.672897, 6.141770, 0},
				{"Thousand Needles", 2, 1, 1, 1, -5375.529785, -2509.199951, -40.431999, 2.418850, 0},
				{"Desolace", 2, 2, 1, 1, -656.056030, 1510.119995, 88.374603, 3.295530, 0},
				{"Dustwallow Marsh", 2, 2, 1, 1, -3350.120117, -3064.850098, 33.036400, 5.228760, 0},
				{"Feralas", 2, 0, 1, 1, -4808.310059, 1040.510010, 103.768997, 2.906550, 0},
				{"Tanaris Desert", 2, 0, 1, 1, -6940.910156, -3725.699951, 48.938099, 3.111740, 0},
				{"Azshara", 2, 0, 1, 1, 3117.120117, -4387.970215, 91.905899, 5.498970, 0},
				{"Felwood", 2, 0, 1, 1, 3898.800049, -1283.329956, 220.518982, 0.757063, 0},
				{"Un'Goro Crater", 2, 2, 1, 1, -6291.549805, -1158.619995, -258.138000, 0.457099, 0},
				{"Silithis", 2, 2, 1, 1, -6815.250000, 730.015015, 40.948299, 2.390660, 0},
				{"Winterspring", 2, 2, 1, 1, 6658.493652, -4558.605469, 717.373352, 2.985695, 0},
					};
			},	
			
			{"|cff000000Outland|r", 2, 2, 1, 
					{
				{"HellFire Peninsula", 2, 2, 1, 530, -207.335007, 2035.920044, 96.463997, 1.596760, 1},
				{"Zangarmarsh", 2, 2, 1, 530, -220.296997, 5378.580078, 23.322300, 1.617180, 1},
				{"Terokkar Forest", 2, 2, 1, 530, -2266.229980, 4244.729980, 1.477280, 3.684260, 1},
				{"Nagrand", 2, 2, 1, 530, -1610.849976, 7733.620117, -17.277300, 1.335220, 1},
				{"Blade's Edge Mountains", 2, 2, 1, 530, 2029.750000, 6232.069824, 133.494980, 1.303950, 1},
				{"NetherStorm", 2, 2, 1, 530, 3271.199951, 3811.610107, 143.153000, 3.425308, 1},
				{"ShadowMoon Valley", 2, 2, 1, 530, -3681.010010, 2350.760010, 76.586998, 4.259950, 1},
				{"Shattrath", 2, 2, 1, 530, -1822, 5417, 1, 3, 1},
					};
			},
			
			{"|cff000000Northrend|r", 2, 2, 1, 
					{
				{"Borean Tundra", 2, 2, 1, 571, 2954.239990, 5379.129883, 60.453800, 2.555440, 1},
				{"Howling Fjord", 2, 2, 1, 571, 682.848022, -3978.300049, 230.160995, 1.542070, 1},
				{"Dragonblight", 2, 2, 1, 571, 2678.169922, 891.825989, 4.374940, 0.101121, 1},
				{"Grizzly Hills", 2, 2, 1, 571, 4017.350098, -3403.850098, 290.000000, 5.354310, 1},
				{"Zul'Drak", 2, 2, 1, 571, 5560.229980, -3211.659912, 371.709015, 5.550550, 1},
				{"Sholazar Basin", 2, 2, 1, 571, 5614.669922, 5818.859863, -69.722000, 3.608070, 1},
				{"Crystalsong Forest", 2, 2, 2, 1, 571, 5411.169922, -699.369995, 167.082001, 1.571670, 1},
				{"Storm Peaks", 2, 2, 1, 571, 6120.459961, -1013.890015, 408.390015, 5.123220, 1},
				{"Icecrown", 2, 2, 1, 571, 8323.280273, 2763.500000, 655.093018, 2.872230, 1},
				{"Wintergrasp", 2, 2, 1, 571, 4522.229980, 2828.010010, 389.975006, 0.215009, 1},
					};
			},
			
			{"|cff000000Classic Dungeons|r", 9, 2, 0,
					{
				{"Gnomeregan", 2, 0, 1, 0, -5163.540036, 925.422974, 257.179596, 1.472128, 0},
				{"The Deadmines", 2, 0, 1, 0, 11209.599609, 1666.540039, 24.697399, 1.420530, 1},
				{"The Stockade", 2, 0, 1, 0, -8799.150391, 832.718018, 97.634804, 6.040850, 0},
				{"RageFire Chasm", 2, 1, 1, 1, 1811.780029, -4410.500000, -18.470400, 5.201650, 1},
				{"Razorfen Downs", 2, 1, 1, 1, -4657.299805, -2519.350098, 81.052902, 4.548080, 0},
				{"Razorfen Kraul", 2, 1, 1, 1, -4470.279785, -1677.770020, 81.392746, 1.163020, 0},
				{"Scarlet Monastery", 2, 1, 1, 0, 2873.149902, -764.523010, 160.332001, 5.104470, 0},
				{"ShadowFang Keep", 2, 1, 1, 0, -234.675003, 1561.630005, 76.892097, 1.240310, 0},
				{"Wailing Caverns", 2, 1, 1, 1, -731.606995, -2218.389893, 17.028099, 2.784860, 0},
				{"Blackfathom Deeps", 2, 2, 1, 1, 4249.990234, 740.101990, -25.671000, 1.340620, 0},
				{"Blackrock Depths", 2, 2, 1, 0, -7179.339844, -921.211975, 165.820999, 5.095990, 0},
				{"Blackrock Spire", 2, 2, 1, 0, -7527.049805, -1226.770020, 285.731995, 5.296260, 0},
				{"Dire Maul", 2, 2, 1, 1, -3520.139893, 1119.380005, 161.024994, 4.704540, 0},
				{"Maraudon", 2, 2, 1, 1, -1421.420044, 2907.830078, 137.414993, 1.707180, 0},
				{"Scholomance", 2, 2, 1, 0, 1269.640015, -2556.209961, 93.608795, 0.620623, 0},
				{"Stratholme", 2, 2, 1, 0, 3352.919922, -3379.030029, 144.781998, 6.259780, 0},
				{"Sunken Temple", 2, 2, 1, 0, -10177.900391, -3994.899902, -111.253235, 6.018850, 0},
				{"Uldaman", 2, 2, 1, 0, -6071.370117, -2955.159912, 209.781998, 0.015708, 0},
				{"Zul'Farrak", 2, 2, 1, 1, -6801.189941, -2893.020020, 9.003880, 0.158639, 0},
					};
			},
			
			{"|cff000000Burning Crusades Dungeons|r", 9, 2, 1,
					{
				{"Auchindoun", 2, 2, 1, 530, -3324.489990, 4943.450195, -101.238998, 4.639010, 1},
				{"Caverns of Time", 2, 2, 1, 1, -8369.650391, -4253.109863, -204.272003, 3.577925, 1},
				{"Coilfang Reservoir", 2, 2, 1, 530, 738.864990, 6865.770020, -69.456904, 6.276550, 1},
				{"Hellfire Citadel", 2, 2, 1, 530, -347.290009, 3089.820069, 21.393999, 5.681140, 1},
				{"Magisters' Terrace", 2, 2, 1, 530, 12884.599609, -7317.689941, 65.502296, 4.799000, 1},
				{"Tempest Keep", 2, 2, 1, 530, 3100.479980, 1536.489990, 190.300003, 4.622260, 1},
					};
			},
			
			{"|cff000000Wotlk Dungeons|r", 9, 2, 2,
					{
				{"Azjol-Nerub", 2, 2, 1, 571, 3707.860107, 2150.229980, 36.756954, 3.220000, 2},
				{"The Culling of Stratholme", 2, 2, 1, 1, -8756.389648, -4440.680176, -199.489014, 4.662890, 2},
				{"Trial of the Champion", 2, 2, 1, 571, 8590.950195, 791.791992, 558.234985, 3.119493, 2},
				{"Drak'Tharon Keep", 2, 2, 1, 571, 4759.796875, -2045.651611, 229.394989, 0.062958, 2},
				{"Gundrak", 2, 2, 1, 571, 6722.439941, -4640.669922, 450.631989, 3.911230, 2},
				{"IceCrown Citidel Dungeons", 2, 2, 1, 571, 5637.354492, 2067.713867, 798.058411, 4.622055, 2},
				{"The Nexus Dungeons", 2, 2, 1, 571, 3771.220459, 6948.192383, 105.802040, 0.443879, 2},
				{"The Violet Hold", 2, 2, 1, 571, 5693.080078, 502.588013, 652.671997, 4.076307, 2},
				{"Halls of Lightning", 2, 2, 1, 571, 9136.519531, -1311.810059, 1066.290039, 5.191130, 2},
				{"Halls of Stone", 2, 2, 1, 571, 8922.120117, -1009.159973, 1039.560059, 1.570440, 2},
				{"Utgarde Keep", 2, 2, 1, 571, 1203.410034, -4868.589844, 41.248600, 0.283237, 2},
				{"Utgarde Pinnacle", 2, 2, 1, 571, 1203.410034, -4868.589844, 41.248600, 0.283237, 2},
					};
			},
			
			{"|cff000000Cataclysm Raid Locations|r", 9, 2, 3,
					{
				{"Pechschwingenabstieg", 2, 2, 1, 0, -7533.682129, -1209.040039, 477.726227, 1.953624, 3},
				{"Thron der vier Winde", 2, 2, 1, 1, -11355.214844, 58.152069, 723.883606, 1.976673, 3},
				{"Brandin Hold", 2, 2, 1, 732,  -1251.937134, 1050.386108, 106.994698, 3.158482, 3},
				{"Bastion des Zwielichts", 2, 2, 1, 0, -4884.354004, -4253.973633, 827.763611, 2.060737, 3},
				{"Feuerlande", 2, 2, 1, 1, 3993.743652, -2956.993896, 1002.547424, 1.966209, 3},
				{"Drachenseele", 2, 2, 1, 1, -8273.353516, -4517.355957, -219.333969, 0.558964, 3},
				{"Drachenseele", 2, 2, 1, 1, -8273.353516, -4517.355957, -219.333969, 0.558964, 3},
					};
			},
			
			{"|cff000000Cataclysm Instances|r", 9, 2, 3,
					{
				{"Die Todesmine", 2, 2, 1, 0, -11207.520508, 1668.632690, 24.623632, 1.576529, 3},
				{"Burg Schattenfang", 2, 2, 1, 0, -245.124878, 1534.565063, 76.890091, 1.196693, 3},
				{"Grim Batol", 2, 2, 1, 0, -4062.229980, -3450.429932, 280.571014, 0.390264, 3},
				{"Zul Aman", 2, 2, 1, 530, 6851.167480, -7948.453613, 170.061768, 4.694218, 3},
				{"Zul Gurub", 2, 2, 1, 0, -11916.513672, -1204.576904, 92.287773, 4.729164, 3},
				{"Der Steinerne Kern", 2, 2, 1, 646, 1020.976868, 654.496826, 156.671310, 4.933526, 3},
				{"Die Stunde des Zwielichts", 2, 2, 1, 1,  -8292.754883, -4554.543457, -222.483215, 4.710849, 3},
				{"Brunen der Ewigkeit", 2, 2, 1, 1, -8602.987305, -4031.282715, -208.407211, 1.247818, 3},
				{"End Zeit", 2, 2, 1, 1,  -8327.620117, -4475.427734, -208.855865, 0.500819, 3},
				{"Der Vortexgipfel", 2, 2, 1, 1, -11505.550781, -2303.350586, 608.393616, 3.814200, 3},
				{"Thron der Gezeiten", 2, 2, 1, 0, -5598.150391, 5412.423340, -1798.709961, 5.561488, 3},
				{"Die Verlorene Stadt von der Tol vir", 2, 2, 1, 1, -10662.940430, -1301.864380, 15.353823, 3.387370, 3},
				{"Halle der Origination", 2, 2, 1, 1, -10188.481445, -1837.926880, 20.127676, 3.141458, 3},
				{"Schwarzfelshölen", 2, 2, 1, 0, -7571.896484, -1317.194458, 245.536163, 4.842430, 3},
					};
			},
			
			{"|cff000000Raid Locations|r", 9, 2, 0,
					{
				{"Black Temple", 2, 2, 1, 530, -3649.919922, 317.468994, 35.282700, 2.942850, 1},
				{"BlackWing Lair", 2, 2, 1, 229, 152.451004, -474.881012, 116.839996, 0.001073, 0},
				{"Hyjal Summit", 2, 2, 1, 530, -8177.890137, -4181.229980, -167.552002, 0.913338, 1},
				{"Serpentshrine Cavern", 2, 2, 1, 530, 797.854980, 6865.770020, -65.416496, 0.005938, 1},
				{"Trial of the Crusader", 2, 2, 1, 571, 8515.610352, 714.153015, 558.247986, 1.577530, 1},
				{"Gruul's Lair", 2, 2, 1, 530, 3530.060059, 5104.080078, 3.508610, 5.511170, 1},
				{"Magtheridon's Lair", 2, 2, 1, 530, -336.411011, 3130.459961, -102.928001, 5.203220, 1},
				{"ICC", 2, 2, 1, 571, 5786.502930, 2069.897461, 636.064697, 3.578990, 1},
				{"Karazhan", 2, 2, 1, 0, -11118.900391, -2010.329956, 47.081814, 0.649895, 0},
				{"Molten Core", 2, 2, 1, 230, 1126.640015, -459.940002, -102.535011, 3.460950, 0},
				{"Naxxramas", 2, 2, 1, 571, 3668.719971, -1262.459961, 243.621994, 4.785000, 1},
				{"Onyxia's Lair", 2, 2, 1, 1, -4708.270020, -3727.639893, 54.558887, 3.727860, 0},
				{"Ruins of Ahn'Qiraj", 2, 2, 1, 1, -8409.820313, 1499.060059, 27.716608, 2.412651, 0},
				{"Sunwell Platue", 2, 2, 1, 530, 12574.099609, -6774.810059, 15.090400, 3.137880, 1},
				{"The Eye", 2, 2, 1, 530, 3088.489990, 1381.569946, 184.863007, 4.619730, 1},
				{"Temple of Ahn'Qiraj", 2, 2, 1, 1, -8240.089844, 1991.319946, 129.071960, 0.941603, 0},
				{"The Eye of Eternity", 2, 2, 1, 571, 3784.169922, 7028.839844, 161.257996, 5.799930, 1},
				{"The Obsidian Sanctum", 2, 2, 1, 571, 3472.429932, 264.923004, -120.146004, 3.279230, 1},
				{"Ulduar", 2, 2, 1, 571, 9333.450195, -1114.741333, 1245.146973, 6.244076, 1},
				{"Vault of Archavon", 2, 2, 1, 571, 5453.720215, 2840.790039, 421.277069, 0.000000, 1},
				{"Zul'Gurub", 2, 2, 1, 0, -11916.231445, -1215.714233, 92.288994, 4.724540, 0},
				{"Zul'Aman", 2, 0, 1, 530, 6851.779785, -7972.569824, 179.242004, 4.646910, 1},
					};
			},
			
			{"|cff000000Malls|r", 10, 2, 0,
					{
				{"|cffFF0000Orgrimmar|r", 1, 1, 1, 1, 1600.981689, -4378.820313, 9.998322, 5.248190, 0}, -- Horde
				{"|cff0000FFIronForge|r", 1, 0, 1, 0, -4902.000488, -960.816162, 501.458954, 2.207237, 0}, -- Ally
				{"Shattrath", 1, 2, 1, 530, -1887.619995, 5359.089844, -12.427900, 1.258830, 1},
					};
			},
			
			{"|cff000000Custom Location|r", 10, 2, 0,
					{
				{"StormWind", 2, 0, 1, 0, -8842.089844, 626.357971, 94.086632, 0.440620, 0},
				{"Darnassus", 2, 0, 1, 1, 9870.209961, 2493.469971, 1315.876221, 5.974544, 0},
				{"Exodar", 2, 0, 1, 530, -3864.919922, -11643.700195, -137.644012, 2.410226, 1},
				{"Thunder Bluff", 2, 1, 1, 1, -1274.449951, 71.860100, 128.158981, 0.707645, 0},
				{"Undercity", 2, 1, 1, 0, 1637.209961, 240.132004, -43.103401, 3.131470, 0},
				{"Silvermoon City", 2, 1, 1, 530, 9741.669922, -7454.189941, 13.557200, 3.142310, 1},
				{"Dalaran", 2, 2, 1, 571, 5807.060059, 506.243988, 657.575989, 5.544610, 1},
				{"Booty Bay", 2, 2, 1, 0, -14281.988281, 552.414001, 8.904944, 4.063786, 0},
				{"GuruBashi Arena", 9, 2, 1, 0, -13232.232422, 220.996262, 32.145123, 1.095633, 0},
					};
			},
			
			{"|cff000000Event areas|r", 10, 2, 0, {};
			},
					
			{"|cff000000GM Locations|r", 10, 3, 0, 
					{
				{"GM Island", 1, 3, 1, 1, 16205.684570, 16215.493164, 1.10999, 1.064954, 0},
					};
			},

			{"|cff000000 Locations 1|r", 10, 2, 0, {};
			},

			{"|cff000000 Locations 2|r", 10, 2, 0, {};
			},

			{"|cff000000 Locations 3|r", 10, 2, 0, {};
			},

			{"|cff000000 Locations 4|r", 10, 2, 0, {};
			},

			{"|cff000000 Locations 5|r", 10, 2, 0, {};
			},

			{"|cff000000 Locations 6|r", 10, 2, 0, {};
			},

			{"|cff000000 Locations 7|r", 10, 2, 0, {};
			},

			{"|cff000000 Locations 8|r", 10, 2, 0, {};
			},

};

--[[
ATTN:
	DO NOT edit/modify anything below this point
	UNLESS you KNOW what your DOING or or you may 
	CRASH the script !!!
]]--

-- Define global variables local to the script --
local npcid = 170000
local itemid = 40582
local intoffset = 10000;
local Allowed_Entries = 12;
local CORE_EXPANSION = GetCoreExpansion();
local ENTRY_KEY = 5;

-- Define Menu Entry Colors --
local FRIENDLY = "|cff004D0D";
local HOSTILE = "|cffAF002A";
local GAMEMASTER = "|cff404040";
local COLOR_END = "|r";

local function TeleportStoneOnHello(event, player, unit, sender, intid, code)

	if (player:IsInCombat()~=true)then	-- Show main menu

	    local i = 0;
	    local entry = 0;
	    local sSize = #Teleporter;
	    
			for i = i+1, sSize do
				
				if(Teleporter[i][4] <= CORE_EXPANSION)then
				
					if(Teleporter[i][3] == 2)or(Teleporter[i][3] == player:GetTeam())or(player:IsGM() == true)then
					
						player:GossipMenuAddItem(Teleporter[i][2], Teleporter[i][1], i, 1)
			    			
		    			entry = entry+1;
					end
		
			   		if(entry == Allowed_Entries)then
		
						player:GossipMenuAddItem(7, "next..", 0, i+1) -- GossipMenuAddItem(icon, name, sender, intid);
		
						break;
			   		end
		   		end
			end
		
	    player:GossipSendMenu(1, unit)

	else
		player:SendNotification("You are in combat.")
	end
end

local function TeleporterOnGossipSelect(event, player, unit, sender, intid, code)

	if (sender == 0) then -- Continue Menu

	    -- Teleporter[key]{"Menu Title", icon, team, expansion
	    
		local i;
	    local entry = 0;
	    local sSize = #Teleporter;
	    
	    if(intid == 0)then
	    	intid = 1;
	    end
	    
		for i = intid, sSize do
		
			if(Teleporter[i][4] <= CORE_EXPANSION)then

				local mTeam = Teleporter[i][3];
				local pTeam = player:GetTeam();
				
				if((mTeam == 2) or (mTeam == pTeam) or player:IsGM())then
				
					player:GossipMenuAddItem(Teleporter[i][2], Teleporter[i][1], i, 1);
		    			
	    			entry = entry+1;
				end
	
		   		if(entry == Allowed_Entries)then
	
					player:GossipMenuAddItem(3, "next..", 0, i+1) -- GossipMenuAddItem(icon, name, sender, intid);
	
					break;
		   		end
		   	end	   		
		end

		if(intid >= Allowed_Entries) then 
			player:GossipMenuAddItem(3, "Back..", 0, 1)
		end

		player:GossipSendMenu(1, unit);
		return;
	end
	
	if (intid > (intoffset))then

		local int = intid-intoffset;
		
		local name, icon, team, level, map, x, y, z, o, expansion = table.unpack(Teleporter[sender][ENTRY_KEY][int]);
		
		player:Teleport(map, x, y, z, o);
	
		player:GossipComplete();

		return;
	end

-- teleport location sub menu --
--  {"location name", icon, team, minimum level, map, x, y, z, o},}

	if (sender >= 1)then-- Show teleport sub-menu
	
			if(intid == 0)then 
				intid = 1;
			end
			
		local a = 0;
		local entry = 0;
		local tSize = #Teleporter[sender][ENTRY_KEY];
		local pTeam = player:GetTeam();
		
			for a = a+intid, tSize do
			
				if(Teleporter[sender][ENTRY_KEY][a][10] <= CORE_EXPANSION)then
		
					local eTeam = Teleporter[sender][ENTRY_KEY][a][3];
	
						if((eTeam == 2) or (eTeam == pTeam) or player:IsGM())then
					
							local color;
							
							
							local name, icon, team, level, map, x, y, z, o, expansion = table.unpack(Teleporter[sender][ENTRY_KEY][a]);
							
								if((eTeam == 2) or (eTeam ~= pTeam))then color = HOSTILE;end
								if(eTeam == pTeam)then color = FRIENDLY;end
								if(eTeam == 3)then color = GAMEMASTER;end
								
							player:GossipMenuAddItem(icon, color..name..COLOR_END, sender, (a+intoffset)) -- GossipMenuAddItem(icon, name, sender, intid);
								
							entry = entry+1;
					
						end -- entry team check
						
				end -- expansion check
	
				if((entry == Allowed_Entries) or (a == tSize))then
				
						if(a < tSize)then
							player:GossipMenuAddItem(3, "|cff00308FNext|r", sender, (a+1)) -- GossipMenuAddItem(icon, name, sender, intid);
						end
					
						if(intid > Allowed_Entries)then
	
							player:GossipMenuAddItem(3, "|cff00308FBack|r", sender, 1) -- GossipMenuAddItem(icon, name, sender, intid);
							
						end
	
					player:GossipMenuAddItem(3, "|cff00308FMain Menu|r", 0, 0)
					
					break;
				end	-- max entry check triggered
			end -- for/do loop
		
		player:GossipSendMenu(1, unit)
		
	end
end

RegisterItemGossipEvent(itemid, 1, TeleportStoneOnHello)
RegisterItemGossipEvent(itemid, 2, TeleporterOnGossipSelect)

print("+          Grumboz          +");
print("+       Hyper-Dynamic       +");
print("+      Pan-Dimensional      +");
print("+        Teleporter         +");
print("+          online           +");
print("+                           +");
print("+          "..expansion.."          +");
print("+                           +");
print("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
