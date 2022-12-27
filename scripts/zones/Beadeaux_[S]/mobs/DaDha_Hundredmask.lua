-----------------------------------
-- Area: Beadeaux [S] (92)
--   NM: Da'Dha Hundredmask
-- !pos -89.901 .225 -159.694 92
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.ACC, 400)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 50)
end

function onMobWeaponSkillPrepare(mob, target)
   local tpMoves = { 611, 612, 613, 614, 1079}
   -- Ore Toss, Head Butt, Shell Bash, Shell Guard, Howl

   return tpMoves[math.random(#tpMoves)]
end

function onMobDeath(mob, player, isKiller)
end
