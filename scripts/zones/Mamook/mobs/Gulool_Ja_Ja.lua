-----------------------------------
-- Area: Mamook
--  Mob: Gulool Ja Ja
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
local ID = require("scripts/zones/Mamook/IDs")
mixins = {require("scripts/mixins/job_special")}

-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(200)
    mob:setMod(tpz.mod.ATT, 870)
    mob:setMod(tpz.mod.DEF, 536)
    mob:setMod(tpz.mod.EVA, 356)
    mob:addMod(tpz.mod.MDEF, 100)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMod(tpz.mod.REGEN, 10) 
    mob:setMod(tpz.mod.REFRESH, 50)
    mob:setLocalVar("AddsTime", 0)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
end

function onMobEngaged(mob, target)
    for i = ID.mob.GULOOL_JA_JA + 1, ID.mob.GULOOL_JA_JA + 4 do
        SpawnMob(i):updateEnmity(target)
    end
end

function onMobFight(mob, target)
	local AddsTime = mob:getLocalVar("AddsTime")
    local BattleTime = mob:getBattleTime()

	if BattleTime >= AddsTime then
        if (not GetMobByID(ID.mob.GULOOL_JA_JA + 1):isSpawned()) then
            GetMobByID(ID.mob.GULOOL_JA_JA + 1):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.GULOOL_JA_JA + 1):updateEnmity(target)
        elseif (not GetMobByID(ID.mob.GULOOL_JA_JA + 2):isSpawned()) then
            GetMobByID(ID.mob.GULOOL_JA_JA + 2):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.GULOOL_JA_JA + 2):updateEnmity(target)
        elseif (not GetMobByID(ID.mob.GULOOL_JA_JA + 3):isSpawned()) then
            GetMobByID(ID.mob.GULOOL_JA_JA + 3):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.GULOOL_JA_JA + 3):updateEnmity(target)
        elseif (not GetMobByID(ID.mob.GULOOL_JA_JA + 4):isSpawned()) then
            GetMobByID(ID.mob.GULOOL_JA_JA + 4):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.GULOOL_JA_JA + 4):updateEnmity(target)
        end
        mob:setLocalVar("AddsTime", AddsTime + 300)
    end
    for i = ID.mob.GULOOL_JA_JA + 1, ID.mob.GULOOL_JA_JA + 4 do
        local pet = GetMobByID(i)
        if (pet:getCurrentAction() == tpz.act.ROAMING) then
            pet:updateEnmity(target)
        end
    end
    tpz.mix.jobSpecial.config(mob, {
    specials =
    {
        {id = tpz.jsa.MIJIN_GAKURE, cooldown = 180, hpp = 90},
    },
    })
end

function onMobDisengage(mob)
    for i = 1, 4 do DespawnMob(ID.mob.GULOOL_JA_JA + i) end
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.SHINING_SCALE_RIFLER)
    for i = 1, 4 do DespawnMob(ID.mob.GULOOL_JA_JA + i) end
	if isKiller  then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
	if isKiller  then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
	if isKiller  then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
end

function onMobDespawn(mob)
    for i = 1, 4 do DespawnMob(ID.mob.GULOOL_JA_JA + i) end
end
