
function Crag:UpdateHealing()

    local time = Shared.GetTime()
    local infested = self:GetGameEffectMask(kGameEffect.OnInfestation)

    if infested and (not self:GetIsOnFire() and ( self.timeOfLastHeal == nil or (time > self.timeOfLastHeal + Crag.kHealInterval) )) then
        self:PerformHealing()
    end

end

function Crag:TryHeal(target)

    local unclampedHeal
    local heal

    if (Shared.GetTime() - target.timeLastCombatAction) > 7 then  -- Increased heal out of combat

        unclampedHeal = target:GetMaxHealth() * Crag.kHealPercentage * 2
        heal = Clamp(unclampedHeal, Crag.kMinHeal * 2, Crag.kMaxHeal * 2)

    elseif (Shared.GetTime() - target.timeLastCombatAction) > 3 then

        unclampedHeal = target:GetMaxHealth() * Crag.kHealPercentage * 1.5
        heal = Clamp(unclampedHeal, Crag.kMinHeal * 1.5, Crag.kMaxHeal * 1.5)

    else

        unclampedHeal = target:GetMaxHealth() * Crag.kHealPercentage
        heal = Clamp(unclampedHeal, Crag.kMinHeal, Crag.kMaxHeal)

    end

    if self.healWaveActive then
        heal = heal * Crag.kHealWaveMultiplier
    end

    if target:GetHealthScalar() ~= 1 and (not target.timeLastCragHeal or target.timeLastCragHeal + Crag.kHealInterval <= Shared.GetTime()) then

        local amountHealed = target:AddHealth(heal)
        target.timeLastCragHeal = Shared.GetTime()
        return amountHealed

    else
        return 0
    end

end
