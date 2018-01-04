
if Server then
  
    local oldOnUpdate = Cyst.OnUpdate
    function Cyst:OnUpdate(deltaTime)
        
        oldOnUpdate(self, deltaTime)
        if self.madeInitialConnectAttempt and not self:GetIsActuallyConnected() and not self:GetIsCatalysted() and not self:GetIsBuilt() then
            
            self:DeductHealth(kCystUnconnectedDamage * deltaTime)
        end
    end
end