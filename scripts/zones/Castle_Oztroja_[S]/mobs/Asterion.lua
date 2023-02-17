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
    mob:setMod(tpz.mod.MARTIAL_ARTS, 0)
end

function onMobFight(mob, target)
    local hp = mob:getHPP()
    -- As it gets low, its attack speed increases to near perma-hundred fists.
    -- hundred fists is 1248 delay. this formula will range between 4500 and 1700.
    if mob:hasStatusEffect(tpz.effect.HUNDRED_FISTS) then
        mob:setDelay(4800)
    else
        mob:setDelay(1248 + hp * 35)
    end

    -- Gains 100/tick regain below 25% HP. Uses a TP move every 30s
    if (hp < 25) then
        mob:setMod(tpz.mod.REGAIN, 100)
    end
end

function onMobWeaponSkillPrepare(mob, target)
   local tpMoves = {498, 499, 501, 503}
   --   Triclip, Back Swish, Frightful Roar, Unblessed Armor
   local tpMoves2 = {498, 500, 501, 502}
   --   Triclip, Mow, Frightful Roar, Mortal Ray
   local hp = mob:getHPP()

   if (hp > 36) then
        return tpMoves[math.random(#tpMoves)]
    else
        return tpMoves2[math.random(#tpMoves2)]
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(7200) -- 2 hours
end
