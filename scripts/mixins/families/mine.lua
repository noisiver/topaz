require("scripts/globals/mixins")
require("scripts/globals/status")
-----------------------------------

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}


g_mixins.families.mine = function(mob)
    mob:addListener("SPAWN", "MINE_SPAWN", function(mob)
        mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
        mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
        mob:setMobMod(tpz.mobMod.GIL_MIN, 0)
        mob:setMobMod(tpz.mobMod.GIL_MAX, 0)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
        mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
        mob:SetAutoAttackEnabled(false)
        mob:hideName(true)
        mob:untargetable(true)
        mob:hideHP(true)
    end)

    mob:addListener("ROAM_TICK", "MINE_LAYER_RTICK", function(mob)
        mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
        mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
        mob:setMobMod(tpz.mobMod.GIL_MIN, 0)
        mob:setMobMod(tpz.mobMod.GIL_MAX, 0)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
        mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
        mob:SetAutoAttackEnabled(false)
        mob:hideName(true)
        mob:untargetable(true)
        mob:hideHP(true)
    end)


    mob:addListener("COMBAT_TICK", "MINE_CTICK", function(mob)
        local nearbyPlayers = mob:getPlayersInRange(5)
        if nearbyPlayers == nil then return end
        if nearbyPlayers then
	        mob:useMobAbility(1838) -- mine_blast
        end
    end)
end

return g_mixins.families.mine