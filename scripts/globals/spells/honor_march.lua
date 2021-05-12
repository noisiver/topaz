-----------------------------------------
-- Spell: Honor March
-- Gives party members Haste
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
   target:addMod(tpz.mod.HASTE_MAGIC, 2500, 0, 300)
   target:addMod(tpz.mod.ATT, 100, 0, 300)
end
