-----------------------------------------
-- ID: 18149
-- Item: Sleep Bolt
-- Additional Effect: Sleep
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 95
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 5, 95)
    end
    if target:getStat(tpz.mod.SDT_LIGHT) <= 5 then
        chance = 0
    elseif target:getStat(tpz.mod.SDT_LIGHT) <= 50 then
        chance = chance / 2
    elseif target:getStat(tpz.mod.SDT_LIGHT) <= 75 then
        chance = chance * 0.75
    end
    if (math.random(0, 99) >= chance) then
        return 0, 0, 0
    else
        local duration = 25
        if (target:getMainLvl() > player:getMainLvl()) then
            duration = duration - (target:getMainLvl() - player:getMainLvl())
        end
        duration = utils.clamp(duration, 1, 25)
        duration = duration * applyResistanceAddEffect(player, target, tpz.magic.ele.LIGHT, 0)
    if (target:hasImmunity(1)) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    elseif (math.random(0, 99) >= chance or applyResistanceAddEffect(player, target, tpz.magic.ele.LIGHT, 0) <= 0.5) then
        return 0, 0, 0
    else
        if (not target:hasStatusEffect(tpz.effect.SLEEP_I)) then
            target:addStatusEffect(tpz.effect.SLEEP_I, 1, 0, duration)
        end
        return tpz.subEffect.SLEEP, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.SLEEP_I
    end
end
