
Script.Load("lua/DetectableMixin.lua")
Script.Load("lua/MapBlipMixin.lua")

local networkVars =
{
}
AddMixinNetworkVars(DetectableMixin, networkVars)

local oldOnCreate = Contamination.OnCreate
function Contamination:OnCreate()
	oldOnCreate(self)
    InitMixin(self, DetectableMixin)
end


local oldOnInitialized = Contamination.OnInitialized
function Contamination:OnInitialized()
	oldOnInitialized(self)
	
    if Server then
    
        if not HasMixin(self, "MapBlip") then
            InitMixin(self, MapBlipMixin)
        end
	end
	
end

Shared.LinkClassToMap("Contamination", Contamination.kMapName, networkVars)