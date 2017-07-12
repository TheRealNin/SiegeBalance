kNewThrusterDuration = 2.25

function Exo:GetFuel()
    if self.thrustersActive then
        return Clamp(self.fuelAtChange - (Shared.GetTime() - self.timeFuelChanged) / kNewThrusterDuration, 0, 1)
    else
        return Clamp(self.fuelAtChange + (Shared.GetTime() - self.timeFuelChanged) / kThrustersCooldownTime, 0, 1)
    end
end
