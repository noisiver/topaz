-----------------------------------
-- Area: Oldton Movalpolos
--   NM: Goblin Wolfman
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobSpawn(mob)
     mob:addMod(tpz.mod.DEFP, 30) 
     mob:addMod(tpz.mod.ATTP, 50)
     mob:addMod(tpz.mod.EVA, 30)
     mob:setMod(tpz.mod.REFRESH, 300)
end

function onMobFight(mob, target)
    if (mob:hasStatusEffect(tpz.effect.BLOOD_WEAPON) == true) then
        mob:setMod(tpz.mod.ATTP, 300)
    else
	        mob:setMod(tpz.mod.ATTP, 50)
    end
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 245)
end
