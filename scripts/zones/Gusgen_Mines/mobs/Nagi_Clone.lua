------------------------------
-- Area: Gusgen Mines
--   Nagi Clone
------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------
function onMobSpawn(mob)
    mob:setDamage(20)
	mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
	mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
	mob:SetMagicCastingEnabled(false)
end

function onMobDeath(mob, player, isKiller, noKiller)
  end