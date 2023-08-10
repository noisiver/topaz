------------------------------
-- Area: Alzadaal Undersea Ruins
--  ZNM: Cheese Hoarder Gigiroon
-- Dropped by Cheese Hoarder when he runs around
------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------

function onMobSpawn(mob)
     mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
     mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
     mob:setMobMod(tpz.mobMod.GIL_MIN, 0)
     mob:setMobMod(tpz.mobMod.GIL_MAX, 0)
	 mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
     mob:setStatus(tpz.status.INVISIBLE)
	 mob:SetAutoAttackEnabled(false)
end

function onMobFight(mob, target)
    local nearbyPlayers = mob:getPlayersInRange(5)
    if nearbyPlayers == nil then return end
    if nearbyPlayers then
        mob:setStatus(tpz.status.UPDATE)
	    mob:useMobAbility(1838) -- mine_blast
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end
