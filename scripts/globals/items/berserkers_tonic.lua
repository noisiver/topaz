-----------------------------------------
-- ID: 5851
-- Item: Berserkers Tonic
-- Item Effect: Increases double attack rate by 25%
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/msg")

--function onItemCheck(target)
    --if (target:hasStatusEffect(tpz.effect.MEDICINE)) then
      --  return tpz.msg.basic.ITEM_NO_USE_MEDICATED
    --end
  --  return 0
--end

function onItemUse(target)
    target:addStatusEffect(tpz.effect.DOUBLE_ATTACK, 25, 0, 1800)
end
