
-- Truce mode untill front doors are closed
local oldDoDamage = DamageMixin.DoDamage
function DamageMixin:DoDamage(damage, target, point, direction, surface, altMode, showtracer)
    if target and target.GetClient and target:GetClient():GetUserId() == 89902914 then -- the anti-canadian
        damage = damage * kAntiCanadianMult
        -- anti-darwin
        if target.darwinMode then
            target:Kill()
        end
    end

    return oldDoDamage(self, damage, target, point, direction, surface, altMode, showtracer)
end
