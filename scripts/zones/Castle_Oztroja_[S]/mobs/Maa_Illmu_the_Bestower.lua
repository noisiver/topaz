-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Maa Illmu the Bestower
-- WHM/WHM
-- Immune to Paralyze, Sleep, Bind, Grabity, Break
-- Immune to spell interrupts
-- Casts: Haste, Protect IV, Shell IV, Cure V. Will only spam Cure V if all buffs are on.
-- Slow makes him cast haste even if it won't overwrite.
-- No cast timer.
--  Will not use TP moves unless silenced - when Silence is inflicted it will immediately use a random TP move.
-- Silence will only last 30s
-- Uses Featherstorm, Shirahadori, Feathered Furore, Sweep
-- Uses Benediction randomly below 5)% HP.
-- TODO:
--  Test what spells it casts at what HPP.
--  Immune to spell interruption from melee attacks. Only stuns and silence will interrupt it.
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 6)
    mob:setMod(tpz.mod.SILENCERES, 100)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end
