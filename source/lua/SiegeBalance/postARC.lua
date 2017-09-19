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

local function GetTeamHasTech(teamNumber, techId)

    local techTree = GetTechTree(teamNumber)
    if techTree then
        return techTree:GetHasTech(techId, true)
    end
    
    return false

end


local kAnimationGraph = PrecacheAsset("models/marine/arc/arc.animation_graph")
local oldOnInitialized = ARC.OnInitialized -- not used, gotta replace it all

function ARC:OnInitialized()

    ScriptActor.OnInitialized(self)
    
    InitMixin(self, WeldableMixin)
    InitMixin(self, NanoShieldMixin)
    
    self:SetModel(ARC.kModelName, kAnimationGraph)
    
    if Server then
    
        local angles = self:GetAngles()
        self.desiredPitch = angles.pitch
        self.desiredRoll = angles.roll
    
        InitMixin(self, MobileTargetMixin)
        InitMixin(self, SupplyUserMixin)
        
        -- TargetSelectors require the TargetCacheMixin for cleanup.
        InitMixin(self, TargetCacheMixin)
        
        local enemyTeamNumber = GetEnemyTeamNumber(self:GetTeamNumber())
        -- Prioritize targetting non-Eggs first.
        self.targetSelector = TargetSelector():Init(
                self,
                ARC.kFireRange,
                false, 
                { kMarineStaticTargets, kMarineMobileTargets },
                { self.FilterTarget(self) },
                { function(target)  
                    if GetTeamHasTech(enemyTeamNumber, kTechId.ShadeHive) then
                        return target.GetTechId and target:GetTechId() == kTechId.ShadeHive
                    end
                    return target:isa("Hive") 
                  end })

        
        self:SetPhysicsType(PhysicsType.Kinematic)
        
        -- Cannons start out mobile
        self:SetMode(ARC.kMode.Stationary)
        
        self.undeployedArmor = kARCArmor
        self.deployedArmor = kARCDeployedArmor
        
        -- This Mixin must be inited inside this OnInitialized() function.
        if not HasMixin(self, "MapBlip") then
            InitMixin(self, MapBlipMixin)
        end
    
        self.desiredForwardTrackPitchDegrees = 0
        
        InitMixin(self, InfestationTrackerMixin)
    
    elseif Client then
    
        self.lastModeClient = self.mode
        InitMixin(self, UnitStatusMixin)
        InitMixin(self, HiveVisionMixin)
    
    end
    
    self:SetUpdates(true)
    
    InitMixin(self, IdleMixin)
    
end
