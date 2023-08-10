------------------------------
-- Area: Boneyard Gully
--   NM: Gwyn Ap Knudd
--  ENM: Totentanz
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/mobs")
------------------------------
function onMobSpawn(mob)
    mob:setDamage(145)
    mob:setMod(tpz.mod.ATTP, 25)
    mob:setMod(tpz.mod.DEFP, 10)
    mob:addMod(tpz.mod.EVA, 10)
    mob:setMod(tpz.mod.REFRESH, 300)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 25)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 25)
    mob:addImmunity(tpz.immunity.SLEEP)
    mob:addImmunity(tpz.immunity.GRAVITY)
    mob:addImmunity(tpz.immunity.BIND)
    mob:addImmunity(tpz.immunity.LIGHTSLEEP)
end

function onMobFight(mob, target)
	local SummonTime = mob:getLocalVar("SummonTime")
	local BattleTime = mob:getBattleTime()
    -- Spawns an add early, then randomly during the fight
	if SummonTime == 0 then
		mob:setLocalVar("SummonTime", BattleTime + math.random(1, 15))
	elseif BattleTime >= SummonTime and mob:actionQueueEmpty() then
        local pet = GetMobByID(mob:getID() + math.random(1, 9)) -- Spawn a random add
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        if pet:isSpawned() then return end -- Reroll another spawn ID if the pet selected is already spawned
        pet:setSpawn(mob:getXPos() + math.random(3, 6), mob:getYPos(), mob:getZPos() + math.random(3, 6))
        pet:spawn()
        pet:updateEnmity(mob:getTarget())
		mob:setLocalVar("SummonTime", BattleTime + 45)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    for v = mob:getID()+1, mob:getID()+9, 1 do
        DespawnMob(v)
    end
end
