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

function spawnPetInBattle(mob, pet)
    mob:entityAnimationPacket("casm")
    mob:SetAutoAttackEnabled(false)
    mob:SetMagicCastingEnabled(false)
    mob:SetMobAbilityEnabled(false)
    mob:timer(3000, function(mob)
        mob:entityAnimationPacket("shsm")
        mob:SetAutoAttackEnabled(true)
        mob:SetMagicCastingEnabled(true)
        mob:SetMobAbilityEnabled(true)
        pet:spawn()
        pet:updateEnmity(mob:getTarget())
    end)
end


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

    local Slave = GetMobByID(17506397)
    local SlaveTwo = GetMobByID(17506398)
    local SlaveThree = GetMobByID(17506399)
    local SlaveFour = GetMobByID(17506400)
    local SlaveFive = GetMobByID(17506401)
    local SlaveSix = GetMobByID(17506402)
    local X = mob:getXPos()
    local Y = mob:getYPos()
    local Z = mob:getZPos()
	Slave:spawn()
	SlaveTwo:spawn()
	SlaveThree:spawn()
	SlaveFour:spawn()
	SlaveFive:spawn()
	SlaveSix:spawn()
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
    return 0 -- Still need a return, so use 0 when not casting
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
	Slave:spawn()
	SlaveTwo:spawn()
	SlaveThree:spawn()
	SlaveFour:spawn()
	SlaveFive:spawn()
	SlaveSix:spawn()
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
    local now = os.time()
    local slaves = mob:getLocalVar("SlavesSpawned")
    local slaveRecast = mob:getLocalVar("SlaveRecast")
	if mob:hasStatusEffect(tpz.effect.SHOCK_SPIKES) == false then
		mob:addStatusEffect(tpz.effect.SHOCK_SPIKES, 65, 0, 60)
	end
	
    if slaves > 6 then
        mob:setLocalVar("SlavesSpawned", 0)
    end

        -- Summons a single orb every 30 seconds.  Needs to be last, so other code runs.
        -- TODO: Should have a SMN casting effect for ~3-5 seconds while calling.
    if slaves < 6 and (now >= mob:getLocalVar("Initial_SlaveTimer")) then
        for i = ID.mob.MOTHER_GLOBE.SLAVE_START, ID.mob.MOTHER_GLOBE.SLAVE_END do
            local pet = GetMobByID(i)
            if not pet:isSpawned() and (now > slaveRecast + 30) then
                local pPet = nil
                local petId = pet:getID()
                switch (petId): caseof {
                    [17506397] = function() 
                        pet:setSpawn(mob:getXPos() + 1, mob:getYPos(), mob:getZPos())
                        spawnPetInBattle(mob, pet)
                    end,
                    [17506398] = function() 
                        pet:setSpawn(mob:getXPos() + 2, mob:getYPos(), mob:getZPos())
                        spawnPetInBattle(mob, pet)
                    end,
                    [17506399] = function() 
                        pet:setSpawn(mob:getXPos() + 3, mob:getYPos(), mob:getZPos())
                        spawnPetInBattle(mob, pet)
                    end,
                    [17506400] = function() 
                        pet:setSpawn(mob:getXPos() + 4, mob:getYPos(), mob:getZPos())
                        spawnPetInBattle(mob, pet)
                    end,
                    [17506401] = function() 
                        pet:setSpawn(mob:getXPos() + 5, mob:getYPos(), mob:getZPos())
                        spawnPetInBattle(mob, pet)
                    end,
                    [17506402] = function() 
                        pet:setSpawn(mob:getXPos() + 6, mob:getYPos(), mob:getZPos())
                        spawnPetInBattle(mob, pet)
                    end,
                }
                mob:setLocalVar("SlaveRecast", now)
                mob:setLocalVar("SlavesSpawned", mob:getLocalVar("SlavesSpawned") + 1)
                break
            end
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
    mob:setRespawnTime(14400) -- 4 hours
end
