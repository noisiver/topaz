-----------------------------------
-- Area: The Celestial Nexus
--  Mob: Eald'narche (Phase 2)
-- Zilart Mission 16 BCNM Fight
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onMobInitialize(mob)
    -- 60% fast cast, -75% physical damage taken, 10tp/tick regain, no standback
    mob:addMod(tpz.mod.UFASTCAST, 60)
    mob:addMod(tpz.mod.UDMGPHYS, -75)
    mob:addMod(tpz.mod.UDMGRANGE, -75)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.GA_CHANCE, 25)
    if GetMobByID(mob:getID() - 1):isDead() and GetMobByID(mob:getID() - 2):isDead() then
        mob:getBattlefield():setLocalVar("phaseChange", 0)
    end
end

function onMobFight(mob, target)
	mob:setMod(tpz.mod.REGAIN, 100)
    local battletime = mob:getBattleTime()
    local WarpTime = mob:getLocalVar("WarpTime")
    if WarpTime == 0 then
        mob:setLocalVar("WarpTime", math.random(15, 20))
	elseif battletime >= WarpTime then
        -- Keep TP when warping out
    	local CurrentTP = mob:getTP()
	    mob:setLocalVar("TP", CurrentTP)
		mob:useMobAbility(989) -- Warp out
		mob:setLocalVar("WarpTime", battletime + math.random(15, 20))
	end
end


function onMobDeath(mob, player, isKiller, noKiller)
end
