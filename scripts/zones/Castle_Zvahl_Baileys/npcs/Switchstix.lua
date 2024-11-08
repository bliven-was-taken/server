-----------------------------------
-- Area: Castle Zvahl Baileys
--  NPC: Switchstix
-- !pos 386.091 -13 -17.399 161
-----------------------------------
local ID = zones[xi.zone.CASTLE_ZVAHL_BAILEYS]
-----------------------------------
---@type TNpcEntity
local entity = {}

local requiredItems = 1
local currencyType = 2
local currencyAmount = 3
local stageNumber = 4
local csParam = 5

local relics =
{
    -- Spharai
    [xi.item.RELIC_KNUCKLES] = { { 1460, 1459, 665 }, xi.item.ONE_HUNDRED_BYNE_BILL, 4, 1, 1 },
    [xi.item.MILITANT_KNUCKLES] = { { 16390, 16392, 16396 }, xi.item.MONTIONT_SILVERPIECE, 14, 2, 2 },
    [xi.item.DYNAMIS_KNUCKLES] = { { 1556 }, xi.item.LUNGO_NANGO_JADESHELL, 61, 3, 3 },
    [xi.item.CAESTUS] = { { 1571, 1589 }, xi.item.TEN_THOUSAND_BYNE_BILL, 1, 4, 3 },

    -- Mandau
    [xi.item.RELIC_DAGGER] = { { 4246, 747, 4166 }, xi.item.ONE_HUNDRED_BYNE_BILL, 4, 1, 1 },
    [xi.item.MALEFIC_DAGGER] = { { 16449, 16496, 16452 }, xi.item.MONTIONT_SILVERPIECE, 14, 2, 2 },
    [xi.item.DYNAMIS_DAGGER] = { { 1557 }, xi.item.LUNGO_NANGO_JADESHELL, 61, 3, 3 },
    [xi.item.BATARDEAU] = { { 1572, 1589 }, xi.item.TEN_THOUSAND_BYNE_BILL, 1, 4, 3 },

    -- Excalibur
    [xi.item.RELIC_SWORD] = { { 1460, 763, 931 }, xi.item.MONTIONT_SILVERPIECE, 4, 1, 1 },
    [xi.item.GLYPTIC_SWORD] = { { 16535, 16537, 16542 }, xi.item.ONE_HUNDRED_BYNE_BILL, 14, 2, 2 },
    [xi.item.DYNAMIS_SWORD] = { { 1558 }, xi.item.LUNGO_NANGO_JADESHELL, 61, 3, 3 },
    [xi.item.CALIBURN] = { { 1573, 1589 }, xi.item.RANPERRE_GOLDPIECE, 1, 4, 3 },

    -- Ragnarok
    [xi.item.RELIC_BLADE] = { { 1459, 655, 746 }, xi.item.MONTIONT_SILVERPIECE, 4, 1, 1 },
    [xi.item.GILDED_BLADE] = { { 16583, 16584, 16585 }, xi.item.LUNGO_NANGO_JADESHELL, 14, 2, 2 },
    [xi.item.DYNAMIS_BLADE] = { { 1559 }, xi.item.ONE_HUNDRED_BYNE_BILL, 61, 3, 3 },
    [xi.item.VALHALLA] = { { 1574, 1589 }, xi.item.RANPERRE_GOLDPIECE, 1, 4, 3 },

    -- Guttler
    [xi.item.RELIC_AXE] = { { 1312, 1463, 13060 }, xi.item.LUNGO_NANGO_JADESHELL, 3, 1, 1 },
    [xi.item.LEONINE_AXE] = { { 16657, 16658, 16659 }, xi.item.MONTIONT_SILVERPIECE, 14, 2, 2 },
    [xi.item.DYNAMIS_AXE] = { { 1560 }, xi.item.ONE_HUNDRED_BYNE_BILL, 60, 3, 3 },
    [xi.item.OGRE_KILLER] = { { 1575, 1589 }, xi.item.RIMILALA_STRIPESHELL, 1, 4, 3 },

    -- Bravura
    [xi.item.RELIC_BHUJ] = { { 1461, 658, 720 }, xi.item.ONE_HUNDRED_BYNE_BILL, 3, 1, 1 },
    [xi.item.AGONAL_BHUJ] = { { 16704, 16705, 16724 }, xi.item.LUNGO_NANGO_JADESHELL, 16, 2, 2 },
    [xi.item.DYNAMIS_BHUJ] = { { 1561 }, xi.item.MONTIONT_SILVERPIECE, 60, 3, 3 },
    [xi.item.ABADDON_KILLER] = { { 1576, 1589 }, xi.item.TEN_THOUSAND_BYNE_BILL, 1, 4, 3 },

    -- Gungnir
    [xi.item.RELIC_LANCE] = { { 1462, 747, 1294 }, xi.item.LUNGO_NANGO_JADESHELL, 4, 1, 1 },
    [xi.item.HOTSPUR_LANCE] = { { 16834, 16836, 16841 }, xi.item.ONE_HUNDRED_BYNE_BILL, 16, 2, 2 },
    [xi.item.DYNAMIS_LANCE] = { { 1563 }, xi.item.MONTIONT_SILVERPIECE, 61, 3, 3 },
    [xi.item.GAE_ASSAIL] = { { 1578, 1589 }, xi.item.RIMILALA_STRIPESHELL, 1, 4, 3 },

    -- Apocalypse
    [xi.item.RELIC_SCYTHE] = { { 1458, 1117, 13208 }, xi.item.LUNGO_NANGO_JADESHELL, 5, 1, 1 },
    [xi.item.MEMENTO_SCYTHE] = { { 16774, 16794, 16777 }, xi.item.MONTIONT_SILVERPIECE, 16, 2, 2 },
    [xi.item.DYNAMIS_SCYTHE] = { { 1562 }, xi.item.ONE_HUNDRED_BYNE_BILL, 62, 3, 3 },
    [xi.item.BEC_DE_FAUCON] = { { 1577, 1589 }, xi.item.RIMILALA_STRIPESHELL, 1, 4, 3 },

    -- Kikoku
    [xi.item.IHINTANTO] = { { 1467, 1276, 1278 }, xi.item.ONE_HUNDRED_BYNE_BILL, 4, 1, 1 },
    [xi.item.MIMIZUKU] = { { 16900, 16903, 16902 }, xi.item.LUNGO_NANGO_JADESHELL, 16, 2, 2 },
    [xi.item.ROGETSU] = { { 1564 }, xi.item.MONTIONT_SILVERPIECE, 61, 3, 3 },
    [xi.item.YOSHIMITSU] = { { 1579, 1589 }, xi.item.TEN_THOUSAND_BYNE_BILL, 1, 4, 3 },

    -- Amanomurakumo
    [xi.item.ITO] = { { 1467, 1409, 657 }, xi.item.MONTIONT_SILVERPIECE, 3, 1, 1 },
    [xi.item.HAYATEMARU] = { { 16966, 16967, 16972 }, xi.item.LUNGO_NANGO_JADESHELL, 15, 2, 2 },
    [xi.item.OBOROMARU] = { { 1565 }, xi.item.ONE_HUNDRED_BYNE_BILL, 60, 3, 3 },
    [xi.item.TOTSUKANOTSURUGI] = { { 1580, 1589 }, xi.item.RANPERRE_GOLDPIECE, 1, 4, 3 },

    -- Mjollnir
    [xi.item.RELIC_MAUL] = { { 1461, 746, 830 }, xi.item.MONTIONT_SILVERPIECE, 5, 1, 1 },
    [xi.item.BATTERING_MAUL] = { { 17044, 17080, 17043 }, xi.item.ONE_HUNDRED_BYNE_BILL, 16, 2, 2 },
    [xi.item.DYNAMIS_MAUL] = { { 1566 }, xi.item.LUNGO_NANGO_JADESHELL, 62, 3, 3 },
    [xi.item.GULLINTANI] = { { 1581, 1589 }, xi.item.RANPERRE_GOLDPIECE, 1, 4, 3 },

    -- Claustrum
    [xi.item.RELIC_STAFF] = { { 1462, 1271, 1415 }, xi.item.LUNGO_NANGO_JADESHELL, 5, 1, 1 },
    [xi.item.SAGES_STAFF] = { { 17088, 17090, 17092 }, xi.item.ONE_HUNDRED_BYNE_BILL, 16, 2, 2 },
    [xi.item.DYNAMIS_STAFF] = { { 1567 }, xi.item.MONTIONT_SILVERPIECE, 62, 3, 3 },
    [xi.item.THYRUS] = { { 1582, 1589 }, xi.item.RIMILALA_STRIPESHELL, 1, 4, 3 },

    -- Annihilator
    [xi.item.RELIC_GUN] = { { 1468, 830, 654 }, xi.item.ONE_HUNDRED_BYNE_BILL, 5, 1, 1 },
    [xi.item.MARKSMAN_GUN] = { { 17248, 17251, 17259 }, xi.item.LUNGO_NANGO_JADESHELL, 15, 2, 2 },
    [xi.item.DYNAMIS_GUN] = { { 1570 }, xi.item.MONTIONT_SILVERPIECE, 62, 3, 3 },
    [xi.item.FERDINAND] = { { 1585, 1589 }, xi.item.TEN_THOUSAND_BYNE_BILL, 1, 4, 3 },

    -- Gjallarhorn
    [xi.item.RELIC_HORN] = { { 1458, 1463, 13232 }, xi.item.LUNGO_NANGO_JADESHELL, 3, 1, 1 },
    [xi.item.PYRRHIC_HORN] = { { 17352, 17351, 17362 }, xi.item.ONE_HUNDRED_BYNE_BILL, 14, 2, 2 },
    [xi.item.DYNAMIS_HORN] = { { 1569 }, xi.item.MONTIONT_SILVERPIECE, 60, 3, 3 },
    [xi.item.MILLENNIUM_HORN] = { { 1584, 1589 }, xi.item.RIMILALA_STRIPESHELL, 1, 4, 3 },

    -- Yoichinoyumi
    [xi.item.RELIC_BOW] = { { 883, 1462, 932 }, xi.item.MONTIONT_SILVERPIECE, 4, 1, 1 },
    [xi.item.WOLVER_BOW] = { { 17161, 17164, 18142 }, xi.item.MONTIONT_SILVERPIECE, 15, 2, 2 },
    [xi.item.DYNAMIS_BOW] = { { 1568 }, xi.item.LUNGO_NANGO_JADESHELL, 61, 3, 3 },
    [xi.item.FUTATOKOROTO] = { { 1583, 1589 }, xi.item.RANPERRE_GOLDPIECE, 1, 4, 3 },

    -- Aegis
    [xi.item.RELIC_SHIELD] = { { 875, 668, 720 }, 0, 1, 1, 4 },
    [xi.item.BULWARK_SHIELD] = { { 12301, 12295, 12387 }, 0, 4, 2, 5 },
    [xi.item.DYNAMIS_SHIELD] = { { 1821 }, 0, 20, 3, 6 },
    [xi.item.ANCILE] = { { 1822, 1589 }, xi.item.RANPERRE_GOLDPIECE, 1, 4, 6 },
}

