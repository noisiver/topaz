-----------------------------------
-- Area: Castle Zvahl Keep (162)
--  Mob: Viscount Morax
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
mixins = {require("scripts/mixins/job_special")}
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 15)
    mob:addMod(tpz.mod.DEFP, 15)
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.UFASTCAST, 25)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 356)
    player:addTitle(tpz.title.HELLSBANE)
end
