-----------------------------------
-- Area: Beadeaux [S]
--   NM: Za'Dha Adamantking
-- BCNM: Cracking Shells
-- RNG/RNG
-----------------------------------
local ID = require("scripts/zones/Beadeaux_[S]/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 1)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE , 20)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 20)
end

function onMobEngaged(mob, target)
    -- Spawn adds on engage
    for v = mob:getID() +2, mob:getID() +4 do
        local adds = GetMobByID(v)
        adds:spawn()
        adds:updateEnmity(target)
    end
end

function onMobFight(mob, target)
    -- Spawn adds if they're dead
    for v = mob:getID() +2, mob:getID() +4 do
        local adds = GetMobByID(v)
        if not adds:isSpawned() then
            adds:spawn()
            adds:updateEnmity(target)
        end
    end
end

function onMobWeaponSkillPrepare(mob, target)
   local tpMoves = { 611, 2234, 2265 }
   --  Ore Toss, Ore Lob, Skull Smash
   return tpMoves[math.random(#tpMoves)]
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller, noKiller)
    -- Despawn adds on death
    for v = mob:getID() +2, mob:getID() +4 do
        DespawnMob(v)
    end
end
