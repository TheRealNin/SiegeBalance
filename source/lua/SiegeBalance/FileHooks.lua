ModLoader.SetupFileHook( "lua/Balance.lua", "lua/SiegeBalance/Balance.lua", "post" )
ModLoader.SetupFileHook( "lua/BalanceHealth.lua", "lua/SiegeBalance/BalanceHealth.lua", "post" )
ModLoader.SetupFileHook( "lua/BalanceMisc.lua", "lua/SiegeBalance/BalanceMisc.lua", "post" )
ModLoader.SetupFileHook( "lua/Armory_Server.lua", "lua/SiegeBalance/Armory_Server.lua", "post" )
ModLoader.SetupFileHook( "lua/MAC.lua", "lua/SiegeBalance/postMAC.lua" , "post" )
ModLoader.SetupFileHook( "lua/ARC.lua", "lua/SiegeBalance/postARC.lua" , "post" )
ModLoader.SetupFileHook( "lua/TechData.lua", "lua/SiegeBalance/TechData.lua" , "post" )
ModLoader.SetupFileHook( "lua/VoiceOver.lua", "lua/SiegeBalance/VoiceOver.lua" , "post" )
ModLoader.SetupFileHook( "lua/Onos.lua", "lua/SiegeBalance/Onos.lua" , "post" )
ModLoader.SetupFileHook( "lua/Clog.lua", "lua/SiegeBalance/Clog.lua" , "post" )
ModLoader.SetupFileHook( "lua/Globals.lua", "lua/SiegeBalance/Globals.lua" , "post" )
ModLoader.SetupFileHook( "lua/Crag.lua", "lua/SiegeBalance/Crag.lua", "post")
ModLoader.SetupFileHook( "lua/PowerPoint.lua", "lua/SiegeBalance/PowerPoint.lua" , "post" )
ModLoader.SetupFileHook( "lua/Alien_Server.lua", "lua/SiegeBalance/Alien_Server.lua" , "post" )
ModLoader.SetupFileHook( "lua/Cyst.lua", "lua/SiegeBalance/Cyst.lua" , "post" )
ModLoader.SetupFileHook( "lua/Lerk.lua", "lua/SiegeBalance/Lerk.lua" , "post" )
ModLoader.SetupFileHook( "lua/Egg.lua", "lua/SiegeBalance/Egg.lua" , "post" )
ModLoader.SetupFileHook( "lua/Shift.lua", "lua/SiegeBalance/Shift.lua" , "post" )


-- add a simple "POLL: " in front of custom votes.... not sure where else to put this....
ModLoader.SetupFileHook( "lua/Voting.lua", "lua/SiegeBalance/Voting.lua" , "post" )

-- this replaces all help screens
ModLoader.SetupFileHook( "lua/Hud/HelpScreen/HelpScreenContent.lua", "lua/SiegeBalance/HelpScreenContent.lua" , "post" )
ModLoader.SetupFileHook( "lua/Hud/HelpScreen/HelpScreen.lua", "lua/SiegeBalance/HelpScreen.lua" , "post" )

-- Railgun buff
ModLoader.SetupFileHook( "lua/Weapons/Marine/Railgun.lua", "lua/SiegeBalance/Railgun.lua" , "post" )



-- these are fixes to NS2's shitty code

ModLoader.SetupFileHook( "lua/Weapons/Marine/Grenade.lua", "lua/SiegeBalance/Grenade.lua" , "post" )
ModLoader.SetupFileHook( "lua/Weapons/Marine/ClipWeapon.lua", "lua/SiegeBalance/ClipWeapon.lua" , "post" )
ModLoader.SetupFileHook( "lua/NS2Utility.lua", "lua/SiegeBalance/NS2Utility.lua" , "post" )

-- Anti-canadian damage mult
ModLoader.SetupFileHook( "lua/DamageMixin.lua", "lua/SiegeBalance/DamageMixin.lua" , "post" )

-- reduce sound distance
ModLoader.SetupFileHook( "lua/SoundEffect.lua", "lua/SiegeBalance/SoundEffect.lua" , "post" )

-- contaminate detection fix
ModLoader.SetupFileHook( "lua/CommAbilities/Alien/Contamination.lua", "lua/SiegeBalance/Contamination.lua" , "post" )
ModLoader.SetupFileHook( "lua/GUIMinimap.lua", "lua/SiegeBalance/GUIMinimap.lua" , "post" )

-- disable sound occlusion for better client perf
-- putting here because hooking Client.lua doesn't work anymore
if Client then
	local function DisableSoundOcclusion()
		Client.SetSoundGeometryEnabled(false)
	end
	Event.Hook("LocalPlayerChanged", DisableSoundOcclusion)
end