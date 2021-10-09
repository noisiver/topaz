-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel EV
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
    mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.BENEDICTION, hpp = math.random(20, 30)}, -- "Uses Benediction once."
            {id = tpz.jsa.INVINCIBLE, hpp = math.random(90, 95), cooldown = 90}, -- "Uses Invincible many times."
        },
    })
end

function onMobEngaged(mob, target)
    local mobid = mob:getID()

    for member = mobid-4, mobid+3 do
        local m = GetMobByID(member)
        if m:getCurrentAction() == tpz.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end

function onMobDespawn(mob)
    local X = mob:getXPos()
    local Y = mob:getYPos()
    local Z = mob:getZPos()
	SpawnMob(mob:getID() + 1)
	GetMobByID(mob:getID() + 1):setPos(X, Y, Z)
	GetMobByID(mob:getID() + 1):setSpawn(X, Y, Z)
	DisallowRespawn(mob:getID(), true)
end

function onMobDeath(mob, player, isKiller)
end
