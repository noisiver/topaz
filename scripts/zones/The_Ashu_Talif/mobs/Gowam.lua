-----------------------------------
-- Area: The Ashu Talif (Against All Odds)
--  Mob: Gowam
-- COR AF3 Fight
-----------------------------------
require("scripts/globals/status")
local ID = require("scripts/zones/The_Ashu_Talif/IDs")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
	mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    mob:showText(mob, ID.text.GOWAM_DEATH)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    instance:setProgress(instance:getProgress() + 1)
end
