-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Duu Nazo the Spryfooted
-- Suu Xicu's pets
-- MNK/MNK
-- Gain hidden regen effect for ~1m from Paeon from Suu Xicu
-- 521 dmg did 23% HP
-- Immune to Sleep, Bind, Break
-- Uses: Featherstorm, Sweep, Feathered Furore 
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobWeaponSkillPrepare(mob, target)
   local tpMoves = {617, 620, 2205}
   --  Feather Storm, Sweep, Feathered Furore
   return tpMoves[math.random(#tpMoves)]
end

function onMobDeath(mob, player, isKiller)
end
