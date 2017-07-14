Script.Load("lua/ResearchMixin.lua")
Script.Load("lua/RecycleMixin.lua")

local oldfunc = ARC.OnCreate
local networkVars =
{
    -- ARCs can only fire when deployed and can only move when not deployed
    mode = "enum ARC.kMode",
    deployMode = "enum ARC.kDeployMode",
    
    barrelYawDegrees = "compensated float",
    barrelPitchDegrees = "compensated float",
    
    -- pose parameters for forward track (should be compensated??)
    forwardTrackYawDegrees = "float",
    forwardTrackPitchDegrees = "float",
    
    -- So we can update angles and pose parameters smoothly on client
    targetDirection = "vector",
}
AddMixinNetworkVars(ResearchMixin, networkVars)
AddMixinNetworkVars(RecycleMixin, networkVars)

function ARC:OnCreate()
	oldfunc(self)
	InitMixin(self, ResearchMixin)
	InitMixin(self, RecycleMixin)
end

function ARC:GetIsBuilt()
	return true
end
