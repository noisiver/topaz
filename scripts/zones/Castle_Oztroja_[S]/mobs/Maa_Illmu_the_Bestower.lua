-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Maa Illmu the Bestower
-- WHM/WHM
-- Immune to Paralyze, Sleep, Bind, Gravity, Break
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
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 12)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end
