ModLoader.SetupFileHook( "lua/Balance.lua", "lua/SiegeBalance/Balance.lua", "post" )
ModLoader.SetupFileHook( "lua/BalanceHealth.lua", "lua/SiegeBalance/BalanceHealth.lua", "post" )
ModLoader.SetupFileHook( "lua/BalanceMisc.lua", "lua/SiegeBalance/BalanceMisc.lua", "post" )
ModLoader.SetupFileHook( "lua/Armory_Server.lua", "lua/SiegeBalance/Armory_Server.lua", "post" )
ModLoader.SetupFileHook( "lua/MAC.lua", "lua/SiegeBalance/postMAC.lua" , "post" )
ModLoader.SetupFileHook( "lua/ARC.lua", "lua/SiegeBalance/postARC.lua" , "post" )
ModLoader.SetupFileHook( "lua/TechData.lua", "lua/SiegeBalance/TechData.lua" , "post" )
ModLoader.SetupFileHook( "lua/VoiceOver.lua", "lua/SiegeBalance/VoiceOver.lua" , "post" )
ModLoader.SetupFileHook( "lua/Onos.lua", "lua/SiegeBalance/Onos.lua" , "post" )



-- this replaces all help screens
ModLoader.SetupFileHook( "lua/Hud/HelpScreen/HelpScreenContent.lua", "lua/SiegeBalance/HelpScreenContent.lua" , "post" )
ModLoader.SetupFileHook( "lua/Hud/HelpScreen/HelpScreen.lua", "lua/SiegeBalance/HelpScreen.lua" , "post" )
