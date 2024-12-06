-----------------------------------
-- Mandragora Mania Minigame
-----------------------------------
xi = xi or {}
xi.mandragoraMania = {}

local mandragoraAssistantInfo =
{

}

xi.mandragoraMania.onTrigger = function(player, npc)
    local amtJingly = 50

    -- Param0
    -- 0b 0000 0000 0000 0000 0000 0000 0000 0000
    --                                        xxx -> Start Area (0..5)
    --                                     x x    -> Start Opponent
    --                              xxx xxx       -> Days Remaining to Reset (Subtracted from 45, set to 45 to get list)
    --    xxxx x                                  -> Purchased Prizes (MSB is Copper Voucher, LSB is Silver AMAN Voucher)

    local param0 = 0xC0000DA0 -- This contains current settings, prize availability at minimum
    local param1 = bit.lshift(amtJingly, 2) -- TODO: Capture had 203 value (Bit0: Reset Available == 0)
    local param2 = 0
    local param3 = 0
    local param4 = 0
    local param5 = player:getGil()
    local param6 = 0
    local param7 = 0

    player:startEvent(10291, param0, param1, param2, param3, param4, param5, param6, param7)
end

xi.mandragoraMania.onEventUpdate = function(player, csid, option, npc)
    print("Update: " .. option)
    local menuOption = bit.band(option, 0xF)

    if option == 7 then
        -- Select Start Pattern (1..5 == A..E)
        local selection = bit.rshift(option, 20)

    elseif option == 8 then
        -- Select Starting Player (1 = You, 2 = Opponent, ?? = Random)
        local selection = bit.rshift(option, 23)

    elseif option == 9 then
        player:updateEvent(0xC00005A0, 0, 0, 0, 0, player:getGil(), 0, 0)
    end
end

xi.mandragoraMania.onEventFinish = function(player, csid, option, npc)
    print("Finish: " .. option)
end
