-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Mandragora Assistant
-- !pos -54 11.15 -28 243
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.mandragoraMania.onTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.mandragoraMania.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.mandragoraMania.onEventFinish(player, csid, option, npc)
end

return entity
