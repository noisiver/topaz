-----------------------------------
-- Area: The Boyahda Tree
--   NM: Voluptuous Vivian
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(130)
    mob:setMod(tpz.mod.ATT, 500)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.EVA, 50)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 30)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 2)
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.THE_VIVISECTOR)
end
