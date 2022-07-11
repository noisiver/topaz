-----------------------------------
-- Area: Jugner Forest [S]
--   ANNM
--   NM: Zmag Ognjeni Vuk
--  !addkeyitem RED_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:AnimationSub(1)
    mob:setLocalVar("DischargeTime", 45)
    tpz.annm.NMMods(mob) 
end

function onMobFight(mob, target)
	local DischargeTime = mob:getLocalVar("DischargeTime")
	local BattleTime = mob:getBattleTime()
    -- Uses Cacophony and resummons all adds every 45s
    if BattleTime >= DischargeTime then
        mob:useMobAbility(2177) -- Cacophony
        mob:setLocalVar("DischargeTime", BattleTime + 45)
	end
    --tpz.annm.PetShield(mob, 17113470, 17113475)
    mob:setUnkillable(false)
end

function onMobWeaponSkill(target, mob, skill)
    -- When he uses a TP move, all adds do as well
    if skill:getID() > 0 then 
        for i = 17113470, 17113475 do
            GetMobByID(i):addTP(3000)
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

function onMobDeath(mob, player, isKiller)
    for v = 17113470, 17113475, 1 do
        DespawnMob(v)
    end
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
