-----------------------------------
-- Area: The Shrine of Ru'Avitau
--   NM: Mother Globe
-- TODO: Looked like pets had an additional effect: stun with an unknown proc rate
-- TODO: "Links with Slave Globes, and Slave Globes link with Defenders. Defenders do not link with Slave Globes or Mother Globe."
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/pathfind")
-----------------------------------

local path =
{
    859, -99, -539,
    874, -99, -551,
    888, -99, -569,
    887, -99, -594,
    872, -99, -611,
    860, -99, -620,
    844, -99, -609,
    832, -99, -591,
    831, -99, -567,
    847, -99, -550,
    860, -99, -554,
    860, -99, -568,
    859, -99, -596,
    882, -99, -599,
    877, -99, -580,
    839, -99, -580,
    839, -99, -558,
    859, -99, -539,
}

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMod(tpz.mod.REFRESH, 300)
	mob:addStatusEffect(tpz.effect.SHOCK_SPIKES, 65, 0, 60)
	if mob:hasStatusEffect(tpz.effect.SHOCK_SPIKES) == false then
		mob:addStatusEffect(tpz.effect.SHOCK_SPIKES, 65, 0, 60)
	end
	
    local Slave = GetMobByID(17506397)
    local SlaveTwo = GetMobByID(17506398)
    local SlaveThree = GetMobByID(17506399)
    local SlaveFour = GetMobByID(17506400)
    local SlaveFive = GetMobByID(17506401)
    local SlaveSix = GetMobByID(17506402)
    local X = mob:getXPos()
    local Y = mob:getYPos()
    local Z = mob:getZPos()
	Guard:spawn()
	GuardTwo:spawn()
	GuardThree:spawn()
	GuardFour:spawn()
	GuardFive:spawn()
	GuardSix:spawn()
	Slave:setPos(X, Y, Z)
	Slave:setSpawn(X, Y, Z)
	SlaveTwo:setPos(X, Y, Z)
	SlaveTwo:setSpawn(X, Y, Z)
	SlaveThree:setPos(X, Y, Z)
	SlaveThree:setSpawn(X, Y, Z)
	SlaveFour:setPos(X, Y, Z)
	SlaveFour:setSpawn(X, Y, Z)
	SlaveFive:setPos(X, Y, Z)
	SlaveFive:setSpawn(X, Y, Z)
	SlaveSix:setPos(X, Y, Z)
	SlaveSix:setSpawn(X, Y, Z)
    onMobRoam(mob)
end

function onMonsterMagicPrepare(mob, target)
	rnd = math.random()

    if (rnd < 0.5) then
        return 196 -- thundaga III
    elseif (rnd < 0.7) then
        return 167 -- thunder IV
    elseif (rnd < 0.9) then
        return 212 -- burst
    else
        return 239 -- shock
    end

end

function onPath(mob)
    tpz.path.patrol(mob, path)
end

function onMobRoam(mob)
	if mob:hasStatusEffect(tpz.effect.SHOCK_SPIKES) == false then
		mob:addStatusEffect(tpz.effect.SHOCK_SPIKES, 65, 0, 60)
	end
	
    local Slave = GetMobByID(17506397)
    local SlaveTwo = GetMobByID(17506398)
    local SlaveThree = GetMobByID(17506399)
    local SlaveFour = GetMobByID(17506400)
    local SlaveFive = GetMobByID(17506401)
    local SlaveSix = GetMobByID(17506402)
    local X = mob:getXPos()
    local Y = mob:getYPos()
    local Z = mob:getZPos()
	Guard:spawn()
	GuardTwo:spawn()
	GuardThree:spawn()
	GuardFour:spawn()
	GuardFive:spawn()
	GuardSix:spawn()
	Slave:setPos(X, Y, Z)
	Slave:setSpawn(X, Y, Z)
	SlaveTwo:setPos(X, Y, Z)
	SlaveTwo:setSpawn(X, Y, Z)
	SlaveThree:setPos(X, Y, Z)
	SlaveThree:setSpawn(X, Y, Z)
	SlaveFour:setPos(X, Y, Z)
	SlaveFour:setSpawn(X, Y, Z)
	SlaveFive:setPos(X, Y, Z)
	SlaveFive:setSpawn(X, Y, Z)
	SlaveSix:setPos(X, Y, Z)
	SlaveSix:setSpawn(X, Y, Z)

    if (mob:isFollowingPath() == false) then
        mob:pathThrough(tpz.path.first(path))
    end
end

function onMobFight(mob, target)
	if mob:hasStatusEffect(tpz.effect.SHOCK_SPIKES) == false then
		mob:addStatusEffect(tpz.effect.SHOCK_SPIKES, 65, 0, 60)
	end
	
	for i = ID.mob.MOTHER_GLOBE.SLAVE_START, ID.mob.MOTHER_GLOBE.SLAVE_END do
		local pet = GetMobByID(i)
		if not pet:isSpawned() then
			pet:setSpawn(mob:getXPos() + 3, mob:getYPos(), mob:getZPos() + 3)
			pet:spawn()
			pet:updateEnmity(target)
			return
		end
	end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENTHUNDER)
end

function onMobDeath(mob, player, isKiller)
    mob:setRespawnTime(math.random(10800, 21600)) -- respawn 3-6 hrs

    for i = ID.mob.MOTHER_GLOBE.SLAVE_START, ID.mob.MOTHER_GLOBE.SLAVE_END do
        local pet = GetMobByID(i)
        if pet:isSpawned() then
            DespawnMob(i)
        end
    end
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(10800, 21600)) -- 3 to 6 hours
end
