-----------------------------------
-- Area: Riverne Site #A01
--  NPC: qm1
-- Gives Shield Bug for Shieldtrap NM
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
	npcUtil.giveItem(player, 1881)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
