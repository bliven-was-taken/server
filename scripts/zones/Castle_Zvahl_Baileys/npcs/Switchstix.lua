-----------------------------------
-- Area: Castle Zvahl Baileys
--  NPC: Switchstix
-- !pos 386.091 -13 -17.399 161
-----------------------------------
local ID = zones[xi.zone.CASTLE_ZVAHL_BAILEYS]
-----------------------------------
---@type TNpcEntity
local entity = {}

local relics =
{
    -- Spharai
    [xi.item.RELIC_KNUCKLES] =
    {
        requiredItems =
        {
            1460,
            1459,
            665,
        },

        currencyType   = xi.item.ONE_HUNDRED_BYNE_BILL,
        currencyAmount = 4,
        stageNumber    = 1,
        csParam        = 1,
    },

    [xi.item.MILITANT_KNUCKLES] =
    {
        requiredItems =
        {
            16390,
            16392,
            16396,
        },

        currencyType   = xi.item.MONTIONT_SILVERPIECE,
        currencyAmount = 14,
        stageNumber    = 2,
        csParam        = 2,
    },

    [xi.item.DYNAMIS_KNUCKLES] =
    {
        requiredItems =
        {
            1556,
        },

        currencyType   = xi.item.LUNGO_NANGO_JADESHELL,
        currencyAmount = 61,
        stageNumber    = 3,
        csParam        = 3,
    },

    [xi.item.CAESTUS] =
    {
        requiredItems =
        {
            1571,
            1589,
        },

        currencyType   = xi.item.TEN_THOUSAND_BYNE_BILL,
        currencyAmount = 1,
        stageNumber    = 4,
        csParam        = 3,
    },

    -- Mandau
    [xi.item.RELIC_DAGGER] =
    {
        requiredItems =
        {
            4246,
            747,
            4166,
        },

        currencyType   = xi.item.ONE_HUNDRED_BYNE_BILL,
        currencyAmount = 4,
        stageNumber    = 1,
        csParam        = 1,
    },

    [xi.item.MALEFIC_DAGGER] =
    {
        requiredItems =
        {
            16449,
            16496,
            16452,
        },

        currencyType   = xi.item.MONTIONT_SILVERPIECE,
        currencyAmount = 14,
        stageNumber    = 2,
        csParam        = 2,
    },

    [xi.item.DYNAMIS_DAGGER] =
    {
        requiredItems =
        {
            1557,
        },

        currencyType   = xi.item.LUNGO_NANGO_JADESHELL,
        currencyAmount = 61,
        stageNumber    = 3,
        csParam        = 3,
    },

    [xi.item.BATARDEAU] =
    {
        requiredItems =
        {
            1572,
            1589,
        },

        currencyType   = xi.item.TEN_THOUSAND_BYNE_BILL,
        currencyAmount = 1,
        stageNumber    = 4,
        csParam        = 3,
    },

    -- Excalibur
    [xi.item.RELIC_SWORD] =
    {
        requiredItems =
        {
            1460,
            763,
            931
        },

        currencyType   = xi.item.MONTIONT_SILVERPIECE,
        currencyAmount = 4,
        stageNumber    = 1,
        csParam        = 1,
    },

    [xi.item.GLYPTIC_SWORD] =
    {
        requiredItems =
        {
            16535,
            16537,
            16542
        },

        currencyType   = xi.item.ONE_HUNDRED_BYNE_BILL,
        currencyAmount = 14,
        stageNumber    = 2,
        csParam        = 2,
    },

    [xi.item.DYNAMIS_SWORD] =
    {
        requiredItems =
        {
            1558
        },

        currencyType   = xi.item.LUNGO_NANGO_JADESHELL,
        currencyAmount = 61,
        stageNumber    = 3,
        csParam        = 3,
    },

    [xi.item.CALIBURN] =
    {
        requiredItems =
        {
            1573,
            1589
        },

        currencyType   = xi.item.RANPERRE_GOLDPIECE,
        currencyAmount = 1,
        stageNumber    = 4,
        csParam        = 3,
    },

    -- Ragnarok
    [xi.item.RELIC_BLADE] =
    {
        requiredItems =
        {
            1459,
            655,
            746
        },

        currencyType   = xi.item.MONTIONT_SILVERPIECE,
        currencyAmount = 4,
        stageNumber    = 1,
        csParam        = 1,
     },

    [xi.item.GILDED_BLADE] =
    {
        requiredItems =
        {
            16583,
            16584,
            16585
        },

        currencyType   = xi.item.LUNGO_NANGO_JADESHELL,
        currencyAmount = 14,
        stageNumber    = 2,
        csParam        = 2,
    },

    [xi.item.DYNAMIS_BLADE] =
    {
        requiredItems =
        {
            1559
        },

        currencyType   = xi.item.ONE_HUNDRED_BYNE_BILL,
        currencyAmount = 61,
        stageNumber    = 3,
        csParam        = 3,
    },

    [xi.item.VALHALLA] =
    {
        requiredItems =
        {
            1574,
            1589
        },

        currencyType   = xi.item.RANPERRE_GOLDPIECE,
        currencyAmount = 1,
        stageNumber    = 4,
        csParam        = 3,
    },

    -- Guttler
    [xi.item.RELIC_AXE] =
    {
        requiredItems =
        {
            1312,
            1463,
            13060
        },

        currencyType   = xi.item.LUNGO_NANGO_JADESHELL,
        currencyAmount = 3,
        stageNumber    = 1,
        csParam        = 1,
    },

    [xi.item.LEONINE_AXE] =
    {
        requiredItems =
        {
            16657,
            16658,
            16659
        },

        currencyType   = xi.item.MONTIONT_SILVERPIECE,
        currencyAmount = 14,
        stageNumber    = 2,
        csParam        = 2,
    },

    [xi.item.DYNAMIS_AXE] =
    {
        requiredItems =
        {
            1560
        },

        currencyType   = xi.item.ONE_HUNDRED_BYNE_BILL,
        currencyAmount = 60,
        stageNumber    = 3,
        csParam        = 3,
    },

    [xi.item.OGRE_KILLER] =
    {
        requiredItems =
        {
            1575,
            1589
        },

        currencyType   = xi.item.RIMILALA_STRIPESHELL,
        currencyAmount = 1,
        stageNumber    = 4,
        csParam        = 3,
    },

    -- Bravura
    [xi.item.RELIC_BHUJ] =
    {
        requiredItems =
        {
            1461,
            658,
            720
        },

        currencyType   = xi.item.ONE_HUNDRED_BYNE_BILL,
        currencyAmount = 3,
        stageNumber    = 1,
        csParam        = 1,
    },

    [xi.item.AGONAL_BHUJ] =
    {
        requiredItems =
        {
            16704,
            16705,
            16724
        },

        currencyType   = xi.item.LUNGO_NANGO_JADESHELL,
        currencyAmount = 16,
        stageNumber    = 2,
        csParam        = 2,
    },

    [xi.item.DYNAMIS_BHUJ] =
    {
        requiredItems =
        {
            1561
        },

        currencyType   = xi.item.MONTIONT_SILVERPIECE,
        currencyAmount = 60,
        stageNumber    = 3,
        csParam        = 3,
    },

    [xi.item.ABADDON_KILLER] =
    {
        requiredItems =
        {
            1576,
            1589
        },

        currencyType   = xi.item.TEN_THOUSAND_BYNE_BILL,
        currencyAmount = 1,
        stageNumber    = 4,
        csParam        = 3,
    },

    -- Gungnir
    [xi.item.RELIC_LANCE] =
    {
        requiredItems =
        {
            1462,
            747,
            1294
        },

        currencyType   = xi.item.LUNGO_NANGO_JADESHELL,
        currencyAmount = 4,
        stageNumber    = 1,
        csParam        = 1,
    },

    [xi.item.HOTSPUR_LANCE] =
    {
        requiredItems =
        {
            16834,
            16836,
            16841
        },

        currencyType   = xi.item.ONE_HUNDRED_BYNE_BILL,
        currencyAmount = 16,
        stageNumber    = 2,
        csParam        = 2
    },

    [xi.item.DYNAMIS_LANCE] =
    {
        requiredItems =
        {
            1563
        },

        currencyType   = xi.item.MONTIONT_SILVERPIECE,
        currencyAmount = 61,
        stageNumber    = 3,
        csParam        = 3
    },

    [xi.item.GAE_ASSAIL] =
    {
        requiredItems =
        {
            1578,
            1589
        },

        currencyType   = xi.item.RIMILALA_STRIPESHELL,
        currencyAmount = 1,
        stageNumber    = 4,
        csParam        = 3
    },

    -- Apocalypse
    [xi.item.RELIC_SCYTHE] =
    {
        requiredItems =
        {
            1458,
            1117,
            13208
        },

        currencyType   = xi.item.LUNGO_NANGO_JADESHELL,
        currencyAmount = 5,
        stageNumber    = 1,
        csParam        = 1
    },

    [xi.item.MEMENTO_SCYTHE] =
    {
        requiredItems =
        {
            16774,
            16794,
            16777
        },

        currencyType   = xi.item.MONTIONT_SILVERPIECE,
        currencyAmount = 16,
        stageNumber    = 2,
        csParam        = 2
    },

    [xi.item.DYNAMIS_SCYTHE] =
    {
        requiredItems =
        {
            1562
        },

        currencyType   = xi.item.ONE_HUNDRED_BYNE_BILL,
        currencyAmount = 62,
        stageNumber    = 3,
        csParam        = 3
    },

    [xi.item.BEC_DE_FAUCON] =
    {
        requiredItems =
        {
            1577,
            1589
        },

        currencyType   = xi.item.RIMILALA_STRIPESHELL,
        currencyAmount = 1,
        stageNumber    = 4,
        csParam        = 3
    },

    -- Kikoku
    [xi.item.IHINTANTO] =
    {
        requiredItems =
        {
            1467,
            1276,
            1278
        },

        currencyType   = xi.item.ONE_HUNDRED_BYNE_BILL,
        currencyAmount = 4,
        stageNumber    = 1,
        csParam        = 1
    },

    [xi.item.MIMIZUKU] =
    {
        requiredItems =
        {
            16900,
            16903,
            16902
        },

        currencyType   = xi.item.LUNGO_NANGO_JADESHELL,
        currencyAmount = 16,
        stageNumber    = 2,
        csParam        = 2
    },

    [xi.item.ROGETSU] =
    {
        requiredItems =
        {
            1564
        },

        currencyType   = xi.item.MONTIONT_SILVERPIECE,
        currencyAmount = 61,
        stageNumber    = 3,
        csParam        = 3
    },

    [xi.item.YOSHIMITSU] =
    {
        requiredItems =
        {
            1579,
            1589
        },

        currencyType   = xi.item.TEN_THOUSAND_BYNE_BILL,
        currencyAmount = 1,
        stageNumber    = 4,
        csParam        = 3
    },

    -- Amanomurakumo
    [xi.item.ITO] =
    {
        requiredItems =
        {
            1467,
            1409,
            657
        },

        currencyType   = xi.item.MONTIONT_SILVERPIECE,
        currencyAmount = 3,
        stageNumber    = 1,
        csParam        = 1
    },

    [xi.item.HAYATEMARU] =
    {
        requiredItems =
        {
            16966,
            16967,
            16972
        },

        currencyType   = xi.item.LUNGO_NANGO_JADESHELL,
        currencyAmount = 15,
        stageNumber    = 2,
        csParam        = 2
    },

    [xi.item.OBOROMARU] =
    {
        requiredItems =
        {
            1565
        },

        currencyType   = xi.item.ONE_HUNDRED_BYNE_BILL,
        currencyAmount = 60,
        stageNumber    = 3,
        csParam        = 3
    },

    [xi.item.TOTSUKANOTSURUGI] =
    {
        requiredItems =
        {
            1580,
            1589
        },

        currencyType   = xi.item.RANPERRE_GOLDPIECE,
        currencyAmount = 1,
        stageNumber    = 4,
        csParam        = 3
    },

    -- Mjollnir
    [xi.item.RELIC_MAUL] =
    {
        requiredItems =
        {
            1461,
            746,
            830
        },

        currencyType   = xi.item.MONTIONT_SILVERPIECE,
        currencyAmount = 5,
        stageNumber    = 1,
        csParam        = 1,
    },

    [xi.item.BATTERING_MAUL] =
    {
        requiredItems =
        {
            17044,
            17080,
            17043
        },

        currencyType   = xi.item.ONE_HUNDRED_BYNE_BILL,
        currencyAmount = 16,
        stageNumber    = 2,
        csParam        = 2
    },

    [xi.item.DYNAMIS_MAUL] =
    {
        requiredItems =
        {
            1566
        },

        currencyType   = xi.item.LUNGO_NANGO_JADESHELL,
        currencyAmount = 62,
        stageNumber    = 3,
        csParam        = 3
    },

    [xi.item.GULLINTANI] =
    {
        requiredItems =
        {
            1581,
            1589
        },

        currencyType   = xi.item.RANPERRE_GOLDPIECE,
        currencyAmount = 1,
        stageNumber    = 4,
        csParam        = 3
    },

    -- Claustrum
    [xi.item.RELIC_STAFF] =
    {
        requiredItems =
        {
            1462,
            1271,
            1415
        },

        currencyType   = xi.item.LUNGO_NANGO_JADESHELL,
        currencyAmount = 5,
        stageNumber    = 1,
        csParam        = 1
    },

    [xi.item.SAGES_STAFF] =
    {
        requiredItems =
        {
            17088,
            17090,
            17092
        },

        currencyType   = xi.item.ONE_HUNDRED_BYNE_BILL,
        currencyAmount = 16,
        stageNumber    = 2,
        csParam        = 2
    },

    [xi.item.DYNAMIS_STAFF] =
    {
        requiredItems =
        {
            1567
        },

        currencyType   = xi.item.MONTIONT_SILVERPIECE,
        currencyAmount = 62,
        stageNumber    = 3,
        csParam        = 3
    },

    [xi.item.THYRUS] =
    {
        requiredItems =
        {
            1582,
            1589
        },

        currencyType   = xi.item.RIMILALA_STRIPESHELL,
        currencyAmount = 1,
        stageNumber    = 4,
        csParam        = 3
    },

    -- Annihilator
    [xi.item.RELIC_GUN] =
    {
        requiredItems =
        {
            1468,
            830,
            654
        },

        currencyType   = xi.item.ONE_HUNDRED_BYNE_BILL,
        currencyAmount = 5,
        stageNumber    = 1,
        csParam        = 1
    },

    [xi.item.MARKSMAN_GUN] =
    {
        requiredItems =
        {
            17248,
            17251,
            17259
        },

        currencyType   = xi.item.LUNGO_NANGO_JADESHELL,
        currencyAmount = 15,
        stageNumber    = 2,
        csParam        = 2
    },

    [xi.item.DYNAMIS_GUN] =
    {
        requiredItems =
        {
            1570
        },

        currencyType   = xi.item.MONTIONT_SILVERPIECE,
        currencyAmount = 62,
        stageNumber    = 3,
        csParam        = 3
    },

    [xi.item.FERDINAND] =
    {
        requiredItems =
        {
            1585,
            1589
        },

        currencyType   = xi.item.TEN_THOUSAND_BYNE_BILL,
        currencyAmount = 1,
        stageNumber    = 4,
        csParam        = 3
    },

    -- Gjallarhorn
    [xi.item.RELIC_HORN] =
    {
        requiredItems =
        {
            1458,
            1463,
            13232
        },

        currencyType   = xi.item.LUNGO_NANGO_JADESHELL,
        currencyAmount = 3,
        stageNumber    = 1,
        csParam        = 1
    },

    [xi.item.PYRRHIC_HORN] =
    {
        requiredItems =
        {
            17352,
            17351,
            17362
        },

        currencyType   = xi.item.ONE_HUNDRED_BYNE_BILL,
        currencyAmount = 14,
        stageNumber    = 2,
        csParam        = 2
    },

    [xi.item.DYNAMIS_HORN] =
    {
        requiredItems =
        {
            1569
        },

        currencyType   = xi.item.MONTIONT_SILVERPIECE,
        currencyAmount = 60,
        stageNumber    = 3,
        csParam        = 3
    },

    [xi.item.MILLENNIUM_HORN] =
    {
        requiredItems =
        {
            1584,
            1589
        },

        currencyType   = xi.item.RIMILALA_STRIPESHELL,
        currencyAmount = 1,
        stageNumber    = 4,
        csParam        = 3
    },

    -- Yoichinoyumi
    [xi.item.RELIC_BOW] =
    {
        requiredItems =
        {
            883,
            1462,
            932
        },

        currencyType   = xi.item.MONTIONT_SILVERPIECE,
        currencyAmount = 4,
        stageNumber    = 1,
        csParam        = 1
    },

    [xi.item.WOLVER_BOW] =
    {
        requiredItems =
        {
            17161,
            17164,
            18142
        },

        currencyType   = xi.item.MONTIONT_SILVERPIECE,
        currencyAmount = 15,
        stageNumber    = 2,
        csParam        = 2
    },

    [xi.item.DYNAMIS_BOW] =
    {
        requiredItems =
        {
            1568
        },

        currencyType   = xi.item.LUNGO_NANGO_JADESHELL,
        currencyAmount = 61,
        stageNumber    = 3,
        csParam        = 3
    },

    [xi.item.FUTATOKOROTO] =
    {
        requiredItems =
        {
            1583,
            1589
        },

        currencyType   = xi.item.RANPERRE_GOLDPIECE,
        currencyAmount = 1,
        stageNumber    = 4,
        csParam        = 3
    },

    -- Aegis
    [xi.item.RELIC_SHIELD] =
    {
        requiredItems =
        {
            875,
            668,
            720
        },

        currencyType   = 0,
        currencyAmount = 1,
        stageNumber    = 1,
        csParam        = 4
    },

    [xi.item.BULWARK_SHIELD] =
    {
        requiredItems =
        {
            12301,
            12295,
            12387
        },

        currencyType   = 0,
        currencyAmount = 4,
        stageNumber    = 2,
        csParam        = 5
    },

    [xi.item.DYNAMIS_SHIELD] =
    {
        requiredItems =
        {
            1821
        },

        currencyType   = 0,
        currencyAmount = 20,
        stageNumber    = 3,
        csParam        = 6
    },

    [xi.item.ANCILE] =
    {
        requiredItems =
        {
            1822,
            1589
        },

        currencyType   = xi.item.RANPERRE_GOLDPIECE,
        currencyAmount = 1,
        stageNumber    = 4,
        csParam        = 6
    },
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

local function getRequiredItems(relicItemId)
    local itemTable = { 0, 0, 0 }

    for itemIndex = 1, #relics[relicItemId].requiredItems do
        itemTable[itemIndex] = relics[relicItemId].requiredItems[itemIndex]
    end

    return itemTable
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
        if trade:getItemCount() ~= relic.currencyAmount then
            return false
        else
            return trade:hasItemQty(relic.currencyType, relic.currencyAmount)
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
                relic.stageNumber ~= 4 and
                tradeHasRequiredMaterials(trade, relicId, relic.requiredItems)
            then
                local requiredItems = getRequiredItems(relicId)

                player:setCharVar('RELIC_IN_PROGRESS', relicId)
                player:tradeComplete()
                player:startEvent(11, relicId, requiredItems[1], requiredItems[2], requiredItems[3], relic.currencyType, relic.currencyAmount, 0, relic.csParam)
            end
        elseif currentRelic ~= 0 and relicId ~= currentRelic then
            player:startEvent(87)
        end
    elseif currentRelic ~= 0 then
        local relic = relics[currentRelic]
        local currentStage = relic.stageNumber

        if currentStage ~= 4 and tradeHasRequiredCurrency(trade, currentRelic) then
            if currentStage == 1 then
                player:setCharVar('RELIC_DUE_AT', getVanaMidnight())
            elseif currentStage == 2 then
                player:setCharVar('RELIC_DUE_AT', os.time() + xi.settings.main.RELIC_2ND_UPGRADE_WAIT_TIME)
            elseif currentStage == 3 then
                player:setCharVar('RELIC_DUE_AT', os.time() + xi.settings.main.RELIC_3RD_UPGRADE_WAIT_TIME)
            end

            player:tradeComplete()
            player:startEvent(13, currentRelic, relic.currencyType, relic.currencyAmount, 0, 0, 0, 0, relic.csParam)
        end
    end
end

-- Corresponds to not enough time has passed condition.  Correct amount passed is one greater
-- than the below events and conquest tally is one lower.
local triggerEventsByStage =
{
    [1] = 15,
    [2] = 18,
    [3] = 51,
}

entity.onTrigger = function(player, npc)
    local relicId = hasRelic(player, false)
    local currentRelic = player:getCharVar('RELIC_IN_PROGRESS')
    local relicWait = player:getCharVar('RELIC_DUE_AT')
    local relicConquest = player:getCharVar('RELIC_CONQUEST_WAIT')

    if
        currentRelic ~= 0 and
        relicWait ~= 0 and
        relics[currentRelic].stageNumber ~= 4
    then
        local relic = relics[currentRelic]
        local currentStage = relic.stageNumber

        if relicWait > os.time() then
            -- Not enough time has passed
            player:startEvent(triggerEventsByStage[currentStage], 0, 0, 0, 0, 0, 0, 0, relic.csParam)
        else
            -- Enough time has passed
            player:startEvent(triggerEventsByStage[currentStage] + 1, 0, 0, 0, 0, 0, 0, 0, relic.csParam)
        end
    elseif
        currentRelic ~= 0 and
        relicWait == 0 and
        relics[currentRelic].stageNumber ~= 4
    then
        -- Need currency to start timer
        local relic = relics[currentRelic]
        player:startEvent(12, currentRelic, relic.currencyType, relic.currencyAmount, 0, 0, 0, 0, relic.csParam)
    elseif relicId == nil or relicConquest > os.time() then
        -- Player doesn't have a relevant item and hasn't started one
        player:startEvent(10)
    elseif relicId ~= nil and relicConquest <= os.time() then
        -- Player has a relevant item and conquest tally has passed
        local relic         = relics[relicId]
        local currentStage  = relic.stageNumber
        local requiredItems = getRequiredItems(relicId)

        if currentStage < 4 then
            player:startEvent(triggerEventsByStage[currentStage] - 1, relicId, requiredItems[1], requiredItems[2], requiredItems[3], 0, 0, 0, relic.csParam)
        else
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

            player:startEvent(itemToEventId[relicId], requiredItem1, requiredItem2, relic.currencyType, relic.currencyAmount, relicId)
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
        if npcUtil.giveItem(player, reward + 1) then
            player:setCharVar('RELIC_IN_PROGRESS', 0)
            player:setCharVar('RELIC_DUE_AT', 0)
            player:setCharVar('RELIC_MAKE_ANOTHER', 0)
            player:setCharVar('RELIC_CONQUEST_WAIT', NextConquestTally())
        end

        -- Picking up a finished relic stage 3>4.
    elseif csid == 52 and reward ~= 0 then
        if npcUtil.giveItem(player, reward + 1) then
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