local function hasRelic(player, isTrade)
    if isTrade then
        for key, value in pairs(relics) do
            if player:hasItemQty(key, 1) then
                return key
            end
        end

        return nil
    else
        for key, value in pairs(relics) do
            if player:hasItem(key, xi.inv.INVENTORY) then
                return key
            end
        end

        return nil
    end
end

local function tradeHasRequiredCurrency(trade, currentRelic)
    local relic = relics[currentRelic]

    if currentRelic == 15066 or currentRelic == 15067 or currentRelic == 15068 then
        if currentRelic == 15066 and trade:getItemCount() == 3 then
            return trade:hasItemQty(xi.item.ONE_HUNDRED_BYNE_BILL, 1) and trade:hasItemQty(xi.item.MONTIONT_SILVERPIECE, 1) and trade:hasItemQty(xi.item.LUNGO_NANGO_JADESHELL, 1)
        elseif currentRelic == 15067 and trade:getItemCount() == 12 then
            return trade:hasItemQty(xi.item.ONE_HUNDRED_BYNE_BILL, 4) and trade:hasItemQty(xi.item.MONTIONT_SILVERPIECE, 4) and trade:hasItemQty(xi.item.LUNGO_NANGO_JADESHELL, 4)
        elseif currentRelic == 15068 and trade:getItemCount() == 60 then
            return trade:hasItemQty(xi.item.ONE_HUNDRED_BYNE_BILL, 20) and trade:hasItemQty(xi.item.MONTIONT_SILVERPIECE, 20) and trade:hasItemQty(xi.item.LUNGO_NANGO_JADESHELL, 20)
        else
            return false
        end
    else
        if trade:getItemCount() ~= relic[currencyAmount] then
            return false
        else
            return trade:hasItemQty(relic[currencyType], relic[currencyAmount])
        end
    end
