-----------------------------------
-- Area: Jugner Forest [S]
--   ANNM
--   NM: Zmag Ognjeni Vuk
--  !addkeyitem RED_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------
function onMobSpawn(mob)
    mob:AnimationSub(1)
    mob:setLocalVar("cacophonyTime", 45)
    tpz.annm.NMMods(mob) 
end

function onMobFight(mob, target)
	local cacophonyTime = mob:getLocalVar("cacophonyTime")
	local BattleTime = mob:getBattleTime()
    mob:setDamage(70)

    -- Delay reduction based on monphase
    local moon = utils.getMoonPhase()
    local moonphase = 0
    if (moon == 'Full') then
            mob:setMod(tpz.mod.MARTIAL_ARTS, 280)
        mob:addMod(tpz.mod.EVA, 60)
    elseif (moon == 'Gibbeus') then
        mob:setMod(tpz.mod.MARTIAL_ARTS, 200)
        mob:addMod(tpz.mod.EVA, 30)
    elseif (moon == 'Quarter') then
            mob:setMod(tpz.mod.MARTIAL_ARTS, 150)
    elseif (moon == 'Cresecent') then
        mob:setMod(tpz.mod.MARTIAL_ARTS, 70)
        mob:addMod(tpz.mod.EVA, -30)
    elseif (moon == 'New') then
        mob:setMod(tpz.mod.MARTIAL_ARTS, 20)
        mob:addMod(tpz.mod.EVA, -60)
    end

    -- Uses Cacophony and resummons all adds every 45s
    if BattleTime >= cacophonyTime then
        mob:useMobAbility(2177) -- Cacophony
        mob:setLocalVar("cacophonyTime", BattleTime + 45)
	end
    --tpz.annm.PetShield(mob, 17113470, 17113475)
    mob:setUnkillable(false)
end

function onMobWeaponSkill(target, mob, skill)
    -- When he uses a TP move, wakes up nearby adds and forces to use a TP move as well
    if skill:getID() > 0 then 
        for i = 17113470, 17113475 do
            local gnole = GetMobByID(i)
            if gnole:checkDistance(mob) <= 30 and gnole:isAlive() then
                gnole:wakeUp()
                GetMobByID(i):addTP(3000)
            end
        end
    end
    -- Cacophony resummons all adds 
    if skill:getID() == 2177 then
        for i = 17113470, 17113475 do
            local pet = GetMobByID(i)
            if not pet:isSpawned() then
                pet:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
                pet:spawn()
                pet:updateEnmity(mob:getTarget())
            end
        end
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    for v = 17113470, 17113475, 1 do
        DespawnMob(v)
    end
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
