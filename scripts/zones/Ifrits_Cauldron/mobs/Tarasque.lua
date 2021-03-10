------------------------------
-- Area: Ifrits Cauldron
--   NM: Tarasque
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
------------------------------
function onMobSpawn(mob)
    local bufftwo = tpz.effect.BLAZE_SPIKES

    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ATTP, 30)
    mob:addMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.EVA, 50)
    mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 50, 0, 3600)
    mob:getStatusEffect(bufftwo):unsetFlag(tpz.effectFlag.DISPELABLE)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 9000)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 403)
end
