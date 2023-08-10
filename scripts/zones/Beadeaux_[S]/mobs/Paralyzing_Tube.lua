-----------------------------------
-- Area: La Vaule [S]
--   NM: Paralyzing Tube
-- Runs towards a random target and uses a TP move then despawns.
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:SetAutoAttackEnabled(false)
    mob:setUnkillable(true)
end

function onMobFight(mob, target)
    local nearbyplayerCheck = mob:getLocalVar("nearbyplayerCheck")
    if os.time() >= nearbyplayerCheck then
        mob:setLocalVar("nearbyplayerCheck", os.time() + 3)
        local nearbyPlayers = mob:getPlayersInRange(5)
        if nearbyPlayers == nil then return end
        if nearbyPlayers then
	        mob:useMobAbility(2235) -- Paralyzing Blast
        end
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end
