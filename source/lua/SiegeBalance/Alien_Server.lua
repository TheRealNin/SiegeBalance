
function Alien:UpdateAutoHeal()

    PROFILE("Alien:UpdateAutoHeal")

    if self:GetIsHealable() and ( not self.timeLastAlienAutoHeal or self.timeLastAlienAutoHeal + kAlienRegenerationTime <= Shared.GetTime() ) then

        local healRate = 1
        local shellLevel = GetShellLevel(self:GetTeamNumber())
        local hasRegenUpgrade = shellLevel > 0 and GetHasRegenerationUpgrade(self)
        local maxHealth = self:GetBaseHealth()

        if hasRegenUpgrade and (Shared.GetTime() - self.timeLastCombatAction) > 5 then  -- Increased heal out of combat
            healRate = Clamp(kAlienRegenerationPercentage * maxHealth, kAlienMinRegeneration, kAlienMaxRegeneration) * (shellLevel/3) * 2
        else
            healRate = Clamp(kAlienInnateRegenerationPercentage * maxHealth, kAlienMinInnateRegeneration, kAlienMaxInnateRegeneration)
        end

        self:AddHealth(healRate, false, false, not hasRegenUpgrade)
        self.timeLastAlienAutoHeal = Shared.GetTime()

    end

end
