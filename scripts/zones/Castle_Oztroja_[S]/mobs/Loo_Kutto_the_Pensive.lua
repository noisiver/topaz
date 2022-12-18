-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Loo Kutto the Pensive
-- SAM/SAM
-- Immune to Sleep, Bind, Gravity, Break
-- TP Move Timer:  1:34 - > 1:41 - > 1:54 - > 02:05 - > 02:18 - > 02:30 - > 02:54 - > 02:59 - > 03:18 - > 03:27 - > 03:42
-- TP Move timer reduces to 5s at 49% HP
-- Uses Sweep, Feathered Furore, Double Kick, Feather Storm. Can use Meikyo Shisui starting at 49%
-- Used Mekiyo Shisui at 55%
-- Uses Dark Invocation x3 during Meikyio Shisui
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
end

function onMobFight(mob, target)
    local hp = mob:getHPP()

    -- Uses TP moves every 10 seconds at 50-100% HP, then every 5 seconds below 50.
    if (hp < 25) then
        mob:setMod(tpz.mod.REGAIN, 200)
    elseif (hp < 50) then
        mob:setMod(tpz.mod.REGAIN, 600)
    else
        mob:setMod(tpz.mod.REGAIN, 300)
    end
end

function onMobWeaponSkillPrepare(mob, target)
   local tpMoves = {617, 618, 620, 2205}
   --  Feather Storm, Double Kick, Sweep, Feathered Furore

   -- Uses Dark Invocation x3 during Meikyio Shisui
   if mob:hasStatusEffect(tpz.effect.MEIKYO_SHISUI) then
        return 2206
   else
      return tpMoves[math.random(#tpMoves)]
   end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(7200) -- 2 hours
end
