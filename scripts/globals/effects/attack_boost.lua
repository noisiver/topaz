-----------------------------------
--
-- tpz.effect.ATTACK_BOOST
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.ATTP, effect:getPower())
    target:addMod(tpz.mod.RATTP, effect:getPower())
    -- BLU Attp for temps
    if (effect:getPower() > 25) and target:getMainJob() == tpz.job.BLU then
        target:addMod(tpz.mod.BLU_ATTP, effect:getPower())
    end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ATTP, effect:getPower())
    target:delMod(tpz.mod.RATTP, effect:getPower())
    -- BLU Attp for temps
    if (effect:getPower() > 25) and target:getMainJob() == tpz.job.BLU then
        target:delMod(tpz.mod.BLU_ATTP, effect:getPower())
    end
end
