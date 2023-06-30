-----------------------------------
-- Sea Creature helpers
-----------------------------------
tpz = tpz or {}
tpz.sea_creatures = tpz.sea_creatures or {}

tpz.sea_creatures.checkSpawns = function(ID, percentChance, total)
    if tpz.sea_creatures.shouldSpawn(ID, percentChance, total) then
        local mobIdPos = math.random(1, #ID.mob.SEA_CREATURES)
        local mob = GetMobByID(ID.mob.SEA_CREATURES[mobIdPos])
        if not mob:isSpawned() then
            mob:spawn()
            mob:setLocalVar("despawnTime", os.time() + math.random(180, 240)) -- 3-4 mins despawn if roaming
        end
    end
    for i = 1, #ID.mob.SEA_CREATURES do
        local mobId = ID.mob.SEA_CREATURES[i]
        local mob = GetMobByID(mobId)
        if mob:isSpawned() and os.time() > mob:getLocalVar("despawnTime") and GetMobAction(mobId) == tpz.act.ROAMING then
            DespawnMob(mobId)
        end
    end
end

tpz.sea_creatures.despawn = function(ID)
    for i = 1, #ID.mob.SEA_CREATURES do
        local mobId = ID.mob.SEA_CREATURES[i]
        DespawnMob(mobId)
    end
end

tpz.sea_creatures.shouldSpawn = function(ID, percentChance, total)
    
    if math.random(1, 100) > percentChance then
        return false
    end
    
    local count = 0
    for i = 1, #ID.mob.SEA_CREATURES do
        local mobId = ID.mob.SEA_CREATURES[i]
        if GetMobByID(mobId):isSpawned() then
            count = count + 1
            if count == total then
                return false
            end
        end
    end

    return true
end