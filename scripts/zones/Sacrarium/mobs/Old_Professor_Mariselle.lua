-----------------------------------
-- Area: Sacrarium
--  Mob: Old Professor Mariselle
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:setMod(tpz.mod.REGEN, 10)
    local OP_Mariselle = mob:getID();
    
    for i = OP_Mariselle, OP_Mariselle+2 do
        local m = GetMobByID(i)
        m:SetAutoAttackEnabled(true)
        m:SetMagicCastingEnabled(true)
        m:SetMobAbilityEnabled(true)
        m:SetMobSkillAttack(true)
        m:hideName(false)
        m:untargetable(false)
        m:entityAnimationPacket("deru")
    end
end

function onMobEngaged(mob)
    mob:setLocalVar("teleport", os.time() + math.random(20, 30))
    mob:setLocalVar("spawntime", os.time() + 10)
end    

function onMobFight(mob,target)
    local OP_Mariselle = mob:getID();

    if mob:getLocalVar("teleport") < os.time() then
        mob:setLocalVar("teleport", os.time() + math.random(20, 30))
        TeleportMob(mob, 5000)
        for i = OP_Mariselle+1, OP_Mariselle+2 do
            local m = GetMobByID(i)
            if m:isSpawned() then
                m:timer(1500, function(mob)
                    TeleportMob(mob, 7500)
                end)
            end
        end
		local battletarget = mob:getTarget()
		local t = battletarget:getPos()
		t.rot = battletarget:getRotPos()
		local angle = math.random() * math.pi
		local pos = NearLocation(t, 15, angle)
		mob:teleport(pos, battletarget)
    end
    
    -- Summons a pupil every 10 seconds.
    local spawnTime = mob:getLocalVar("spawntime")
    if os.time() > spawnTime and mob:actionQueueEmpty() then
        mob:setLocalVar("spawntime", os.time() + 10)
        for i = OP_Mariselle+1, OP_Mariselle+2 do
            local m = GetMobByID(i)
            if not m:isSpawned() then
                mob:entityAnimationPacket("casm")
                mob:timer(1000, function(mob)
                    if mob:isDead() then
                        return
                    end

                    mob:entityAnimationPacket("shsm")
                    m:spawn()
                    m:updateEnmity(mob:getTarget())
                    local pos = mob:getPos()
                    m:setPos(pos.x + 1, pos.y, pos.z + 1)
                end)
                return;
            end
        end
    end

end;

function onMonsterMagicPrepare(mob, target)
    rnd = math.random()

    if (rnd < 0.5) then
        return 274 -- Sleepga II
    else
        return 59 -- silence
    end

end

function onMobDeath(mob, player, isKiller)

    local OP_Mariselle = mob:getID()

    for i = OP_Mariselle+1, OP_Mariselle+2 do
        local m = GetMobByID(i)
        if m:isSpawned() then
            DespawnMob(i)
        end
    end

    if (player:getCurrentMission(COP) == tpz.mission.id.cop.THE_SECRETS_OF_WORSHIP and player:getCharVar("PromathiaStatus") == 3 and  player:hasKeyItem(tpz.ki.RELIQUIARIUM_KEY)==false) then
        player:setCharVar("PromathiaStatus", 4)
    end

    -- Set random variable for determining Old Prof. Mariselle's next spawn location
    local rand = math.random((2), (7))
    SetServerVariable("Old_Prof_Spawn_Location", rand)

end

function onMobDespawn( mob )

    local OP_Mariselle = mob:getID()

    for i = OP_Mariselle+1, OP_Mariselle+2 do
        local m = GetMobByID(i)
        if m:isSpawned() then
            DespawnMob(i)
        end
    end

    -- Set random variable for determining Old Prof. Mariselle's next spawn location
    local rand = math.random((2), (7))
    SetServerVariable("Old_Prof_Spawn_Location", rand)

end
