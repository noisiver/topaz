-----------------------------------
--
-- tpz.effect.MAGIC_DEF_BOOST
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.MDEF, effect:getPower())
end

function onEffectTick(target, effect)
   local power = effect:getPower()
   local decayby = 0
   -- MDB reduction decays until 8 then stops
   if (power > 8) then
      if (power == 50) then
         decayby = 13
      elseif (power == 37) then
         decayby = 10
      elseif (power == 27) then
         decayby = 7
      elseif (power == 20) then
         decayby = 5
      elseif (power == 15) then
         decayby = 4
      elseif (power == 11) then
         decayby = 3
      end
      effect:setPower(power-decayby)
      target:delMod(tpz.mod.MDEF, decayby)
   end
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MDEF, effect:getPower())
end
