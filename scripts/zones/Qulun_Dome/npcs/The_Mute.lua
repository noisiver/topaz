-----------------------------------
-- Area: Qulun Dome
--  NPC: The Mute
-- !zone 148
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/ability")
require("scripts/globals/msg")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local animationId = 59
    player:injectActionPacket(tpz.action.MAGIC_FINISH, animationId, tpz.specEffect.NONE, tpz.reaction.HIT, tpz.msg.basic.NONE)
    player:addStatusEffect(tpz.effect.SILENCE, 0, 0, math.random(420, 840))
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
