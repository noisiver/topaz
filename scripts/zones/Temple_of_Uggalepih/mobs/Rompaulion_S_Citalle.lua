-----------------------------------
-- Area: Temple of Uggalepih
--   NM: Rompaulion S Citalle
-- Involved with San d'Oria quest "Knight Stalker"
-- JOb: THF
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setDamage(40)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 50)
    mob:setMod(tpz.mod.EEM_STUN, 5)
    mob:setMod(tpz.mod.EEM_LIGHT_SLEEP, 5)
    mob:setMod(tpz.mod.EEM_DARK_SLEEP, 5)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.EVA_DOWN)
end

function onMobDeath(mob, player, isKiller)
    -- check for Cleuvarion death
    if player:getCharVar("KnightStalker_Progress") == 4 and GetMobByID(mob:getID() - 1):isDead() then
        player:setCharVar("KnightStalker_Kill", 1)
    end
end
