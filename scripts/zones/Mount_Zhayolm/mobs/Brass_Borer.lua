-----------------------------------
-- Area: Mount Zhayolm
--  ZNM: Brass Borer
-- TODO: Halting movement during stance change.
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
	mob:setDamage(175) -- 350 on DD's
    mob:AnimationSub(0)
	mob:setMod(tpz.mod.MATT, 0)
	mob:setMod(tpz.mod.MOVE, -25)
    mob:setMod(tpz.mod.SDT_LIGHT, 50)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 3000) -- 5k Gil
    mob:setMobMod(tpz.mobMod.GIL_MAX, 5000) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0) 
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
    mob:setLocalVar("formTime", os.time() + math.random(60, 90))
    mob:setLocalVar("defUp", math.random(50, 75))
    mob:setLocalVar("DEF", math.random(3, 5))
end

function onMobRoam(mob)
    local roamTime = mob:getLocalVar("formTime")

	if mob:hasStatusEffect(tpz.effect.BLAZE_SPIKES) == false then
		mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 110, 0, 3600)
	end

    if mob:AnimationSub() == 0 and os.time() > roamTime then
        mob:AnimationSub(1)
        mob:setMod(tpz.mod.UDMGMAGIC, -33)
        mob:setLocalVar("formTime", os.time() + math.random(60, 90))
    elseif mob:AnimationSub() == 1 and os.time() > roamTime then
        mob:AnimationSub(0)
        mob:setMod(tpz.mod.UDMGMAGIC, 33)
        mob:setLocalVar("formTime", os.time() + math.random(60, 90))
    end
end

function onMobFight(mob, target)
    local fightTime = mob:getLocalVar("formTime")

	if mob:hasStatusEffect(tpz.effect.BLAZE_SPIKES) == false then
		mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 110, 0, 3600)
	end

    if mob:AnimationSub() == 0 and os.time() > fightTime then
        mob:AnimationSub(1)
        mob:setMod(tpz.mod.UDMGMAGIC, -33)
        mob:setLocalVar("formTime", os.time() + math.random(60, 90))
    elseif mob:AnimationSub() == 1 and os.time() > fightTime then
        mob:AnimationSub(0)
        mob:setMod(tpz.mod.UDMGMAGIC, 33)
        mob:setLocalVar("formTime", os.time() + math.random(60, 90))
    end
    -- Amber Scutum - > Cannonball Logic
    if mob:getHPP() < mob:getLocalVar("defUp") and mob:getLocalVar("usedMainSpec") <= mob:getLocalVar("DEF") then
        -- Uses Amber Scutum 3-5 times in a row then spams Cannonball
        mob:useMobAbility(1815)
        mob:setLocalVar("usedMainSpec", mob:getLocalVar("usedMainSpec") +1)
    elseif mob:getLocalVar("usedMainSpec") >= 5 and mob:getLocalVar("Cannonball") == 0 then
        mob:setLocalVar("Cannonball", 1)
        mob:setMod(tpz.mod.REGAIN, 200)
    end
end

function onMobWeaponSkillPrepare(mob, target)
	local Cannonball = mob:getLocalVar("Cannonball")
    if Cannonball > 0 then
        mob:useMobAbility(1818)
    end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENFIRE, {power = 50})
end

function onMobDeath(mob)
    player:addCurrency("zeni_point", 500)
	if isKiller  then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
end
