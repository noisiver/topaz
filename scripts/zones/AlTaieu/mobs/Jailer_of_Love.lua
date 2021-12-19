-----------------------------------
-- Area: Al'Taieu
--   NM: Jailer of Love
-- !pos 431.522 -0.912 -603.503 33
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
require("scripts/globals/status")
-----------------------------------

local spellList =
{
    { 147, 176 }, -- Fire IV, Firaga III
    { 162, 191, 357, 365 }, -- Stone IV, Stonega III, Slowga, Breakga
    { 172, 201, 226 }, -- Water IV, Waterga III, Poisonga II
    { 157, 186, 359, 366 }, -- Aero IV, Aeroga III, Silencga, Graviga
    { 152, 181, 356, 362 }, -- Blizzard IV, Blizzaga III, Bindga, Paralyga
    { 167, 196 }, -- Thunder IV, Thundaga III
    { 232, 274, 360, 361 }, -- Bio III, Sleepga II, Blindga, Dispelga
    { 21, 30, 35, 40 },     -- Diaga III, banishga III, Banish III, Holy
}

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
    mob:setMod(tpz.mod.SUSC_TO_WS_STUN,1)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 18)
end

function onMobSpawn(mob)
	mob:setDamage(280)
    mob:addMod(tpz.mod.DEFP, 100) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:setMod(tpz.mod.REFRESH, 50)
    mob:setMod(tpz.mod.UDMGMAGIC, -58)
    mob:setMod(tpz.mod.REGAIN, 75)
    mob:setMod(tpz.mod.REGEN, 250)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 28)
    mob:setLocalVar("element",math.random(1,8))
    mob:setMod(tpz.mod.FIRE_ABSORB + mob:getLocalVar("element") - 1, 100)
    mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.STANDBACK))
    mob:setMobMod(tpz.mobMod.STANDBACK_RANGE, 13)
    mob:setLocalVar("af1", 1)
    mob:setLocalVar("af2", 1)
    mob:setLocalVar("af3", 1)
end

function onMobRoam(mob)
    mob:untargetable(false)
end

function onMobEngaged(mob, target)
    mob:setLocalVar("pop_pets", os.time() + 150)
    mob:setLocalVar("shift", os.time() + math.random(120, 180))
    mob:hideName(false)
    mob:untargetable(false)
end

