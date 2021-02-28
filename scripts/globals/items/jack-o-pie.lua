-----------------------------------------
-- ID: 5644
-- Item: jack-o-pie
-- Food Effect: 1hour, All Races
-----------------------------------------
-- MP 45
-- +20 MP
-- +2 CHR
-- 1 AGI
-- 2 int
-- +21% Macc(Cap: 12)
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:hasStatusEffect(tpz.effect.FOOD) or target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD) then
        result = tpz.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 3600, 5644)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.MP, 25)
    target:addMod(tpz.mod.AGI, -1)
    target:addMod(tpz.mod.CHR, 2)
    target:addMod(tpz.mod.INT, -2)
    target:addMod(tpz.mod.FOOD_MACCP, 21)
    target:addMod(tpz.mod.FOOD_MACC_CAP, 12)

end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MP, 25)
    target:delMod(tpz.mod.AGI, -1)
    target:delMod(tpz.mod.CHR, 2)
    target:delMod(tpz.mod.INT, -2)
    target:delMod(tpz.mod.FOOD_MACCP, 21)
    target:delMod(tpz.mod.FOOD_MACC_CAP, 12)
end