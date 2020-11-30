-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.ENSPELL, tpz.magic.element.WIND + 8) -- Tier IIs have higher "enspell IDs"
    target:addMod(tpz.mod.ENSPELL_DMG, effect:getPower())
    target:addMod(tpz.mod.REGEN_DOWN, effect:getPower())        -- choke debuff
    target:addMod(tpz.mod.VIT, -getElementalDebuffStatDownFromDOT(effect:getPower()))       -- choke debuff
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:setMod(tpz.mod.ENSPELL_DMG, 0)
    target:setMod(tpz.mod.ENSPELL, 0)
    target:delMod(tpz.mod.REGEN_DOWN, effect:getPower())        --choke debuff
    target:delMod(tpz.mod.VIT, -getElementalDebuffStatDownFromDOT(effect:getPower()))       --choke debuff
end
