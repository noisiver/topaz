-----------------------------------
-- Area: Halvung
-- NPC:  Decorative Bronze Gate (Gurfurlur the Menacing)
-- !pos -60.000 -22.000 80.000 62
-------------------------------------
local ID = require("scripts/zones/Halvung/IDs");

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, {ID.item.HALVUNG_SHAKUDO_KEY, ID.item.HALVUNG_BRONZE_KEY, ID.item.HALVUNG_BRASS_KEY}) then
        if npc:getAnimation() == tpz.anim.CLOSE_DOOR then
            player:messageSpecial(ID.text.GURFURLUR_DOOR_KEYS, ID.item.HALVUNG_SHAKUDO_KEY, ID.item.HALVUNG_BRONZE_KEY, ID.item.HALVUNG_BRASS_KEY)
            player:confirmTrade()
            npc:openDoor(20)
        else
            player:messageSpecial(ID.text.NO_NEED_TO_USE_KEY)
        end
    end
end

function onTrigger(player,npc)
    if npc:getAnimation() == tpz.anim.CLOSE_DOOR then
        if player:getZPos() < 80 then
            player:messageSpecial(ID.text.GATE_FIRMLY_CLOSED)
        else
            player:messageSpecial(ID.text.GURFURLUR_DOOR_LOCKED)
        end
    end
end