end

local function tradeHasRequiredMaterials(trade, relicId, reqItems)
    if trade:getItemCount() ~= (#reqItems + 1) then
        return false
    else
        if not trade:hasItemQty(relicId, 1) then
            return false
        end

        for i = 1, #reqItems, 1 do
            if not trade:hasItemQty(reqItems[i], 1) then
                return false
            end
        end

        return true
    end
end

entity.onTrade = function(player, npc, trade)
    local relicId = hasRelic(trade, true)
    local currentRelic = player:getCharVar('RELIC_IN_PROGRESS')
    local gil = trade:getGil()

    if gil ~= 0 then
        return
    elseif relicId ~= nil then
        local relic = relics[relicId]
        local relicDupe = player:getCharVar('RELIC_MAKE_ANOTHER')

        if player:hasItem(relicId + 1) and relicDupe ~= 1 then
            player:startEvent(20, relicId)
        elseif currentRelic == 0 then
            if
                relic[stageNumber] ~= 4 and
                tradeHasRequiredMaterials(trade, relicId, relic[requiredItems])
            then
                local requiredItem1 = relic[requiredItems][1] ~= nil and relic[requiredItems][1] or 0
                local requiredItem2 = relic[requiredItems][2] ~= nil and relic[requiredItems][2] or 0
                local requiredItem3 = relic[requiredItems][3] ~= nil and relic[requiredItems][3] or 0
                player:setCharVar('RELIC_IN_PROGRESS', relicId)
                player:tradeComplete()
                player:startEvent(11, relicId, requiredItem1, requiredItem2, requiredItem3, relic[currencyType], relic[currencyAmount], 0, relic[csParam])
            end
        elseif currentRelic ~= 0 and relicId ~= currentRelic then
            player:startEvent(87)
        end
    elseif currentRelic ~= 0 then
        local relic = relics[currentRelic]
        local currentStage = relic[stageNumber]

        if currentStage ~= 4 and tradeHasRequiredCurrency(trade, currentRelic) then
            if currentStage == 1 then
                player:setCharVar('RELIC_DUE_AT', getVanaMidnight())
            elseif currentStage == 2 then
                player:setCharVar('RELIC_DUE_AT', os.time() + xi.settings.main.RELIC_2ND_UPGRADE_WAIT_TIME)
            elseif currentStage == 3 then
                player:setCharVar('RELIC_DUE_AT', os.time() + xi.settings.main.RELIC_3RD_UPGRADE_WAIT_TIME)
            end

            player:tradeComplete()
            player:startEvent(13, currentRelic, relic[currencyType], relic[currencyAmount], 0, 0, 0, 0, relic[csParam])
        end
    end
end

entity.onTrigger = function(player, npc)
    local relicId = hasRelic(player, false)
    local currentRelic = player:getCharVar('RELIC_IN_PROGRESS')
    local relicWait = player:getCharVar('RELIC_DUE_AT')
    local relicConquest = player:getCharVar('RELIC_CONQUEST_WAIT')

    if
        currentRelic ~= 0 and
        relicWait ~= 0 and
        relics[currentRelic][stageNumber] ~= 4
    then
        local relic = relics[currentRelic]
        local currentStage = relic[stageNumber]

        if relicWait > os.time() then
            -- Not enough time has passed
            if currentStage == 1 then
                player:startEvent(15, 0, 0, 0, 0, 0, 0, 0, relic[csParam])
            elseif currentStage == 2 then
                player:startEvent(18, 0, 0, 0, 0, 0, 0, 0, relic[csParam])
            elseif currentStage == 3 then
                player:startEvent(51, 0, 0, 0, 0, 0, 0, 0, relic[csParam])
            end
        elseif relicWait <= os.time() then
            -- Enough time has passed
            if currentStage == 1 then
                player:startEvent(16, currentRelic, 0, 0, 0, 0, 0, 0, relic[csParam])
            elseif currentStage == 2 then
                player:startEvent(19, currentRelic, 0, 0, 0, 0, 0, 0, relic[csParam])
            elseif currentStage == 3 then
                player:startEvent(52, currentRelic, 0, 0, 0, 0, 0, 0, relic[csParam])
            end
        end
    elseif
        currentRelic ~= 0 and
        relicWait == 0 and
        relics[currentRelic][stageNumber] ~= 4
    then
        -- Need currency to start timer
        local relic = relics[currentRelic]
        player:startEvent(12, currentRelic, relic[currencyType], relic[currencyAmount], 0, 0, 0, 0, relic[csParam])
    elseif relicId == nil or relicConquest > os.time() then
        -- Player doesn't have a relevant item and hasn't started one
        player:startEvent(10)
    elseif relicId ~= nil and relicConquest <= os.time() then
        -- Player has a relevant item and conquest tally has passed
        local relic = relics[relicId]
        local currentStage = relic[stageNumber]
        local requiredItem1 = relic[requiredItems][1] ~= nil and relic[requiredItems][1] or 0
        local requiredItem2 = relic[requiredItems][2] ~= nil and relic[requiredItems][2] or 0
        local requiredItem3 = relic[requiredItems][3] ~= nil and relic[requiredItems][3] or 0

        if currentStage == 1 then
            player:startEvent(14, relicId, requiredItem1, requiredItem2, requiredItem3, 0, 0, 0, relic[csParam])
        elseif currentStage == 2 then
            player:startEvent(17, relicId, requiredItem1, requiredItem2, requiredItem3, 0, 0, 0, relic[csParam])
        elseif currentStage == 3 then
            player:startEvent(50, relicId, requiredItem1, requiredItem2, requiredItem3, 0, 0, 0, relic[csParam])
        elseif currentStage == 4 then
            -- TODO: Use xi.items enum in key for the below table
            local itemToEventId =
            {
                [18263] = 68, -- Spharai
                [18269] = 69, -- Mandau
                [18275] = 70, -- Excalibur
                [18281] = 71, -- Ragnarok
                [18287] = 72, -- Guttler
                [18293] = 73, -- Bravura
                [18299] = 75, -- Gungnir
                [18305] = 74, -- Apocalypse
                [18311] = 76, -- Kikoku
                [18317] = 77, -- Amanomurakumo
                [18323] = 78, -- Mjollnir
                [18329] = 79, -- Claustrum
                [18335] = 81, -- Annihilator
                [18341] = 82, -- Gjallarhorn
                [18347] = 80, -- Yoichinoyumi
                [15069] = 86, -- Aegis
            }

            player:startEvent(itemToEventId[relicId], requiredItem1, requiredItem2, relic[currencyType], relic[currencyAmount], relicId)
        end
    else
        player:startEvent(10)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
    -- Handles the displayed currency types and amounts for Aegis Stage 1->2, 2->3, and 3->4 based on option.
    if (csid == 11 or csid == 12 or csid == 13) and option ~= 0 then
        if option == 1 then
            player:updateEvent(15066, 1453, 1, 1456, 1, 1450, 1)
        elseif option == 2 then
            player:updateEvent(15067, 1453, 4, 1456, 4, 1450, 4)
        elseif option == 3 then
            player:updateEvent(15068, 1453, 20, 1456, 20, 1450, 20)
        end
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    local reward = player:getCharVar('RELIC_IN_PROGRESS')

    -- User is cancelling a relic.  Null everything out, it never happened.
    if csid == 87 and option == 666 then
        player:setCharVar('RELIC_IN_PROGRESS', 0)
        player:setCharVar('RELIC_DUE_AT', 0)
        player:setCharVar('RELIC_MAKE_ANOTHER', 0)
        player:setCharVar('RELIC_CONQUEST_WAIT', 0)

        -- User is okay with making a relic they cannot possibly accept
    elseif csid == 20 and option == 1 then
        player:setCharVar('RELIC_MAKE_ANOTHER', 1)

        -- Picking up a finished relic stage 1>2 and 2>3.
    elseif (csid == 16 or csid == 19) and reward ~= 0 then
        if player:getFreeSlotsCount() < 1 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, reward + 1)
        else
            player:addItem(reward + 1)
            player:messageSpecial(ID.text.ITEM_OBTAINED, reward + 1)
            player:setCharVar('RELIC_IN_PROGRESS', 0)
            player:setCharVar('RELIC_DUE_AT', 0)
            player:setCharVar('RELIC_MAKE_ANOTHER', 0)
            player:setCharVar('RELIC_CONQUEST_WAIT', NextConquestTally())
        end

        -- Picking up a finished relic stage 3>4.
    elseif csid == 52 and reward ~= 0 then
        if player:getFreeSlotsCount() < 1 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, reward + 1)
        else
            player:addItem(reward + 1)
            player:messageSpecial(ID.text.ITEM_OBTAINED, reward + 1)
            player:setCharVar('RELIC_IN_PROGRESS', 0)
            player:setCharVar('RELIC_DUE_AT', 0)
            player:setCharVar('RELIC_MAKE_ANOTHER', 0)
            player:setCharVar('RELIC_CONQUEST_WAIT', 0)
        end

        -- Stage 4 cutscenes
    elseif (csid >= 68 and csid <= 82) or csid == 86 then
        -- TODO: Use xi.items enum below
        local eventToItemId =
        {
                [68] = 18263, -- Spharai
                [69] = 18269, -- Mandau
                [70] = 18275, -- Excalibur
                [71] = 18281, -- Ragnarok
                [72] = 18287, -- Guttler
                [73] = 18293, -- Bravura
                [75] = 18299, -- Gungnir
                [74] = 18305, -- Apocalypse
                [76] = 18311, -- Kikoku
                [77] = 18317, -- Amanomurakumo
                [78] = 18323, -- Mjollnir
                [79] = 18329, -- Claustrum
                [81] = 18335, -- Annihilator
                [82] = 18341, -- Gjallarhorn
                [80] = 18347, -- Yoichinoyumi
                [86] = 15069, -- Aegis
        }

        player:setCharVar('RELIC_CONQUEST_WAIT', 0)
        player:setCharVar('RELIC_IN_PROGRESS', eventToItemId[csid])
    end
end

return entity
