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
	mob:setMobMod(tpz.mobMod.SOUND_RANGE, 50)
    mob:setLocalVar("HeadbuttCheck", 0)
    mob:setLocalVar("PetalTime", os.time() + 45)
    tpz.annm.NMMods(mob) 
end

function onMobRoam(mob)
	local RunAroundTime = mob:getLocalVar("RunAroundTime")
    local HeadbuttCheck = mob:getLocalVar("HeadbuttCheck")

	if RunAroundTime == 0 then
		return
	elseif RunAroundTime <= os.time() then
        -- Ensure he stays tagged
        local NearbyPlayers = mob:getPlayersInRange(50)
        if NearbyPlayers == nil then return end
        if NearbyPlayers then
            for _,v in ipairs(NearbyPlayers) do
                mob:updateClaim(v)
                mob:updateEnmity(v)
            end
        end
        mob:setLocalVar("PetalTime", os.time() + math.random(45, 60))
		mob:setLocalVar("RunAroundTime",0)
		mob:delRoamFlag(512)
        tpz.annm.PetShield(mob, 17166732, 17166737)
		return
	end

	-- scripted run around
	mob:addRoamFlag(512) -- ignore attacking
	if not mob:isFollowingPath() then
		mob:disengage()
		local point = {math.random(-134,-107),-5.3588,math.random(-273,-232)}
		mob:pathThrough(point, tpz.path.flag.RUN)
	end

    -- Runs around  Headbutting anyone in range
    if os.time() >= HeadbuttCheck then
        mob:setLocalVar("HeadbuttCheck", os.time() + 5)
        local nearbyPlayers = mob:getPlayersInRange(8)
        if nearbyPlayers == nil then return end
        for _,v in ipairs(nearbyPlayers) do
            mob:useMobAbility(300, v) -- Headbutt
            break
        end
    end
end

function onMobFight(mob, target)
	local PetalTime = mob:getLocalVar("PetalTime")
	local RunAroundTime = mob:getLocalVar("RunAroundTime")
	local BattleTime = mob:getBattleTime()

    mob:setDamage(70)

     -- Uses Petal Pirouette then runs around and headbutts anyone in range
    if (os.time() >= PetalTime and mob:actionQueueEmpty()) then
		mob:useMobAbility(2210) -- Petal Pirouette
		mob:setLocalVar("HeadbuttCheck", os.time() + 8)
        mob:setLocalVar("PetalTime", os.time() + 45)
	end

	if RunAroundTime == 0 then
		return
	elseif RunAroundTime <= os.time() then
		mob:setLocalVar("RunAroundTime",0)
		mob:delRoamFlag(512)
		return
	end
    -- Run around after using Headbutt
	mob:addRoamFlag(512) -- ignore attacking
	if not mob:isFollowingPath() then
		mob:disengage()
		local point = {math.random(-134,-107),-5.3588,math.random(-273,-232)}
		mob:pathThrough(point, tpz.path.flag.RUN)
	end
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 2210 then -- Petal Pirouette
        mob:setUnkillable(true) -- Can't die while running around to ensure chest pops
        mob:setLocalVar("RunAroundTime", os.time() + math.random(30, 45))
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
