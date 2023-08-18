-----------------------------------
--
--tpz.effect.CONVERGENCE
--
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/items")
-----------------------------------
function onEffectGain(target, effect)
    -- TODO: Ilvl relic
    local head = target:getEquipID(tpz.slot.HEAD)
    local relicBonus = 0
    if (head == tpz.items.MIRAGE_KEFFIYEH_HQ or head == tpz.items.MIRAGE_KEFFIYEH_HQTWO) then
        relicBonus = relicBonus + ((target:getMerit(tpz.merit.CONVERGENCE) / 5) * 2)
    end
   target:addMod(tpz.mod.MACC, effect:getPower() + relicBonus)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    -- TODO: Ilvl relic
    local head = target:getEquipID(tpz.slot.HEAD)
    local relicBonus = 0
    if (head == tpz.items.MIRAGE_KEFFIYEH_HQ or head == tpz.items.MIRAGE_KEFFIYEH_HQTWO) then
        relicBonus = relicBonus + ((target:getMerit(tpz.merit.CONVERGENCE) / 5) * 2)
    end
    target:delMod(tpz.mod.MACC, effect:getPower() + relicBonus)
end
