
local kRailgunChargeTime = 1.4 -- was 1.4

function Railgun:OnPrimaryAttack(player)
    
    local exoWeaponHolder = player:GetActiveWeapon()
    if self.timeOfLastShot + kRailgunChargeTime <= Shared.GetTime() then

        if not self.railgunAttacking then
            self.timeChargeStarted = Shared.GetTime()           
        end
        self.railgunAttacking = true
        
    end
    
end