-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Marquis Forneus
-- DRK/DRK
-- Immune to Silence, Paralyze, Sleep, Bind, Gravity, Break
-- Extremely high weapon damage and attack. Hit me for 600 naked, and hit me for 250 with 462 defense
-- High ACC
-- En-absorb(No msg in chat log). Not 100% proc
-- Cannot miss dark absorbs.
-- Casts Drain, Aspir, Stun, Dread Spikes, and Absorb Spells.
-- Cast Timer: 
-- 100% - 50%: 30s
-- 50% - 25: 15s
-- 25% - 0: 10s
-- Uses: Soul Drain, Condemnation, Hecatomb Wave, Demonic Howl
-- Uses Blood Weapon sometime below 50% HP
-- TODO: Test status absorb
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
    mob:setDamage(250)
    mob:setMod(tpz.mod.ATTP, 100)
    mob:setMod(tpz.mod.ACC, 400)
    mob:setMod(tpz.mod.DARK, 9999)
end

function onMobFight(mob, target)
    local hp = mob:getHPP()

    -- 30s between casts above 50% HP, 15s between casts between 26-50% HP and 10s below 25% HP
    if (hp < 26) then
        mob:setMobMod(tpz.mobMod.MAGIC_COOL, 10)
    elseif (hp < 51) then
        mob:setMobMod(tpz.mobMod.MAGIC_COOL, 15)
    else
        mob:setMobMod(tpz.mobMod.MAGIC_COOL, 30)
    end
end

function onMobWeaponSkillPrepare(mob, target)
   local tpMoves = {559, 560, 563, 1148}
   --  Soul Drain, Hecatomb Wave, Demonic Howl, Condemnation
   return tpMoves[math.random(#tpMoves)]
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(18000, 21600)) -- 5 to 6 hours
end
