
-- Applies damage falloff to all bullet weapons (does not include lerk spikes for some reason)
-- to modify values, please go to Balance.lua
-- TODO: calculate falloff from the actual engagement point instead of origin
--       (right now, firing upwards can do slightly less damage than downwards)
function BulletsMixin:ApplyBulletGameplayEffects(player, target, endPoint, direction, damage, surface, showTracer)
    
    if (player and endPoint) then
        local distance = (player:GetOrigin() - endPoint):GetLength()
        if distance >= kBulletDamageFalloffEnd then
            damage = damage * kBulletDamageFalloffFraction
        elseif (distance > kBulletDamageFalloffStart and distance < kBulletDamageFalloffEnd) then
            local fraction = (distance - kBulletDamageFalloffStart) / (kBulletDamageFalloffEnd - kBulletDamageFalloffStart)
            if fraction > 0 then
                damage = damage * (kBulletDamageFalloffFraction * fraction + (1 - fraction))
            end
        end
    end
    
    local blockedByUmbra = GetBlockedByUmbra(target)
    
    if blockedByUmbra then
        surface = "umbra"
    end

    -- deals damage or plays surface hit effects
    self:DoDamage(damage, target, endPoint, direction, surface, false, showTracer)
    
end