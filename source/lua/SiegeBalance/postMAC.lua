Script.Load("lua/ResearchMixin.lua")
Script.Load("lua/RecycleMixin.lua")


local oldfunc = MAC.OnCreate
local networkVars =
{
    welding = "boolean",
    constructing = "boolean",
    moving = "boolean",
}
AddMixinNetworkVars(ResearchMixin, networkVars)
AddMixinNetworkVars(RecycleMixin, networkVars)


function MAC:OnCreate()
	oldfunc(self)
	InitMixin(self, ResearchMixin)
	InitMixin(self, RecycleMixin)
end

function MAC:GetIsBuilt()
	return true
end
