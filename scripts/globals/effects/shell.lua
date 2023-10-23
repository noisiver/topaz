-----------------------------------
--
-- tpz.effect.SHELL
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local protShellMod = target:getMod(tpz.mod.PROTECT_SHELL_EFFECT)
    local power = effect:getPower()
    power = power + protShellMod -- Flat
   target:addMod(tpz.mod.DMGMAGIC, -power)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local protShellMod = target:getMod(tpz.mod.PROTECT_SHELL_EFFECT)
    local power = effect:getPower()
    power = power + protShellMod -- Flat
   target:delMod(tpz.mod.DMGMAGIC, -power)
end
