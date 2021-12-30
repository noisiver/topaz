------------------------------
-- Area: Misareaux Coast
--   NM: Odqan
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    RNG = math.random(1, 3)
	mob:setMod(tpz.mod.MAIN_DMG_RATING, 25)
	mob:setMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    if RNG == 1 then
        mob:setPos(204.733, -24.365, 316.403)
    elseif RNG == 2 then
        mob:setPos(83.241 ,-8.259, -41.968)
    elseif RNG == 3 then
        mob:setPos(490.6467, -24.1248, 314.5225)
    end
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 443)
end
