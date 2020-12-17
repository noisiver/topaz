-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local attk = player:getMainLvl() * 0.5 + 3
local evasion = player:getSkillLevel(tpz.skill.EVASION) * 0.5
function onEffectGain(target, effect) --power=30 initially, subpower=20 for enmity
    target:addMod(tpz.mod.EVA, evasion)
    target:addMod(tpz.mod.ENMITY, -effect:getSubPower())
    target:addmod(tpz.mod.ATTP, attk)
end

--function onEffectTick(target, effect)
    --tick down the effect and reduce the overall power
 --   effect:setPower(effect:getPower()-1)
 --   target:delMod(tpz.mod.EVA, -1)
  --  if (effect:getPower() % 2 == 0) then -- enmity- decays from -20 to -10, so half as often as the rest.
  --      effect:setSubPower(effect:getSubPower()-1)
   --     target:delMod(tpz.mod.ENMITY, -1)
   -- end
--end

function onEffectLose(target, effect)
    --remove the remaining power
    target:delMod(tpz.mod.EVA, evasion)
    target:delMod(tpz.mod.ENMITY, -effect:getSubPower())
    target:delmod(tpz.mod.ATTP, attk)
end
