-----------------------------------
-- Area: Halvung
--  Mob: Gurfurlur the Menacing
-- !pos -59.000 -23.000 3.000 62
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Halvung/IDs")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(200)
    mob:setMod(tpz.mod.ATT, 870)
    mob:setMod(tpz.mod.DEF, 536)
    mob:setMod(tpz.mod.EVA, 356)
    mob:addMod(tpz.mod.MDEF, 80)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMod(tpz.mod.REGEN, 10) 
    mob:setMod(tpz.mod.REFRESH, 50)
    mob:setLocalVar("AddsTime", 0)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
end

function onMobEngaged(mob, target)
    for i = ID.mob.GURFURLUR_THE_MENACING + 1, ID.mob.GURFURLUR_THE_MENACING + 4 do
        SpawnMob(i):updateEnmity(target)
    end
end

function onMobFight(mob, target)
	local AddsTime = mob:getLocalVar("AddsTime")
    local BattleTime = mob:getBattleTime()

	if BattleTime >= AddsTime then
        if not GetMobByID(ID.mob.GURFURLUR_THE_MENACING + 1):isSpawned() then
            GetMobByID(ID.mob.GURFURLUR_THE_MENACING + 1):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.GURFURLUR_THE_MENACING + 1):updateEnmity(target)
        elseif not GetMobByID(ID.mob.GURFURLUR_THE_MENACING + 2):isSpawned() then
            GetMobByID(ID.mob.GURFURLUR_THE_MENACING + 2):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.GURFURLUR_THE_MENACING + 2):updateEnmity(target)
        elseif not GetMobByID(ID.mob.GURFURLUR_THE_MENACING + 3):isSpawned() then
            GetMobByID(ID.mob.GURFURLUR_THE_MENACING + 3):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.GURFURLUR_THE_MENACING + 3):updateEnmity(target)
        elseif not GetMobByID(ID.mob.GURFURLUR_THE_MENACING + 4):isSpawned() then
            GetMobByID(ID.mob.GURFURLUR_THE_MENACING + 4):setSpawn(mob:getXPos()+math.random(1, 5), mob:getYPos(), mob:getZPos()+math.random(1, 5))
            SpawnMob(ID.mob.GURFURLUR_THE_MENACING + 4):updateEnmity(target)
        end
        mob:setLocalVar("AddsTime", AddsTime + 300)
    end

    for i = ID.mob.GURFURLUR_THE_MENACING + 1, ID.mob.GURFURLUR_THE_MENACING + 4 do
        local pet = GetMobByID(i)

        if pet:getCurrentAction() == tpz.act.ROAMING then
            pet:updateEnmity(target)
        end
    end
    tpz.mix.jobSpecial.config(mob, {
    specials =
    {
        {id = tpz.jsa.HUNDRED_FISTS, cooldown = 180, hpp = 90},
    },
    })
end

function onMobDisengage(mob)
    for i = 1, 4 do DespawnMob(ID.mob.GURFURLUR_THE_MENACING + i) end
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.TROLL_SUBJUGATOR)
    for i = 1, 4 do DespawnMob(ID.mob.GURFURLUR_THE_MENACING + i) end
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
    for i = 1, 4 do DespawnMob(ID.mob.GURFURLUR_THE_MENACING + i) end
end
