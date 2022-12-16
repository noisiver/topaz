-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Asterion
-- MNK/MNK
-- Immune to Sleep, Bind, Gravity, Break
-- Counters, Guards, Kicks.
-- 100-36% Uses Frightful Roar, Back Swish, Unblest Armor, Triclip
-- 36%-0% uses Frightful Roar, Mow, Triclip, and Mortal Ray
-- Gradually attack faster as he loses HP.
-- Gains 100/tick regain below 25% HP. Uses a TP move every 30s
-- Uses Hundred Fists randomly below 50%
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
end

function onMobFight(mob, target)
    local hpp = mob:getHPP()

    -- As it gets low, its attack speed increases to near perma-hundred fists.
    -- hundred fists is 1700 delay. this formula will range between 4500 and 1700.
    mob:setDelay(1700 + hpp * 28)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end
