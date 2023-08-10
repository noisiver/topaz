-----------------------------------
-- Area: Misareaux Coast
--   NM: Gration
-----------------------------------
mixins = {require("scripts/mixins/fomor_hate")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
	mob:setDamage(150)
	mob:setMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:addStatusEffect(tpz.effect.KILLER_INSTINCT, 40, 0, 0)
	mob:setMod(tpz.mod.FASTCAST, 15)
    mob:setMod(tpz.mod.REGAIN, 100)
    mob:setMod(tpz.mod.REFRESH, 40)
	mob:setMobMod(tpz.mobMod.HP_STANDBACK,-1)
    mob:setLocalVar("fomorHateDecrease", 1)
    mob:setLocalVar("fomorHateAdj", 2)
end

function onMobWeaponSkill(target, mob, skill)
	if skill:getID() == 394 then
		local powerattack = mob:getLocalVar("powerattack")

		powerattack = powerattack +1
		mob:setLocalVar("powerattack", powerattack)

		if powerattack > 2 then
			mob:setLocalVar("powerattack", 0)
		else
			mob:useMobAbility(394)
		end
	end
end

function onMonsterMagicPrepare(mob, target)
    local rnd = math.random()

    if rnd < 0.5 then
        return 196 -- thundaga III
    elseif rnd < 0.6 then
        return 167 -- thunder IV
    elseif rnd < 0.7 then
        return 212 -- burst
    elseif rnd < 0.8 then
        return 251 -- shock spikes
    elseif rnd < 0.9 then
        return 57 -- haste
    else
        return 104 -- enthunder
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end
