-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel HM
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 20)
    mob:setMod(tpz.mod.MDEF, 12) 
    mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
    tpz.mix.jobSpecial.config(mob, {
        between = 30,
        specials =
        {
            {id = tpz.jsa.MIGHTY_STRIKES},
            {id = tpz.jsa.MIJIN_GAKURE},
        },
    })
end

function onMobEngaged(mob, target)
    local mobid = mob:getID()

    for member = mobid, mobid+7 do
        local m = GetMobByID(member)
        if m:getCurrentAction() == tpz.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end

function onMobFight(mob, target)
	if mob:getHPP() <= 25  then
		local X = mob:getXPos()
		local Y = mob:getYPos()
		local Z = mob:getZPos()
		SpawnMob(mob:getID() + 1)
		SpawnMob(mob:getID() + 2)
		SpawnMob(mob:getID() + 3)
		GetMobByID(mob:getID() + 1):setPos(X, Y, Z)
		GetMobByID(mob:getID() + 1):setSpawn(X, Y, Z)
		GetMobByID(mob:getID() + 2):setPos(X, Y, Z)
		GetMobByID(mob:getID() + 2):setSpawn(X, Y, Z)
		GetMobByID(mob:getID() + 3):setPos(X, Y, Z)
		GetMobByID(mob:getID() + 3):setSpawn(X, Y, Z)
		GetMobByID(mob:getID() + 1):updateEnmity(target)
		GetMobByID(mob:getID() + 2):updateEnmity(target)
		GetMobByID(mob:getID() + 3):updateEnmity(target)
		DisallowRespawn(mob:getID(), true)
	end
end


function onMobDeath(mob, player, isKiller)
end
