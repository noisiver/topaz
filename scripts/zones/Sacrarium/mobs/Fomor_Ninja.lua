-----------------------------------
-- Area: Sacrarium
--  Mob: Fomor Ninja
-----------------------------------
mixins = {require("scripts/mixins/fomor_hate")}
require("scripts/globals/mobs")

function onMobSpawn(mob)
    mob:setDelay(3600)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 100)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