function onMonsterMagicPrepare(mob, target)
    local elementalList = spellList[mob:getLocalVar("element")]
    return elementalList[math.random(1, #elementalList)]
end

function onMobFight(mob, target, pet)
    local now = os.time()

    -- reduce regen after nine Xzomits and Hpemdes are killed
    if mob:getLocalVar("JoL_Regen_Reduction") == 0 and mob:getLocalVar("JoL_Qn_xzomit_Killed") >= 9 and mob:getLocalVar("JoL_Qn_hpemde_Killed") >= 9 then
        mob:setLocalVar("JoL_Regen_Reduction", 1)
        mob:setMod(tpz.mod.REGEN, 50)
    end


    -- spawn minions in 2.5 minute intervals
    if mob:getCurrentAction() ~= tpz.action.MAGIC_CASTING and now > mob:getLocalVar("pop_pets") then
        mob:stun(3000)
        mob:entityAnimationPacket("casm")
        mob:setLocalVar("pop_pets", os.time() + 150)
        mob:timer(3000, function(mob)
            if mob:isDead() then return; end

            local minionGroup =
            {
                [0] = 10, -- Qnxzomit
                [1] = 19, -- Qnhpemde
                [2] =  1, -- Ruphuabo
                [3] = 13, -- Qnxzomit
                [4] = 22, -- Qnhpemde
                [5] =  4, -- Ruphuabo
                [6] = 16, -- Qnxzomit
                [7] = 25, -- Qnhpemde
            }

            mob:entityAnimationPacket("shsm")
            local pos = mob:getPos()
            local spawns = mob:getLocalVar("SPAWNS")
            local mobid = mob:getID()
            local target = mob:getTarget()
            if spawns < 8 then
                local minionOffset = mobid + minionGroup[spawns]
                local pet1 = GetMobByID(minionOffset + 0)
                pet1:setSpawn(pos.x, pos.y - 1, pos.z)
                pet1:spawn()
                if target then pet1:updateEnmity(target); end
                local pet2 = GetMobByID(minionOffset + 1)
                pet2:setSpawn(pos.x, pos.y - 2, pos.z)
                pet2:spawn()
                if target then pet2:updateEnmity(target); end
                local pet3 = GetMobByID(minionOffset + 2)
                pet3:setSpawn(pos.x, pos.y - 3, pos.z)
                pet3:spawn()
                if target then pet3:updateEnmity(target); end
                mob:setLocalVar("SPAWNS", spawns + 1)
                if mob:getHPP() >= 51 and mob:getHPP() <= 75 then 
                    if (pet1:isAlive() or pet2:isAlive() or pet3:isAlive()) and mob:getLocalVar("af1") == 1 then
                        mob:useMobAbility(604)
                        mob:setLocalVar("af1", 0)
                    end
                elseif mob:getHPP() >= 26 and mob:getHPP() <= 50 then
                    if (pet1:isAlive() or pet2:isAlive() or pet3:isAlive()) and mob:getLocalVar("af2") == 1 then
                        mob:useMobAbility(604)
                        mob:setLocalVar("af2", 0)
                    end
                elseif mob:getHPP() >= 1 and mob:getHPP() <= 25 then
                    if (pet1:isAlive() or pet2:isAlive() or pet3:isAlive()) and mob:getLocalVar("af3") == 1 then
                        mob:useMobAbility(604)
                        mob:setLocalVar("af3", 0)
                    end
                end
            else
                -- determine which sharks are currently spawned
                local phuaboUp = {}
                local phuaboDn = {}
                for i = mobid + 1, mobid + 9 do
                    local phuabo = GetMobByID(i)
                    if phuabo:isAlive() then
                        table.insert(phuaboUp, i)
                    elseif not phuabo:isSpawned() then
                        table.insert(phuaboDn, i)
                    end
                end

                -- how many sharks spawn depends on number currently alive
                -- https://www.bg-wiki.com/bg/Jailer_of_Love
                local numToSpawn = 0
                if #phuaboUp == 2 then
                    numToSpawn = 1
                elseif #phuaboUp == 0 or #phuaboUp == 3 then
                    numToSpawn = 3
                elseif #phuaboUp == 1 then
                    numToSpawn = math.random(3)
                end
                
                -- spawn sharks
                for i = 1, math.min(numToSpawn, #phuaboDn) do
                    local pet = GetMobByID(phuaboDn[i])
                    pet:setSpawn(pos.x, pos.y - 1, pos.z)
                    pet:spawn()
                    if target then pet:updateEnmity(target); end
                    if mob:getHPP() >= 51 and mob:getHPP() <= 75 then 
                        if pet:isAlive()and mob:getLocalVar("af1") == 1 then
                            mob:useMobAbility(604)
                            mob:setLocalVar("af1", 0)
                        end
                    elseif mob:getHPP() >= 26 and mob:getHPP() <= 50 then
                        if pet:isAlive() and mob:getLocalVar("af2") == 1 then
                            mob:useMobAbility(604)
                            mob:setLocalVar("af2", 0)
                        end
                    elseif mob:getHPP() >= 1 and mob:getHPP() <= 25 then
                        if pet:isAlive() and mob:getLocalVar("af3") == 1 then
                            mob:useMobAbility(604)
                            mob:setLocalVar("af3", 0)
                        end
                end
                end
                
            end
        end)
    end
   
    -- change elements
    if now > mob:getLocalVar("shift") then
        mob:useMobAbility(625)
        mob:setLocalVar("shift", os.time() + math.random(100, 160))
    end
end

function onMobDeath(mob, player, isKiller)
    if firstCall then
        -- 25% chance to spawn Absolute Virtue
        if math.random(100) <= 25 then
            local AV = SpawnMob(ID.mob.ABSOLUTE_VIRTUE, 180)
            if player then
                AV:updateClaim(player)
            end
        end
        for pet = mobid + 1, mobid + 27 do
            DespawnMob(pet)
        end
    end
end

function onMobDespawn(mob)
end