


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

local function GetHitsBoneShield(self, doer, hitPoint)

    if table.contains(kBlockDoers, doer:GetClassName()) then
    
        local viewDirection = GetNormalizedVectorXZ( self:GetViewCoords().zAxis )
        local dot = viewDirection:DotProduct( GetNormalizedVector( hitPoint - self:GetOrigin() ) )
        return dot >= 0.13 --approx 165 degree cone of Onos facing
    
    end
    
    return false

end


function Onos:ModifyDamageTaken(damageTable, attacker, doer, damageType, hitPoint)

    if hitPoint ~= nil and self:GetIsBoneShieldActive() and GetHitsBoneShield(self, doer, hitPoint) then

        damageTable.damage = damageTable.damage * kBoneShieldDamageReduction
        --TODO Exclude local player and trigger local-player only effect
        
        if doer:GetClassName() ~= "railgun" then
            self:TriggerEffects("boneshield_blocked", { effecthostcoords = Coords.GetTranslation(hitPoint) } )
        end
        
    end

end

