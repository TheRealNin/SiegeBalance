
-- only make move orders when under 50 meters
function Shift:OnOrderGiven(order)
    if order:GetType()  == kTechId.Move and GetPathDistance(order:GetLocation(),self:GetOrigin()) > 50 then
        self:ClearOrders() 
    end
end