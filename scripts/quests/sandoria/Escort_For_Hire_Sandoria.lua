-----------------------------------
-- Escort for Hire (San d'Oria)
-----------------------------------
-- Log ID: 0, Quest ID: 103
-- Rondipur !pos -154 10 153
-----------------------------------
local ID = zones[xi.zone.THE_ELDIEME_NECROPOLIS]
-----------------------------------

local quest = Quest:new(xi.questLog.SANDORIA, xi.quest.id.sandoria.ESCORT_FOR_HIRE)

quest.reward =
{
    gil = 10000,
    fame = 100,
    fameArea = xi.quest.area.SANDORIA,
    item = xi.item.MIRATETES_MEMOIRS,
}

local function spawnEscort(player, escort, checkEscort, zone, playerPos)
    local cannau = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Cannau',
        groupId = 59,
        groupZoneId = 195,
        x = 0,
        y = 0,
        z = 0,
        rotation = 0,
        allegiance = xi.allegiance.PLAYER,
        isAggroable = true,
        specialSpawnAnimation = true,
        releaseIdOnDisappear = true,
    })

    if not cannau then
        return
    end

    SetServerVariable(escort, cannau:getID())

    cannau:spawn()
    cannau:timer(1000, function()
        cannau:setPos(playerPos.x, playerPos.y, playerPos.z, playerPos.rot)
    end)

    cannau:setStatus(xi.status.NORMAL)

    player:messageSpecial(ID.text.TIME_LIMIT, 30)
    cannau:setLocalVar('escort', cannau:getID())
    cannau:setLocalVar('player', player:getID())
    cannau:setLocalVar('progress', 0)
    cannau:setLocalVar('expire', os.time() + 1800)
    player:getZone():setLocalVar('expire', os.time() + 1800)
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return status ~= xi.questStatus.QUEST_AVAILABLE and
                player:getQuestStatus(xi.questLog.BASTOK, xi.quest.id.bastok.ESCORT_FOR_HIRE) ~= xi.questStatus.QUEST_ACCEPTED and
                player:getQuestStatus(xi.questLog.WINDURST, xi.quest.id.windurst.ESCORT_FOR_HIRE) ~= xi.questStatus.QUEST_ACCEPTED and
                player:getFameLevel(xi.fameArea.SANDORIA) >= 6
        end,

        [xi.zone.NORTHERN_SAN_DORIA] =
        {
            ['Rondipur'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Timer') == 0 then
                        return quest:progressEvent(721)
                    else
                        return quest:event(724) -- Needs confirmation
                    end
                end,
            },

            onEventFinish =
            {
                [721] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.BATALLIA_DOWNS] =
        {
            onTriggerAreaEnter =
            {
                [10] = function(player, triggerArea)
                    quest:setVar(player, 'Front', 1)
                end,
            },
        },

        [xi.zone.THE_ELDIEME_NECROPOLIS] =
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
                    GetServerVariable('[Escort]Cannau') == 0 and
                    not player:hasKeyItem(xi.ki.COMPLETION_CERTIFICATE)
                then
                    return 51
                end
            end,

            onEventFinish =
            {
                [51] = function(player, csid, option, npc)
                    local escort      = '[Escort]Cannau'
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

        [xi.zone.NORTHERN_SAN_DORIA] =
        {
            ['Rondipur'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.COMPLETION_CERTIFICATE) then
                        return quest:progressEvent(723)
                    else
                        return quest:progressEvent(722)
                    end
                end,
            },

            onEventFinish =
            {
                [723] = function(player, csid, option, npc)
                    local gilAmount = player:hasCompletedQuest(quest.areaId, quest.questId) and 0 or 10000

                    if quest:complete(player) then
                        player:delKeyItem(xi.ki.COMPLETION_CERTIFICATE)
                        npcUtil.giveCurrency(player, 'gil', gilAmount)

                        quest:setVar(player, 'Timer', 1, NextConquestTally())
                    end
                end,

                [722] = function(player, csid, option, npc)
                    if option == 0 then
                        player:delQuest(xi.questLog.SANDORIA, xi.quest.id.sandoria.ESCORT_FOR_HIRE)
                        quest:cleanup(player)
                    end
                end,
            },
        },
    },
}

return quest
