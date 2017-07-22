

local kBlockDoers =
{
    "Minigun",
    "Pistol",
    "Rifle",
    "HeavyRifle",
    "HeavyMachineGun",
    "Shotgun",
    "Axe",
    "Welder",
    "Sentry",
    "Grenade",
    "PulseGrenade",
    "ClusterFragment",
    "Mine",
    "Claw"
}


local function GetHitsChargeEffect(self, doer, hitPoint)

    return table.contains(kBlockDoers, doer:GetClassName())
end

local oldModifyDamageTaken = Onos.ModifyDamageTaken
function Onos:ModifyDamageTaken(damageTable, attacker, doer, damageType, hitPoint)
    oldModifyDamageTaken(self, damageTable, attacker, doer, damageType, hitPoint)
    
    if self:GetIsCharging() then

          damageTable.damage = damageTable.damage * kOnosChargeDamageReduction
          
          --if GetHitsChargeEffect(self, doer, hitPoint) then
          
            --self:TriggerEffects("boneshield_blocked", { effecthostcoords = Coords.GetTranslation(hitPoint) } )
          --end
        
    end

end