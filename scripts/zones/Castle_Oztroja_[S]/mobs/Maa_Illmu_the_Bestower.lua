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
-- Uses Benediction randomly below 50% HP.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
local spellList =
{
    [1] = 57, -- Haste 
    [3] = 51, -- Shell IV
    [5] = 5,  -- Cure V
    [6] = 46, -- Protect IV
}

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
    mob:setMod(tpz.mod.EEM_SILENCE, 150)
    mob:setMod(tpz.mod.SPELLINTERRUPT, 130)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 1)
end

function onMobFight(mob, target)
    -- Will not use TP moves unless silenced - when Silence is inflicted it will immediately use a random TP move.
    if mob:hasStatusEffect(tpz.effect.SILENCE) then
        mob:SetMobAbilityEnabled(true)
    else
        mob:SetMobAbilityEnabled(false)
    end
end

function onMonsterMagicPrepare(mob,target)
    return GetBestSpell()
end

function onMobWeaponSkillPrepare(mob, target)
   local tpMoves = {617, 620, 2205, 2270}
   --  Feather Storm, Sweep, Feathered Furore, Shirahadori
   return tpMoves[math.random(#tpMoves)]
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(7200) -- 2 hours
end

function GetBestSpell()

    -- Check for buffs
    if not mob:hasStatusEffect(tpz.effect.HASTE) then
        return 57
    elseif not mob:hasStatusEffect(tpz.effect.SHELL) then
        return 51
    elseif not mob:hasStatusEffect(tpz.effect.PROTECT) then
        return 46
    end

    return 5 -- Cure V
end
