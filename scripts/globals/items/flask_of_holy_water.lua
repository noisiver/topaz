-----------------------------------------
-- ID: 4154
-- Item: Flask of Holy Water
-- Item Effect: Removes curse
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local curse = target:getStatusEffect(tpz.effect.CURSE_I)
    local bane = target:getStatusEffect(tpz.effect.BANE)
    local power = 33 + target:getMod(tpz.mod.ENHANCES_HOLYWATER)

    if (target:hasStatusEffect(tpz.effect.DOOM) and power > math.random(1, 100)) then
        target:delStatusEffectSilent(tpz.effect.DOOM)
        target:messageBasic(tpz.msg.basic.NARROWLY_ESCAPE)
    elseif (curse ~= nil and curse2 ~= nil and bane ~= nil) then
        target:delStatusEffectSilent(tpz.effect.CURSE_I)
        target:delStatusEffectSilent(tpz.effect.BANE)
    elseif (curse ~= nil and bane ~= nil) then
        target:delStatusEffectSilent(tpz.effect.BANE)
    elseif (curse2 ~= nil and bane ~= nil) then
        target:delStatusEffectSilent(tpz.effect.BANE)
    elseif (curse ~= nil) then
        target:delStatusEffectSilent(tpz.effect.CURSE_I)
    elseif (bane ~= nil) then
        target:delStatusEffectSilent(tpz.effect.BANE)
    else
        target:messageBasic(tpz.msg.basic.NO_EFFECT)
    end
end
