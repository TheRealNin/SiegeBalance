

local oldModifyDamageTaken = Onos.ModifyDamageTaken
function Onos:ModifyDamageTaken(damageTable, attacker, doer, damageType, hitPoint)
    oldModifyDamageTaken(self, damageTable, attacker, doer, damageType, hitPoint)
    
    if self:GetIsCharging() then

          damageTable.damage = damageTable.damage * kOnosChargeDamageReduction
          
          if doer:GetClassName() ~= "railgun" then
            --TODO Exclude local player and trigger local-player only effect
            self:TriggerEffects("boneshield_blocked", { effecthostcoords = Coords.GetTranslation(hitPoint) } )
          end
        
    end

end