
function HelpScreen:GetShouldDisplay()
    
    PROFILE("HelpScreen:GetShouldDisplay")
    
    if not self.visible then
        return false
    end
    
    if not self.tiles or #self.tiles == 0 then
        return false
    end
    
    local key = BindingsUI_GetInputValue("HelpScreen")
    if key == "None" or key == "" then
        return false
    end
    
    if MainMenu_GetIsOpened() then
        return false
    end
    --[[
    local player = Client.GetLocalPlayer()
    if not player or player:isa("Commander") then
        return false
    end
    
    if player:GetTeamType() == kNeutralTeamType then
        return false
    end
    
    if player.GetIsAlive and not player:GetIsAlive() then
        return false
    end
    
    if GetGameInfoEntity():GetGameEnded() then
        return false
    end
    
    if GetGameInfoEntity():GetState() == kGameState.Countdown then
        return false
    end
    ]]--
    
    -- global variable set to true while playing tutorials, or anywhere else the help
    -- screen is not desired.
    if gDisableHelpScreen then
        return false
    end
    
    return true
    
end

local oldHide = HelpScreen.Hide
function HelpScreen:Hide()

    
    oldHide(self)
    
    local player = Client.GetLocalPlayer()
    if player:isa("Commander") then
        MouseTracker_SetIsVisible(true, nil, true)
    end
end

local oldUninitialize = HelpScreen.Uninitialize
function HelpScreen:Uninitialize()

    oldUninitialize(self)
    
    local player = Client.GetLocalPlayer()
    if player:isa("Commander") then
      MouseTracker_SetIsVisible(false)
    end
    
end