-----------------------------------
-- Area: Beadeaux [S]
--   NM: Ba'Tho Mercifulheart
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
    mob:setDamage(200)
    mob:setMod(tpz.mod.ACC, 400)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 50)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 50)
end

function onMobWeaponSkillPrepare(mob, target)
   local tpMoves = { 1076, 2223, 2225, 2234}
   --  Head Butt, Ore Toss, Shell Bash, Ore Lob

   return tpMoves[math.random(#tpMoves)]
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end