local oldGetRecycle = GetRecycleAmount

function GetRecycleAmount(techId, upgradeLevel)

    local amount = oldGetRecycle(techId, upgradeLevel)
    if techId == kTechId.MAC or techId == kTechId.ARC then
        amount = 0
    end

    return amount
    
end