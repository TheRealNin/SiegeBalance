

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
    "Claw",
    "Railgun",
    "GrenadeLauncher"
}


local function GetHitsBoneShield(self, doer, hitPoint)

    if table.contains(kBlockDoers, doer:GetClassName()) then
    
        local viewDirection = GetNormalizedVectorXZ( self:GetViewCoords().zAxis )
        local zPosition = viewDirection:DotProduct( GetNormalizedVector( hitPoint - self:GetOrigin() ) )
        return zPosition >= 0.27 --approx 165 degree cone of Onos facing. Was 0.34 (~140 deg)
    
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

