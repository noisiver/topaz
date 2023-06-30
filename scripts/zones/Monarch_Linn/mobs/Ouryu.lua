-----------------------------------
-- Area: Monarch Linn
--  Mob: Ouryu
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
mixins = {require("scripts/mixins/families/wyrm_wakeup")}
-----------------------------------

function onMobSpawn(mob)
    mob:setDamage(60)
	mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.DEFP, 20)
    mob:SetMobSkillAttack(0) -- resetting so it doesn't respawn in flight mode.
    mob:AnimationSub(0) -- subanim 0 is only used when it spawns until first flight.
end

function onMobEngaged(mob, target)
	mob:castSpell(54) -- Stoneskin
end

function onMobFight(mob, target)

    local bf = mob:getBattlefield()
    if bf:getID() == 961 and mob:getHPP() <= 30 then
        bf:win()
        return
    end
	
	--wake up if slept
    if mob:AnimationSub() == 1 and hasSleepEffects(mob) then
		mob:wakeUp()
		mob:delStatusEffect(tpz.effect.SLEEP_I)
		mob:delStatusEffect(tpz.effect.SLEEP_II)
		mob:delStatusEffect(tpz.effect.LULLABY)
    end
    -- use 2hr
	local TwoHourTime = mob:getLocalVar("TwoHourTime")
    if mob:AnimationSub() ~= 1 and TwoHourTime == 0 and mob:getHPP() <= math.random(75, 90) then
        mob:useMobAbility(694)
        mob:setLocalVar("TwoHourTime", 1)
    end

    if (mob:hasStatusEffect(tpz.effect.INVINCIBLE) == false and mob:actionQueueEmpty() == true) then
        local changeTime = mob:getLocalVar("changeTime")

        if (mob:AnimationSub() == 0 and not hasSleepEffects(mob) and mob:getBattleTime() - changeTime > 60) then
            mob:AnimationSub(1)
            mob:addStatusEffectEx(tpz.effect.TOO_HIGH, 0, 1, 0, 0)
			mob:SetMobSkillAttack(731)
            --and record the time this phase was started
            mob:setLocalVar("changeTime", mob:getBattleTime())
        -- subanimation 1 is flight, so check if he should land
        elseif (mob:AnimationSub() == 1 and not hasSleepEffects(mob) and mob:getBattleTime() - changeTime > 120) then
            mob:useMobAbility(1302)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        -- subanimation 2 is grounded mode, so check if he should take off
        elseif (mob:AnimationSub() == 2 and not hasSleepEffects(mob) and mob:getBattleTime() - changeTime > 120) then
            mob:AnimationSub(1)
            mob:addStatusEffectEx(tpz.effect.TOO_HIGH, 0, 1, 0, 0)
            mob:SetMobSkillAttack(731)
            mob:setLocalVar("changeTime", mob:getBattleTime())
        end
    end
end

function onMobDeath(mob, player, isKiller)

    player:addTitle(tpz.title.MIST_MELTER)

end
