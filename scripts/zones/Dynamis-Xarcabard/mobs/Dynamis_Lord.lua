-----------------------------------
-- Area: Dynamis - Xarcabard
--   NM: Dynamis Lord
-- Note: Mega Boss
-- Spawned by trading a Shrouded Bijou to the ??? in front of Castle Zvahl.
-----------------------------------
local ID = require("scripts/zones/Dynamis-Xarcabard/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------
function onMobSpawn(mob)
	mob:addMod(tpz.mod.DEFP, 30) 
	mob:addMod(tpz.mod.ATTP, 20)
	mob:addMod(tpz.mod.ACC, 50) 
	mob:setDamage(145)
	mob:addMod(tpz.mod.EVA, 30)
	mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.UDMGBREATH, -25)
end

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        between = 60,
        specials =
        {
            {id = tpz.jsa.HUNDRED_FISTS, hpp = 95},
            {id = tpz.jsa.MIGHTY_STRIKES, hpp = 95},
            {id = tpz.jsa.BLOOD_WEAPON, hpp = 95},
            {id = tpz.jsa.CHAINSPELL, hpp = 95},
        },
    })
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller)
    dynamis.megaBossOnDeath(mob, player, isKiller)
    player:addTitle(tpz.title.LIFTER_OF_SHADOWS)
end
