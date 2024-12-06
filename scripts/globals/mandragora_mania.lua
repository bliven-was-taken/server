-----------------------------------
-- Mandragora Mania Minigame
-----------------------------------
xi = xi or {}
xi.mandragoraMania = {}

local mandragoraAssistantEvents =
{
    [xi.zone.RULUDE_GARDENS] = 10291,
}

local opponentNames =
{
    [0] = 'Green Thumb Moogle',
    [1] = 'Monsieur Kupont',
    [2] = 'Susuroon',
    [3] = 'Little Sheep',
    [4] = 'Yeestog',
    [5] = 'Atelloune',
    [6] = 'Kuyin',
    [7] = 'Kupofried',
    [8] = 'Chacharoon',
    [9] = 'Sakura',
}

local function getParameters(player)
    local lastReset = player:getCharVar('mandragoraReset')
    local savedData = player:getCharVar('mandragoraData')

    local startPattern    = bit.band(savedData, 0x7)                 -- Pattern (0..5)
    local startOpponent   = bit.band(bit.rshift(savedData, 3), 0x3)  -- 0 = Player, 1 = NPC, 2 = Random
    local amtJingly       = bit.band(bit.rshift(savedData, 5), 0x3F) -- 15 bit max
    local purchasedPrizes = bit.rshift(savedData, 27)                -- Purchased Prizes (MSB is Copper Voucher, LSB is Silver AMAN Voucher)

    print("GET: Opponent: " .. startOpponent)

    return startPattern, startOpponent, amtJingly, purchasedPrizes, lastReset
end

local function setParameters(player, startPattern, startOpponent, amtJingly, purchasedPrizes)
    print("Setting Opponent: " .. startOpponent)
    local packedData = bit.lshift(purchasedPrizes, 27) + bit.lshift(amtJingly, 5) + bit.lshift(startOpponent, 3) + startPattern

    player:setCharVar('mandragoraData', packedData)
end

xi.mandragoraMania.onTrigger = function(player, npc)
    local startPattern, startOpponent, amtJingly, purchasedPrizes, lastReset = getParameters(player)

    local resetRemaining = (os.time() - lastReset) / (60 * 60 * 24)
    local resetAvailable = resetRemaining < 45 and 1 or 0

    -- Param0
    -- 0b 0000 0000 0000 0000 0000 0000 0000 0000
    --                                        xxx -> Start Area (0..5)
    --                                     x x    -> Start Opponent
    --                              xxx xxx       -> Days Remaining to Reset (Subtracted from 45, set to 45 to get list)
    --    xxxx x                                  -> Purchased Prizes (MSB is Copper Voucher, LSB is Silver AMAN Voucher)

    local param0 = bit.lshift(purchasedPrizes, 27) + bit.lshift(resetRemaining, 5) + bit.lshift(startOpponent, 3) + startPattern
    local param1 = bit.lshift(amtJingly, 2) + resetAvailable -- TODO: Capture had 203 value (Bit0: Reset Available == 0)

    player:startEvent(mandragoraAssistantEvents[player:getZoneID()], param0, param1, 0, 0, 0, player:getGil(), 0, 0)
end

xi.mandragoraMania.onEventUpdate = function(player, csid, option, npc)
    print('Update: ' .. option)

    local menuOption = bit.band(option, 0xF)
    local startPattern, startOpponent, amtJingly, purchasedPrizes, lastReset = getParameters(player)

    if menuOption == 7 then
        -- Select Start Pattern (1..5 == A..E)
        print("Firing 7")
        startPattern = bit.rshift(option, 20)
        setParameters(player, startPattern, startOpponent, amtJingly, purchasedPrizes)
        player:updateEvent(player:getCharVar('mandragoraData'), 0, 0, 0, 0, player:getGil(), 0, 0)

    elseif menuOption == 8 then
        -- Select Starting Player (1 = You, 2 = Opponent, ?? = Random)
        print("Firing 8")
        startOpponent = bit.rshift(option, 23)
        print("Selection: " .. startOpponent)
        setParameters(player, startPattern, startOpponent, amtJingly, purchasedPrizes)
        player:updateEvent(player:getCharVar('mandragoraData'), 0, 0, 0, 0, player:getGil(), 0, 0)

    elseif menuOption == 9 then
        player:updateEvent(player:getCharVar('mandragoraData'), 0, 0, 0, 0, player:getGil(), 0, 0)
    end
end

xi.mandragoraMania.onEventFinish = function(player, csid, option, npc)
    print('Finish: ' .. option)

    if option == utils.EVENT_CANCELLED_OPTION then
        return
    end

    if csid == 10291 then
        local finishType = bit.band(option, 0xF)

        if finishType == 2 then
            local selectedOpponent = bit.rshift(option, 10)
            local selectedPattern  = 4 -- NOTE: 0-indexed here
            local startingPlayer   = 0 -- 0 = Player, 1 = NPC

            print('Opponent: ' .. opponentNames[selectedOpponent])
            print('Pattern : ' .. string.char(65 + selectedPattern))
            printf('Start   : %s', startingPlayer == 0 and 'Player' or 'Opponent')

            local gameParam = bit.lshift(selectedOpponent, 13) + bit.lshift(startingPlayer, 17) + bit.lshift(selectedPattern, 19)

            player:startEvent(mandragoraAssistantEvents[player:getZoneID()] + 2, 0, 0, 0, gameParam)
        end
    end
end
