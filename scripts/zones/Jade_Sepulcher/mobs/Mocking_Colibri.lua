-----------------------------------
-- Area: Jade Sepulcher
--  MOB: Mocking Colibri
-----------------------------------
mixins = {require("scripts/mixins/families/colibri_mimic")}
-----------------------------------

function onMobSpawn(mob)
	mob:setDamage(100)
	mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
