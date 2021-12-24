-----------------------------------
-- Area: AlTaieu
--  MOB: Aw_euvhi
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
mixins = {require("scripts/mixins/families/euvhi")}
require("scripts/globals/keyitems")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
end

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID()

    if (mobID == ID.mob.EUVHIS_WHITE+0 or mobID == ID.mob.EUVHIS_WHITE+2 or mobID == ID.mob.EUVHIS_WHITE+4) then
        if (not player:hasKeyItem(tpz.ki.WHITE_CARD)) then
            player:addKeyItem(tpz.ki.WHITE_CARD)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.WHITE_CARD)
        end

    elseif (mobID == ID.mob.EUVHIS_RED+0 or mobID == ID.mob.EUVHIS_RED+2 or mobID == ID.mob.EUVHIS_RED+4) then
        if (not player:hasKeyItem(tpz.ki.RED_CARD)) then
            player:addKeyItem(tpz.ki.RED_CARD)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.RED_CARD)
        end

    elseif (mobID == ID.mob.EUVHIS_BLACK+0 or mobID == ID.mob.EUVHIS_BLACK+2 or mobID == ID.mob.EUVHIS_BLACK+4) then
        if (not player:hasKeyItem(tpz.ki.BLACK_CARD)) then
            player:addKeyItem(tpz.ki.BLACK_CARD)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.BLACK_CARD)
        end

    end
end
