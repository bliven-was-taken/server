-----------------------------------
-- Escort for Hire (Bastok)
-----------------------------------
-- Log ID: 1, Quest ID: 70
-- Trilok !pos -163 -7 5
-----------------------------------
local ID = zones[xi.zone.CRAWLERS_NEST]
-----------------------------------

local quest = Quest:new(xi.questLog.BASTOK, xi.quest.id.bastok.ESCORT_FOR_HIRE)

quest.reward =
{
    fame     = 100,
    fameArea = xi.quest.area.BASTOK,
    item     = xi.item.MIRATETES_MEMOIRS,
}

-- TODO: Determine if this can be moved to a generic function within a helper script
local function spawnEscort(player, escort, checkEscort, zone, playerPos)
    local olavia = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Olavia',
        groupId = 41,
        groupZoneId = 197,
        x = 0,
        y = 0,
        z = 0,
        rotation = 0,
        allegiance = xi.allegiance.PLAYER,
        isAggroable = true,
        specialSpawnAnimation = true,
        releaseIdOnDisappear = true,
    })

    if not olavia then
        return
    end

    SetServerVariable(escort, olavia:getID())

    olavia:spawn()
    olavia:timer(1000, function()
        olavia:setPos(playerPos.x, playerPos.y, playerPos.z, playerPos.rot)
    end)

    olavia:setStatus(xi.status.NORMAL)

    player:messageSpecial(ID.text.TIME_LIMIT, 30)
    olavia:setLocalVar('escort', olavia:getID())
    olavia:setLocalVar('player', player:getID())
    olavia:setLocalVar('progress', 0)
    olavia:setLocalVar('expire', os.time() + 1800)
    player:getZone():setLocalVar('expire', os.time() + 1800)
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return status ~= xi.questStatus.QUEST_ACCEPTED and
                player:getQuestStatus(xi.questLog.WINDURST, xi.quest.id.windurst.ESCORT_FOR_HIRE) ~= xi.questStatus.QUEST_ACCEPTED and
                player:getQuestStatus(xi.questLog.SANDORIA, xi.quest.id.sandoria.ESCORT_FOR_HIRE) ~= xi.questStatus.QUEST_ACCEPTED and
                player:getFameLevel(xi.fameArea.BASTOK) >= 6
        end,

        [xi.zone.PORT_BASTOK] =
        {
            ['Trilok'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Timer') == 0 then
                        return quest:progressEvent(291)
                    else
                        return quest:event(294)
                    end
                end,
            },

            onEventFinish =
            {
                [291] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.ROLANBERRY_FIELDS] =
        {
            onTriggerAreaEnter =
            {
                [1] = function(player, triggerArea)
                    quest:setVar(player, 'Front', 1)
                end,
            },
        },

        [xi.zone.CRAWLERS_NEST] =
        {
            onTriggerAreaLeave =
            {
                [1] = function(player, triggerArea)
                    quest:setVar(player, 'Front', 0)
                end
            },

            onZoneIn = function(player, prevZone)
                local questProgress = quest:getVar(player, 'Prog')

                if
                    (questProgress == 0 or questProgress == 2) and
                    quest:getVar(player, 'Front') == 1 and
                    GetServerVariable('[Escort]Olavia') == 0 and
                    not player:hasKeyItem(xi.ki.COMPLETION_CERTIFICATE)
                then
                    return 6
                end
            end,

            onEventFinish =
            {
                [6] = function(player, csid, option, npc)
                    local escort      = '[Escort]Olavia'
                    local checkEscort = GetServerVariable(escort)
                    local zone        = player:getZone()
                    local playerPos   = player:getPos()

                    if checkEscort == 0 then
                        for _, v in ipairs(player:getParty()) do
                            if not player:hasKeyItem(xi.ki.COMPLETION_CERTIFICATE) then
                                quest:setVar(v, 'Prog', 1)
                            end
                        end

                        spawnEscort(player, escort, checkEscort, zone, playerPos)
                    end
                end,
            },
        },

        [xi.zone.PORT_BASTOK] =
        {
            ['Trilok'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.COMPLETION_CERTIFICATE) then
                        return quest:progressEvent(293)
                    else
                        return quest:event(292)
                    end
                end,
            },

            onEventFinish =
            {
                [293] = function(player, csid, option, npc)
                    local gilAmount = player:hasCompletedQuest(quest.areaId, quest.questId) and 0 or 10000

                    if quest:complete(player) then
                        player:delKeyItem(xi.ki.COMPLETION_CERTIFICATE)
                        npcUtil.giveCurrency(player, 'gil', gilAmount)

                        quest:setVar(player, 'Timer', 1, NextConquestTally())
                    end
                end,

                [292] = function(player, csid, option, npc)
                    if option == 0 then
                        player:delQuest(xi.questLog.BASTOK, xi.quest.id.bastok.ESCORT_FOR_HIRE)
                        quest:cleanup(player)
                    end
                end,
            },
        },
    },
}

return quest
