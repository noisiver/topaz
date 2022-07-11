-----------------------------------
-- Area: West Sarutabaruta [S]
--   ANNM
--   NM: Cosmos Cocora
--  !addkeyitem GREEN_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
require("scripts/globals/pathfind")
-----------------------------------
function onMobSpawn(mob)
    mob:setLocalVar("PetalTime", 45)
    tpz.annm.NMMods(mob) 
end

function onMobRoam(mob)
	local RunAroundTime = mob:getLocalVar("RunAroundTime")
	if RunAroundTime == 0 then
		return
	elseif RunAroundTime < os.time() then
		mob:setLocalVar("RunAroundTime",0)
		mob:delRoamFlag(512)
		return
	end
    -- Ensure he stays tagged
    local NearbyPlayers = mob:getPlayersInRange(50)
        if NearbyPlayers == nil then return end
        if NearbyPlayers then
            for _,v in ipairs(NearbyPlayers) do
                mob:updateClaim(v)
            end
        end
	
	-- scripted run around
	mob:addRoamFlag(512) -- ignore attacking
	if not mob:isFollowingPath() then
        if mob:getHPP() >= 5 then
		    mob:disengage()
        end
		local point = {math.random(485, 508),-2.742,math.random(173,182)}
		mob:pathThrough(point, tpz.path.flag.RUN)
	end
end

function onMobFight(mob, target)
	local PetalTime = mob:getLocalVar("PetalTime")
	local RunAroundTime = mob:getLocalVar("RunAroundTime")
	local BattleTime = mob:getBattleTime()

    -- Uses Petal Pirouette then runs around and headbutts anyone in range

    -- Petal Pirouette use timer
    if (BattleTime >= PetalTime and WingWhirlTime == 0 and mob:hasStatusEffect(tpz.effect.HUNDRED_FISTS) == false
    and mob:actionQueueEmpty()) then
		mob:useMobAbility(2210) -- Petal Pirouette
		mob:setLocalVar("PetalTime", BattleTime + math.random(90, 120))
	end

	local HeadbuttCheck = mob:getLocalVar("HeadbuttCheck")
	local BattleTime = mob:getBattleTime()

    if BattleTime >= HeadbuttCheck then
        mob:setLocalVar("HeadbuttCheck", BattleTime + 3)
        local nearbyPlayers = mob:getPlayersInRange(30)
        if nearbyPlayers == nil then return end
        for _,v in ipairs(nearbyPlayers) do
            mob:useMobAbility(300, v) -- Headbutt
        end
    end

	if RunAroundTime == 0 then
		return
	elseif RunAroundTime < os.time() then
		mob:setLocalVar("RunAroundTime",0)
		mob:delRoamFlag(512)
		return
	end
    -- Run around after using Yawn
	mob:addRoamFlag(512) -- ignore attacking
	if not mob:isFollowingPath() then
		mob:disengage()
		local point = {math.random(485,508),-2.742,math.random(173,182)}
		mob:pathThrough(point, tpz.path.flag.RUN)
	end
    tpz.annm.PetShield(mob, 17166732, 17166737)
end

function onMobDeath(mob, player, isKiller)
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
