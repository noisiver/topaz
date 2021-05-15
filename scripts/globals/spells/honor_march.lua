-----------------------------------------
-- Spell: Honor March
-- Gives party members Haste and Attack
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    --local power = 43
    local power = 25
    local subpower = 300


    return tpz.effect.HONOR_MARCH
end
