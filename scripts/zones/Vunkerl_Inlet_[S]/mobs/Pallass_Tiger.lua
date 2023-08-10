-----------------------------------
-- Area: Vunkerl Inlet [S]
--   Mob: Pallas's Tiger
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(tpz.mod.REFRESH, 400)
end

function onMobFight(mob, target)
	local Pallas = GetMobByID(17117250)
	mob:setMobMod(tpz.mobMod.SHARE_TARGET, Pallas)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
