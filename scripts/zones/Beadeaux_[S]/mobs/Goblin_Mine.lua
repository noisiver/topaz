-- 250 fire damage
-- 15 yard radius on explosion-- MNK/MNK
-- Immune to Paralyze, Sleep, Bind, Gravity, Break
-- Only kicks, always twice in a row, up to three times in a row
-- Can Guard
-- Uses Dragon Kick, Aegis schism, Barbed Crescent(all fomor moves?). Greatly favors Dragon Kick.
-- Used 100 fists at 55% HP.
-----------------------------------
-- Area: Beadeaux [S]
--   Goblin Mine
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 0)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 0)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
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

function onMobDeath(mob, player, isKiller, noKiller)
end
