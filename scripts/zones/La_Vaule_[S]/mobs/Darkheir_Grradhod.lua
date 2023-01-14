-----------------------------------
-- Area: La Vaule [S]
--   NM: Darkheir Grradhod
-- BCNM: Plucking Wings
-- SAM/SAM
-----------------------------------
local ID = require("scripts/zones/La_Vaule_[S]/IDs")
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
    -- Spawn adds if they're dead'
    for v = mob:getID() +2, mob:getID() +4 do
        local adds = GetMobByID(v)
        if not adds:isSpawned() then
            adds:spawn()
            adds:updateEnmity(target)
        end
    end
end

function onMobWeaponSkillPrepare(mob, target)
   local tpMoves = { 609, 2202, 2263, 2264}
   --  Battle Dance, Berserker Dance, Tornado Dance, Shoulder Charge
   return tpMoves[math.random(#tpMoves)]
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
