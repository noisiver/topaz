-----------------------------------
-- Area: Phomiuna_Aqueducts
--  MOB: Tres Duendes
-- !pos -140 0 166 27
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    DespawnMob(mob:getID()-1) -- Despawn Fomor BLM
    DisallowRespawn(mob:getID()-1, true)
    mob:addMod(tpz.mod.DEFP, 25) 
	mob:addMod(tpz.mod.ACC, 15) 
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
end

function onMobEngaged(mob)
	mob:setMod(tpz.mod.HASTE_MAGIC, 0)
    mob:setDamage(100)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
end

function onMobFight(mob)
    if mob:getBattleTime() > mob:getLocalVar("changeTime") + math.random(55,65) then
        changeStance(mob)
    end
end

-- stance 1: (cluster form) delay(2400) damage(100) triple_att(0)
-- stance 2: (horizontal form) delay(4800) damage(100) triple_att(0)
-- stance 3: (vertical form) delay(2400) damage(50) triple_att(100)

function changeStance(mob)
    if mob:AnimationSub() > 1 then
        mob:AnimationSub(1)
		mob:setMod(tpz.mod.HASTE_MAGIC, 0)
        mob:setDamage(100)
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
    else
        local stance = math.random(2,3)
        mob:AnimationSub(stance)

        if stance == 2 then
			mob:setMod(tpz.mod.HASTE_MAGIC, -5000)
            mob:setDamage(100)
            mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
        else
			mob:setMod(tpz.mod.HASTE_MAGIC, 0)
            mob:setDamage(50)
            mob:setMod(tpz.mod.TRIPLE_ATTACK, 100)
        end
    end
    mob:setLocalVar("changeTime", mob:getBattleTime())
end

function onMobEngaged(mob)
    mob:AnimationSub(1)
	mob:setMod(tpz.mod.HASTE_MAGIC, 0)
    mob:setDamage(100)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(36000, 43200)) -- 11 to 12 hours
    mob:AnimationSub(1)
    DisallowRespawn(mob:getID()-1, false)
end