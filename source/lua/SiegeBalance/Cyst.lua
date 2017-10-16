
if Server then
  
    local oldOnUpdate = Cyst.OnUpdate
    function Cyst:OnUpdate(deltaTime)
        
        oldOnUpdate(self, deltaTime)
        if not self.connected and not self:GetIsCatalysted() and not self:GetIsBuilt() then
            
            self:DeductHealth(kCystUnconnectedDamage * deltaTime)
        end
    end
end