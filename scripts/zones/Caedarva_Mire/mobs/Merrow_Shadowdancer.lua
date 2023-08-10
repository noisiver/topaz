-----------------------------------
-- Area: Caedarva Mire (79)
--  Mob: Merrow Shadowdancer
-- Note: Minion of Experimental Lamia
-----------------------------------
mixins =
    {
        require("scripts/mixins/job_special"),
        require("scripts/mixins/weapon_break")
    }
-----------------------------------
function onMobSpawn(mob)
    mob:setDamage(100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
