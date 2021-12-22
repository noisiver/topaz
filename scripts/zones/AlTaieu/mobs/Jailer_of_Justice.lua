-----------------------------------
-- Area: Al'Taieu
--  NM:  Jailer of Justice
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
    mob:setMod(tpz.mod.SUSC_TO_WS_STUN,1)
end

function onMobSpawn(mob)
    mob:setDamage(175)
    mob:setMod(tpz.mod.ATT, 600)
    mob:setMod(tpz.mod.DEF, 565)
    mob:setMod(tpz.mod.EVA, 371) 
    mob:setMod(tpz.mod.REFRESH, 50)
end

function onMobEngaged(mob)
    local now = os.time()
    mob:setLocalVar("next", now + 30)
    mob:setLocalVar("charm", now + math.random(150, 210))
end

function onMobFight(mob, target)
    local now = os.time()
    local next = mob:getLocalVar("next")
    local charm = mob:getLocalVar("charm")

    if now > charm then
        mob:useMobAbility(710)
        mob:setLocalVar("charm", now + math.random(150, 210))
    end

    if now > next then
        local offset = mob:getID()
        for petid = offset + 1, offset + 6 do
            if not GetMobByID(petid):isSpawned() then
                mob:setLocalVar("spawn", petid)
                break
            end

            if petid == offset + 6 then
                mob:setLocalVar("spawn", 0)
                mob:setLocalVar("next", now + 30)
            end
        end

        if mob:getLocalVar("spawn") > 0 then
            mob:setLocalVar("next", now + 35) -- 5 seconds extra for summon time

            local pet = GetMobByID(petid)
            mob:entityAnimationPacket("casm")
            mob:timer(5000, function(mob)
                if mob:isDead() then return; end

                mob:entityAnimationPacket("shsm")
                local pos = mob:getPos()
                local petid = mob:getLocalVar("spawn")
                local pet = GetMobByID(petid)
                pet:setSpawn(pos.x - 1, pos.y, pos.z - 1)
                SpawnMob(petid, 300)

                local targ = mob:getTarget()
                if targ then
                    pet:updateEnmity(targ)
                    -- at random reset JoJ hate on target when a pet is summoned
                    if math.random(1, 3) == 1 then mob:resetEnmity(targ); end
                end
            end)
        end
    end
end

function onMobDeath(mob, player, isKiller, firstCall)
    if firstCall then
        local mobid = mob:getID()
        for i = 1, 6 do DespawnMob(mobid + i) end
    end
end 

function onMobDespawn(mob)
    local mobid = mob:getID()
    for i = 1, 6 do DespawnMob(mobid + i) end
end
