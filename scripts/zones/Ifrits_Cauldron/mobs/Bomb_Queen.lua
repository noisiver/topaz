-----------------------------------
-- Area: Ifrit's Cauldron
--   NM: Bomb Queen
-----------------------------------
local ID = require("scripts/zones/Ifrits_Cauldron/IDs")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobSpawn(mob)
	mob:setDamage(145)
	mob:setMod(tpz.mod.ATTP, 10)
	mob:setMod(tpz.mod.DEF, 640)
	mob:setMod(tpz.mod.EVA, 337)
    mob:setMod(tpz.mod.MDEF, 12) 
    mob:setMobMod(tpz.mobMod.GIL_MIN, 18000)
end

function onMobEngaged(mob,target)
    mob:setLocalVar("spawn_time", os.time() + 15)
end

function onMobFight(mob,target)
    local battleTime = mob:getBattleTime()

    if os.time() >= mob:getLocalVar("spawn_time") then
        mob:setLocalVar("spawn_time", os.time() + 30)
        local mobId = mob:getID()
        local canSpawnPet = false
        for id = mobId + 1, mobId + 5 do
            if (GetMobAction(id) == 0) then
                canSpawnPet = true
                break
            end
        end
        if canSpawnPet then
            mob:entityAnimationPacket("casm")
            mob:timer(5000, function(mob)
                if mob:isDead() then
                    return
                end
                mob:entityAnimationPacket("shsm")
                local mobId = mob:getID()

                -- Pick a random Princes and Princesses
                petId = 0
                offset = math.random(4)
                for i = 0, 3 do
                    id = mobId + 1 + (offset + i) % 4
                    if GetMobAction(id) == 0 then
                        petId = id
                        break
                    end
                end
                -- If no Princes or Princesses remain then try the Bastard
                if petId == 0 then
                    petId = mobId + 5
                    if GetMobAction(petId) ~= 0 then
                        return
                    end
                end

                local pet = GetMobByID(petId)
                pet:setSpawn(mob:getXPos()-0.5, mob:getYPos(), mob:getZPos(), mob:getRotPos())
                pet:spawn()
                local newtarget = mob:getTarget()
                if newtarget then
                    pet:updateEnmity(newtarget)
                end
            end)
        end
    end
end


function onMobDeath(mob, player, isKiller, noKiller)
    -- pets die with queen
    if isKiller then
        local mobId = mob:getID()
        for i = mobId + 1, mobId + 5 do
            local pet = GetMobByID(i)
            if pet:isAlive() then
                pet:setHP(0)
            end
        end
    end
end
