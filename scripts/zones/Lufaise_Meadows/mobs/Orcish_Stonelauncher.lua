-----------------------------------
-- Area: Lufaise_Meadows
--  Mob: Orcish Stonelauncher
-----------------------------------
mixins = {require("scripts/mixins/fomor_hate")}

function onMobSpawn(mob)
    mob:setLocalVar("fomorHateAdj", -1)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
