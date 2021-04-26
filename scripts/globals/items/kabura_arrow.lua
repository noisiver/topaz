-----------------------------------------
-- ID: 17325
-- Item: Kabura Arrow
-- Additional Effect: Silence
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 100
    local SDT = target:getMod(tpz.mod.SDT_WIND)

    if SDT <= 5 then
        chance = 0
    else 
        chance = chance * (SDT / 100)
        chance = utils.clamp(chance, 5, 95)
    end
    if (target:hasImmunity(16)) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    elseif (math.random(0, 99) >= chance or applyResistanceAddEffect(player, target, tpz.magic.ele.WIND, 0) <= 0.5) then
        return 0, 0, 0
    else
        target:delStatusEffect(tpz.effect.SILENCE)
        if (not target:hasStatusEffect(tpz.effect.SILENCE)) then
            target:addStatusEffect(tpz.effect.SILENCE, 1, 0, 60)
        end
        return tpz.subEffect.SILENCE, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.SILENCE
    end
end
