-----------------------------------
-- Area: Halvung
--  Mob: Kirlirger the Abhorrent
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {
    require("scripts/mixins/job_special"),
    require("scripts/mixins/weapon_break")
}
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
	mob:setDamage(250)
    mob:addMod(tpz.mod.ACC, 100)
    mob:setMod(tpz.mod.UFASTCAST, 50)
    mob:setMod(tpz.mod.REFRESH, 40)
end

function onMobFight(mob, target)
    local animationSub = mob:AnimationSub()
    tpz.mix.jobSpecial.config(mob, {
    specials =
    {
        {id = tpz.jsa.BLOOD_WEAPON, cooldown = 180, hpp = 90},
    },
    })
    if animationSub == 1 then -- Broken weapon
        mob:addMod(tpz.mod.CRITHITRATE, 100)
    end
end

function onAdditionalEffect(mob, target, damage)
    local animationSub = mob:AnimationSub()
    if animationSub == 0 or animationSub == 4 then -- Has weapon
        return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.STUN, {chance = 100, duration = 5})
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
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
