-----------------------------------------
-- ID: 18784
-- Item: Metasoma Katars
-- Additional effect: Poison, Paralyze, or Bind
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 10)
    if math.random(0, 95) <= chance then
        local rng = math.random(3)
        if (rng == 1) then
            return PoisonProc(player, target)
        elseif (rng == 2) then
            return ParaProc(player, target)
        elseif (rng == 3) then
            return BindProc(player, target)
        end
    end
end

function ParaProc(player, target)
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.PARALYSIS, tpz.magic.ele.ICE, 0)
    local duration = math.floor(60 * resist)

    if (resist < 0.5) then 
        return 0, 0, 0
    else
        target:addStatusEffect(tpz.effect.PARALYSIS, 25, 0, duration) 
        return tpz.subEffect.PARALYSIS, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.PARALYSIS
    end
end

function PoisonProc(player, target)
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.POISON, tpz.magic.ele.WATER, 0)
    local duration = math.floor(60 * resist)

    if (resist < 0.5) then 
        return 0, 0, 0
    else
        target:addStatusEffect(tpz.effect.POISON, 15, 3, duration)
        return tpz.subEffect.POISON, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.POISON
    end
end

function BindProc(player, target)
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.BIND, tpz.magic.ele.ICE, 0)
    local duration = math.floor(30 * resist)

    if (resist < 0.5) then 
        return 0, 0, 0
    else
        target:addStatusEffect(tpz.effect.BIND, 10, 0, duration) 
        return tpz.subEffect.PARALYSIS, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.BIND
    end
end