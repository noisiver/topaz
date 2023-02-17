-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Zhuu Buxu the Silent
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
end

function onMobWeaponSkillPrepare(mob, target)
   local tpMoves = {617, 618, 619, 2205}
   --  Feather Storm, Double Kick, Parry, Feathered Furore
   return tpMoves[math.random(#tpMoves)]
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end