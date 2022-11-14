-----------------------------------
-- Area: Arrapago Reef
-- Door: Tidal Gate
-- !pos -404 -15 419 54
-----------------------------------
local ID = require("scripts/zones/Arrapago_Reef/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/items")
-----------------------------------

function onTrade(player, npc, trade)
    local party = player:getParty()

    if npc:getAnimation() == tpz.anim.CLOSE_DOOR then
        if npcUtil.tradeHas(trade, tpz.items.LAMIAN_CLAW_KEY, tpz.items.LAMIAN_FANG_KEY, tpz.items.LAMIAN_BONE_KEY, true) then
            npc:openDoor(30)
            player:tradeComplete()
            if party ~= nil then
                for _,v in ipairs(party) do
                    v:messageSpecial(ID.text.OPEN_TIDAL_GATE)
                    v:timer(6000, function(v)
                        v:messageSpecial(ID.text.SIGNING_VOICE)
                    end)
                    v:timer(12000, function(v)
                        v:messageSpecial(ID.text.MERROW_SINGING)
                    end)
                end
            end
        end
    end
end

function onTrigger(player, npc)
    if (player:getXPos() > -406) then
        player:messageSpecial(ID.text.RED_BELL_SYMBOL)
    else
        npc:openDoor(30)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
