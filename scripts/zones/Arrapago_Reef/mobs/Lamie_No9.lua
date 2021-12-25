-----------------------------------
-- Area: Arrapago Reef
--  Mob: Lamie_No9
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
mixins ={require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(125) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ACC, 15) 
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMod(tpz.mod.REGAIN, 0)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.SKILL_LIST, 6090) 
    mob:AnimationSub(12)
end

function onMobFight(mob, target)
    local SpawnPet = mob:getLocalVar("SpawnPet")
    local battletime = mob:getBattleTime()
    local Avatar = GetMobByID(mob:getID()+1)
    if battletime >= SpawnPet and not Avatar:isSpawned() then
		Avatar:setPos(mob:getPos())
		Avatar:spawn()
		Avatar:updateEnmity(target)
        mob:setLocalVar("SpawnPet", battletime + math.random(45, 90))
    end

    if mob:getHPP() <= 20 then
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 6060) -- Belly Dance only
    end

    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.ASTRAL_FLOW, cooldown = math.random(45, 90), hpp = 90},
        },
    })
end

function onMobDeath(mob, player, isKiller)
    DespawnMob(mob:getID()+1)
	if isKiller  then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		player:addTreasure(5736, mob)--Linen Coin Purse
	end
end
