if Server then

    local kGrenadeCameraShakeDistance = 15
    local kGrenadeMinShakeIntensity = 0.02
    local kGrenadeMaxShakeIntensity = 0.13
    
    function Grenade:Detonate(targetHit)
    
        -- Do damage to nearby targets.
        local hitEntities = GetEntitiesWithMixinWithinRange("Live", self:GetOrigin(), kGrenadeLauncherGrenadeDamageRadius)
        
        -- Remove grenade and add firing player.
        table.removevalue(hitEntities, self)
        
        -- full damage on direct impact
        if targetHit then
            table.removevalue(hitEntities, targetHit)
            self:DoDamage(kGrenadeLauncherGrenadeDamage, targetHit, self:GetOrigin(), GetNormalizedVector(targetHit:GetOrigin() - self:GetOrigin()), "none")
        end

        RadiusDamage(hitEntities, self:GetOrigin(), kGrenadeLauncherGrenadeDamageRadius, kGrenadeLauncherGrenadeDamage, self)
        
        -- TODO: use what is defined in the material file
        local surface = GetSurfaceFromEntity(targetHit)
        
        local params = { surface = surface }
        params[kEffectHostCoords] = Coords.GetLookIn( self:GetOrigin(), self:GetCoords().zAxis)
        
        self:TriggerEffects("grenade_explode", params)
        
        CreateExplosionDecals(self)
        TriggerCameraShake(self, kGrenadeMinShakeIntensity, kGrenadeMaxShakeIntensity, kGrenadeCameraShakeDistance)
        
        DestroyEntity(self)
        
    end
end