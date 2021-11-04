-----------------------------------------
-- ID: 5268
-- Item: CCB Polymer Pump
-- Additional Effect: Amnesia on Omega and Ultima
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/zone")
require("scripts/globals/msg")
-----------------------------------

function onItemCheck(target)
    if target:getFamily() == 54 and target:getZoneID() == tpz.zone.SEALIONS_DEN then
        return 0
    end
        return 1
end

function onItemUse(target, item)
    local effect = tpz.effect.AMNESIA
    if target:hasStatusEffect(effect) then
        target:delStatusEffectSilent(effect)
    end
    target:addStatusEffectEx(effect, 0, 0, 0, 60)
end
