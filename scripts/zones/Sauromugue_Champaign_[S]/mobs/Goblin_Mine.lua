------------------------------
-- Area: Sauromugue Champaign [S]
-- Mob: Goblin Mine
-- Dropped by Goblin Toxophile when roaming
-- Blows up in AOE if anyone steps on it
------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/families/mine")}
------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 0)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 0)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:SetAutoAttackEnabled(false)
end

function onMobFight(mob, target)
    local nearbyplayerCheck = mob:getLocalVar("nearbyplayerCheck")
    if os.time() >= nearbyplayerCheck then
        mob:setLocalVar("nearbyplayerCheck", os.time() + 3)
        local nearbyPlayers = mob:getPlayersInRange(5)
        if nearbyPlayers == nil then return end
        if nearbyPlayers then
	        mob:useMobAbility(2366) -- mine_blast
        end
    end
end

function onMobDeath(mob, player, isKiller)
end