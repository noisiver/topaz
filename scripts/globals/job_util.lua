--[[
    Helper functions for jobs

    Place holder
--]]
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

jobUtil = {}

function jobUtil.AddIgnisRune(player, damage)
    local IgnisRunes = player:getLocalVar("IgnisRunes")
    local RuneDuration = 7200
    if player:getMainJob() == tpz.job.SAM then 
        if damage > 0 and IgnisRunes <= 2 then
            for v = 524,530,1 do
                player:delStatusEffectSilent(v)
            end
            player:addStatusEffect(tpz.effect.IGNIS, 1, 0, RuneDuration)
        end
    end
end

function jobUtil.ConsumeIgnisRune(player, effect, power)
    local Runes = player:getLocalVar("IgnisRunes")
    if (Runes > 0) then
        power = power * Runes
        local duration = Runes * 30
        player:delStatusEffectSilent(tpz.effect.IGNIS)
        player:delStatusEffectSilent(tpz.effect.IGNIS)
        player:delStatusEffectSilent(tpz.effect.IGNIS)
        player:setLocalVar("IgnisRunes", 0)
        player:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 13, 3, duration, effect, power, tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
        return true
    end
    return false
end

function jobUtil.AddUndaRune(player)
    local UndaRunes = player:getLocalVar("UndaRunes")
    local RuneDuration = 7200
    if player:getMainJob() == tpz.job.DRG then 
        if UndaRunes <= 2 then
            player:addStatusEffect(tpz.effect.UNDA, 1, 0, RuneDuration)
        end
    end
end

function jobUtil.ConsumeUndaRune(player, target, effect, power)
    local Runes = player:getLocalVar("UndaRunes")
    local duration = 60
    player:delStatusEffectSilent(tpz.effect.UNDA)
    player:delStatusEffectSilent(tpz.effect.UNDA)
    player:delStatusEffectSilent(tpz.effect.UNDA)
    player:setLocalVar("UndaRunes", 0)
    target:addStatusEffect(effect, power, 0, duration)
end

function jobUtil.CheckForFlyHigh(player, target, ability)
    if player:hasStatusEffect(tpz.effect.FLY_HIGH) then
        local recast = ability:getRecast()
        ability:setRecast(utils.clamp(recast, 0, recast / 2))
    end
end