-----------------------------------
-- Ability: Quickstep
-- Lowers target's evasion. If successful, you will earn two Finishing Moves.
-- Obtained: Dancer Level 20
-- TP Required: 10%
-- Recast Time: 00:05
-- Duration: First Step lasts 1 minute, each following Step extends its current duration by 30 seconds.
-----------------------------------
require("scripts/globals/weaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if (player:getAnimation() ~= 1) then
        return tpz.msg.basic.REQUIRES_COMBAT, 0
    else
        if (player:hasStatusEffect(tpz.effect.TRANCE)) then
            return 0, 0
        elseif (player:getTP() < 50) then
            return tpz.msg.basic.NOT_ENOUGH_TP, 0
        else
            return 0, 0
        end
    end
end

function onUseAbility(player, target, ability, action)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(tpz.effect.TRANCE) then
        player:delTP(50)
    end

    local hit = 1
    local effect = 1
    local jpValue = player:getJobPointLevel(tpz.jp.STEP_DURATION)

    if math.random() <= getHitRate(player, target, true, true, 10 + player:getMod(tpz.mod.STEP_ACCURACY)) then
        hit = 5
        local mjob = player:getMainJob()
        local daze = 2 -- Dazes should always give at least 2 FM

        if mjob == tpz.job.DNC then
            if (target:hasStatusEffect(tpz.effect.LETHARGIC_DAZE_1)) then
                local duration = target:getStatusEffect(tpz.effect.LETHARGIC_DAZE_1):getDuration()
                target:delStatusEffectSilent(tpz.effect.LETHARGIC_DAZE_1)
                if (player:hasStatusEffect(tpz.effect.PRESTO)) then
                    target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_3, 1, 0, duration + 30 + jpValue)
                    daze = 3
                    effect = 3
					player:delStatusEffectSilent(tpz.effect.PRESTO)
                else
                    target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_2, 1, 0, duration + 30 + jpValue)
                    daze = 2
                    effect = 2
                end

            elseif (target:hasStatusEffect(tpz.effect.LETHARGIC_DAZE_2)) then
                local duration = target:getStatusEffect(tpz.effect.LETHARGIC_DAZE_2):getDuration()
                target:delStatusEffectSilent(tpz.effect.LETHARGIC_DAZE_2)
                if (player:hasStatusEffect(tpz.effect.PRESTO)) then
                    target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_4, 1, 0, duration + 30 + jpValue)
                    daze = 3
                    effect = 4
					player:delStatusEffectSilent(tpz.effect.PRESTO)
                else
                    target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_3, 1, 0, duration + 30 + jpValue)
                    daze = 2
                    effect = 3
                end

            elseif (target:hasStatusEffect(tpz.effect.LETHARGIC_DAZE_3)) then
                local duration = target:getStatusEffect(tpz.effect.LETHARGIC_DAZE_3):getDuration()
                target:delStatusEffectSilent(tpz.effect.LETHARGIC_DAZE_3)
                if (player:hasStatusEffect(tpz.effect.PRESTO)) then
                    target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_5, 1, 0, duration + 30 + jpValue)
                    daze = 3
                    effect = 5
					player:delStatusEffectSilent(tpz.effect.PRESTO)
                else
                    target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_4, 1, 0, duration + 30 + jpValue)
                    daze = 2
                    effect = 4
                end

            elseif (target:hasStatusEffect(tpz.effect.LETHARGIC_DAZE_4)) then
                local duration = target:getStatusEffect(tpz.effect.LETHARGIC_DAZE_4):getDuration()
                target:delStatusEffectSilent(tpz.effect.LETHARGIC_DAZE_4)
                if (player:hasStatusEffect(tpz.effect.PRESTO)) then
                    daze = 3
					player:delStatusEffectSilent(tpz.effect.PRESTO)
                else
                    daze = 2
                end
                target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_5, 1, 0, duration + 30 + jpValue)
                effect = 5

            elseif (target:hasStatusEffect(tpz.effect.LETHARGIC_DAZE_5)) then
                local duration = target:getStatusEffect(tpz.effect.LETHARGIC_DAZE_5):getDuration()
                target:delStatusEffectSilent(tpz.effect.LETHARGIC_DAZE_5)
                target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_5, 1, 0, duration + 30 + jpValue)
                if (player:hasStatusEffect(tpz.effect.PRESTO)) then
                    daze = 3 -- Dazes should always give 3 FM with Presto
                else
                    daze = 2 -- Dazes should always give at least 2 FM
                end
                effect = 5
				player:delStatusEffectSilent(tpz.effect.PRESTO)

            else
                if (player:hasStatusEffect(tpz.effect.PRESTO)) then
                    target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_2, 1, 0, 60)
                    daze = 3
                    effect = 2
					player:delStatusEffectSilent(tpz.effect.PRESTO)
                else
                    target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_1, 1, 0, 60)
                    daze = 2
                    effect = 1
                end
            end
        else
            if (target:hasStatusEffect(tpz.effect.LETHARGIC_DAZE_1)) then
                local duration = target:getStatusEffect(tpz.effect.LETHARGIC_DAZE_1):getDuration()
                target:delStatusEffectSilent(tpz.effect.LETHARGIC_DAZE_1)
                target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_2, 1, 0, duration + 30 + jpValue)
                effect = 2

            elseif (target:hasStatusEffect(tpz.effect.LETHARGIC_DAZE_2)) then
                local duration = target:getStatusEffect(tpz.effect.LETHARGIC_DAZE_2):getDuration()
                target:delStatusEffectSilent(tpz.effect.LETHARGIC_DAZE_2)
                target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_3, 1, 0, duration + 30 + jpValue)
                effect = 3

            elseif (target:hasStatusEffect(tpz.effect.LETHARGIC_DAZE_3)) then
                local duration = target:getStatusEffect(tpz.effect.LETHARGIC_DAZE_3):getDuration()
                target:delStatusEffectSilent(tpz.effect.LETHARGIC_DAZE_3)
                target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_4, 1, 0, duration + 30 + jpValue)
                effect = 4

            elseif (target:hasStatusEffect(tpz.effect.LETHARGIC_DAZE_4)) then
                local duration = target:getStatusEffect(tpz.effect.LETHARGIC_DAZE_4):getDuration()
                target:delStatusEffectSilent(tpz.effect.LETHARGIC_DAZE_4)
                target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_5, 1, 0, duration + 30 + jpValue)
                effect = 5

            elseif (target:hasStatusEffect(tpz.effect.LETHARGIC_DAZE_5)) then
                local duration = target:getStatusEffect(tpz.effect.LETHARGIC_DAZE_5):getDuration()
                target:delStatusEffectSilent(tpz.effect.LETHARGIC_DAZE_5)
                target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_5, 1, 0, duration + 30 + jpValue)
                effect = 5
            else
                target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_1, 1, 0, 60)
                effect = 1
            end
        end

        if (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_1)) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_1)
            player:addStatusEffect(tpz.effect.FINISHING_MOVE_1+daze, 1, 0, 7200)

        elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_2)) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_2)
            player:addStatusEffect(tpz.effect.FINISHING_MOVE_2+daze, 1, 0, 7200)

        elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_3)) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_3)
            if (daze > 2) then
                daze = 2
            end
            player:addStatusEffect(tpz.effect.FINISHING_MOVE_3+daze, 1, 0, 7200)

        elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_4)) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_4)
            player:addStatusEffect(tpz.effect.FINISHING_MOVE_5, 1, 0, 7200)
        elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5)) then

        else
            player:addStatusEffect(tpz.effect.FINISHING_MOVE_1 - 1 + daze, 1, 0, 7200)
        end

    else
        ability:setMsg(tpz.msg.basic.JA_MISS)
    end

    action:animation(target:getID(), getStepAnimation(player:getWeaponSkillType(tpz.slot.MAIN)))
    action:speceffect(target:getID(), hit)
    return effect

end
