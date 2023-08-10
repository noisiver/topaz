-----------------------------------
-- Area: Full Moon Fountain
--  Mob: Fenrir
-- Avatar Prime fight
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
local ID = require("scripts/zones/Full_Moon_Fountain/IDs")
------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMod(tpz.mod.UFASTCAST, 25)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMod(tpz.mod.REFRESH, 50)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 839, hpp = math.random(30,55)}, -- uses Howling Moon once while near 50% HPP.
        },
    })
end

function onMobDeath(mob, player, isKiller, noKiller)
end
