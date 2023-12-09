 -----------------------------------------
-- Spell: Full cure
-- Fully restore a target's HP and remove all negative status effects.
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local cureAmount = target:getMaxHP()

    -- Cap cure amount at targets missing HP
    local diff = (target:getMaxHP() - target:getHP())
    if (cureAmount > diff) then
        cureAmount = diff
    end

    target:removeAllNegativeEffects()
    target:addHP(cureAmount)
    target:wakeUp()
    caster:updateEnmityFromCure(target, cureAmount)

    return cureAmount
end
