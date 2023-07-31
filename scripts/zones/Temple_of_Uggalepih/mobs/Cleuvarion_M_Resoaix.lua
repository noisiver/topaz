-----------------------------------
-- Area: Temple of Uggalepih
--   NM: Cleuvarion M Resoaix
-- Involved with San d'Oria quest "Knight Stalker"
-- Job: WAR
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setDamage(100)
    mob:setMod(tpz.mod.EEM_STUN, 5)
    mob:setMod(tpz.mod.EEM_LIGHT_SLEEP, 5)
    mob:setMod(tpz.mod.EEM_DARK_SLEEP, 5)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
    -- check for Rompaulion death
    if player:getCharVar("KnightStalker_Progress") == 4 and GetMobByID(mob:getID() + 1):isDead() then
        player:setCharVar("KnightStalker_Kill", 1)
    end
end
