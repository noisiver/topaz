-----------------------------------
-- Area: La Vaule [S]
--   Bloodcrown Brradhod
--   BCNM: The Bloodbathed Crown
-----------------------------------
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
    -- Force adds to link when aggrod
    for v = mob:getID() +1, mob:getID() +4 do
        GetMobByID(v):updateEnmity(target)
    end
end


function onMobWeaponSkillPrepare(mob, target)
   local tpMoves = {617, 618, 619, 2205}
   --  Feather Storm, Double Kick, Parry, Feathered Furore
   return tpMoves[math.random(#tpMoves)]
end

function onMobDeath(mob, player, isKiller, noKiller)
end