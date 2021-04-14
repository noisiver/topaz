-----------------------------------------
-- ID: 16926
-- Item: Bokuto +1
-- Additional Effect: Paralyze
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
function onAdditionalEffect(player, target, damage)
    local chance = 22       -- changed % to 12
    local SDT = target:getMod(tpz.mod.SDT_ICE)
    if SDT <= 5 then
        chance = 0
    end
    if (target:hasImmunity(32)) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    elseif (math.random(0, 99) >= chance or applyResistanceAddEffect(player, target, tpz.magic.ele.ICE, 0) <= 0.5) then -- changed to ice element
        return 0, 0, 0
    else
        target:addStatusEffect(tpz.effect.PARALYSIS, 15, 0, 10) -- added paralysis and changed potency to 12
        return tpz.subEffect.BLIND, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.PARALYSIS -- added paealysis
    end
end
