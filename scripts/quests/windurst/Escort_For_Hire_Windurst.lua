-----------------------------------
-- Escort for Hire (Windurst)
-----------------------------------
-- Log ID: 2, Quest ID: 88
-- Dehn Harzhapan !pos -7, -6, 152
-----------------------------------
local ID = zones[xi.zone.GARLAIGE_CITADEL]
-----------------------------------

local quest = Quest:new(xi.questLog.WINDURST, xi.quest.id.windurst.ESCORT_FOR_HIRE)

quest.reward =
{
    fame     = 100,
    fameArea = xi.quest.area.WINDURST,
    item     = xi.item.MIRATETES_MEMOIRS,
}

local function spawnEscort(player, escort, checkEscort, zone, playerPos)
    local wanzo = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Wanzo-Unzozo',
        groupId = 49,
        groupZoneId = 200,
        x = 0,
        y = 0,
        z = 0,
        rotation = 0,
        allegiance = xi.allegiance.PLAYER,
        isAggroable = true,
        specialSpawnAnimation = true,
        releaseIdOnDisappear = true,
    })

    if wanzo == nil then
        return
    end

    SetServerVariable(escort, wanzo:getID())

    wanzo:spawn()
    wanzo:timer(1000, function()
        wanzo:setPos(playerPos.x, playerPos.y, playerPos.z, playerPos.rot)
    end)

    wanzo:setStatus(xi.status.NORMAL)

    player:messageSpecial(ID.text.TIME_LIMIT, 30)
    wanzo:setLocalVar('escort', wanzo:getID())
    wanzo:setLocalVar('player', player:getID())
    wanzo:setLocalVar('progress', 0)
    wanzo:setLocalVar('expire', os.time() + 1800)
    player:getZone():setLocalVar('expire', os.time() + 1800)
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return status ~= xi.questStatus.QUEST_ACCEPTED and
                player:getQuestStatus(xi.questLog.BASTOK, xi.quest.id.bastok.ESCORT_FOR_HIRE) ~= xi.questStatus.QUEST_ACCEPTED and
                player:getQuestStatus(xi.questLog.SANDORIA, xi.quest.id.sandoria.ESCORT_FOR_HIRE) ~= xi.questStatus.QUEST_ACCEPTED and
                player:getFameLevel(xi.fameArea.WINDURST) >= 6
        end,

        [xi.zone.PORT_WINDURST] =
        {
            ['Dehn_Harzhapan'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Timer') == 0 then
                        return quest:progressEvent(10014)
                    else
                        return quest:event(10017)
                    end
                end,
            },

            onEventFinish =
            {
                [10014] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.SAUROMUGUE_CHAMPAIGN] =
        {
            onTriggerAreaEnter =
            {
                [1] = function(player, triggerArea)
                    quest:setVar(player, 'Front', 1)
                end,
            },
        },

        [xi.zone.GARLAIGE_CITADEL] =
        {
            onTriggerAreaLeave =
            {
                [23] = function(player, triggerArea)
                    quest:setVar(player, 'Front', 0)
                end
            },

            onZoneIn = function(player, prevZone)
                local questProgress = quest:getVar(player, 'Prog')

                if
                    (questProgress == 0 or questProgress == 2) and
                    quest:getVar(player, 'Front') == 1 and
                    GetServerVariable('[Escort]Wanzo') == 0 and
                    not player:hasKeyItem(xi.ki.COMPLETION_CERTIFICATE)
                then
                    return 60
                end
            end,

            onEventFinish =
            {
                [60] = function(player, csid, option, npc)
                    local escort      = '[Escort]Wanzo'
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

        [xi.zone.PORT_WINDURST] =
        {
            ['Dehn_Harzhapan'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.COMPLETION_CERTIFICATE) then
                        return quest:progressEvent(10016)
                    else
                        return quest:event(10015)
                    end
                end,
            },

            onEventFinish =
            {
                [10016] = function(player, csid, option, npc)
                    local gilAmount = player:hasCompletedQuest(quest.areaId, quest.questId) and 0 or 10000

                    if quest:complete(player) then
                        player:delKeyItem(xi.ki.COMPLETION_CERTIFICATE)
                        npcUtil.giveCurrency(player, 'gil', gilAmount)

                        quest:setVar(player, 'Timer', 1, NextConquestTally())
                    end
                end,

                [10015] = function(player, csid, option, npc)
                    if option == 0 then
                        player:delQuest(xi.questLog.WINDURST, xi.quest.id.windurst.ESCORT_FOR_HIRE)
                        quest:cleanup(player)
                    end
                end,
            },
        },
    },
}

return quest
