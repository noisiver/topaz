-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel MR
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

-- TODO: Allegedly has a 12 hp/sec regen.  Determine if true, and add to onMobInitialize if so.

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMod(tpz.mod.MDEF, 12) 
    mob:setUnkillable(true)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.PERFECT_DODGE},
        },
    })
end

function onMobEngaged(mob, target)
    --[[ TODO:
        Summons pet when party is engaged.  Randomly chosen between Tiger and Mandragora.
        Current victory system doesn't readily support a random choice of pet while having
        the pet as a victory condition.  Therefore, Mandragora just isn't used at this time.
    ]]

    local mobid = mob:getID()

    for member = mobid-1, mobid+6 do
        local m = GetMobByID(member)
        if m:getCurrentAction() == tpz.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end

function onMobFight(mob, target)
    local charm = mob:getLocalVar("Charm")

    if (charm == 0 and mob:getHPP() <  50) then
        mob:useMobAbility(710)
        mob:setLocalVar("Charm", 1)
    end
	
	if mob:getHPP() <= 10  then
		local X = mob:getXPos()
		local Y = mob:getYPos()
		local Z = mob:getZPos()
		SpawnMob(mob:getID() + 3)
		GetMobByID(mob:getID() + 3):setPos(X, Y, Z)
		GetMobByID(mob:getID() + 3):setSpawn(X, Y, Z)
		GetMobByID(mob:getID() + 3):updateEnmity(target)
		DisallowRespawn(mob:getID(), true)
		mob:setUnkillable(false)
	end
end

function onMobDeath(mob, player, isKiller)
end
