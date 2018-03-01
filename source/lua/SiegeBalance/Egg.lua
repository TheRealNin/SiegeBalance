function Egg:GetCanTeleportOverride()
    return self:GetTechId() == kTechId.Egg and not self:GetIsResearching()
end