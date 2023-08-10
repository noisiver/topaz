-----------------------------------
-- Area: Arrapago Reef
--   NM: Medusa
-- !pos -458 -20 458
-- TODO: resists, attack/def boosts
-----------------------------------
local ID = require("scripts/zones/Arrapago_Reef/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/titles")
require("scripts/globals/status")
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

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobEngaged(mob, target)
    target:showText(mob, ID.text.MEDUSA_ENGAGE)
    for i = ID.mob.MEDUSA + 1, ID.mob.MEDUSA + 4 do
        SpawnMob(i):updateEnmity(target)
    end
end

function onMobFight(mob, target)
	local AddsTime = mob:getLocalVar("AddsTime")
    local BattleTime = mob:getBattleTime()
    local hp = mob:getHPP()

    -- Only shoots until 59%
    if (hp > 60) then
        mob:SetAutoAttackEnabled(false)
    else
        mob:SetAutoAttackEnabled(true)
    end

	if BattleTime >= AddsTime then
        if (not GetMobByID(ID.mob.MEDUSA + 1):isSpawned()) then
            GetMobByID(ID.mob.MEDUSA + 1):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.MEDUSA + 1):updateEnmity(target)
        elseif (not GetMobByID(ID.mob.MEDUSA + 2):isSpawned()) then
            GetMobByID(ID.mob.MEDUSA + 2):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.MEDUSA + 2):updateEnmity(target)
        elseif (not GetMobByID(ID.mob.MEDUSA + 3):isSpawned()) then
            GetMobByID(ID.mob.MEDUSA + 3):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.MEDUSA + 3):updateEnmity(target)
        elseif (not GetMobByID(ID.mob.MEDUSA + 4):isSpawned()) then
            GetMobByID(ID.mob.MEDUSA + 4):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.MEDUSA + 4):updateEnmity(target)
        end
        mob:setLocalVar("AddsTime", AddsTime + 300)
    end
    for i = ID.mob.MEDUSA + 1, ID.mob.MEDUSA + 4 do
        local pet = GetMobByID(i)
        if (pet:getCurrentAction() == tpz.act.ROAMING) then
            pet:updateEnmity(target)
        end
    end
    tpz.mix.jobSpecial.config(mob, {
    specials =
    {
        {id = tpz.jsa.EES_LAMIA, cooldown = 180, hpp = 90},
    },
    })
end

function onMobDisengage(mob)
    for i = 1, 4 do DespawnMob(ID.mob.MEDUSA + i) end
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:showText(mob, ID.text.MEDUSA_DEATH)
    player:addTitle(tpz.title.GORGONSTONE_SUNDERER)
    for i = 1, 4 do DespawnMob(ID.mob.MEDUSA + i) end
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
    for i = 1, 4 do DespawnMob(ID.mob.MEDUSA + i) end
end
