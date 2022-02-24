-----------------------------------------
--  ID: 5265
--  Item: Mistmelt
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    if target:getID() == 16904202 then
        return 0
    end
    
    return 1
end

function onItemUse(target)
    target:AnimationSub(2)
    target:SetMobSkillAttack(0)
    target:delStatusEffectSilent(tpz.effect.TOO_HIGH)
    target:setLocalVar("changeTime", target:getBattleTime())
end