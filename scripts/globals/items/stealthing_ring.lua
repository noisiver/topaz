-----------------------------------------
-- ID: 26168
-- Stealthing Ring
--  Enchantment: "Sneak and Invisible"
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    local sneakDura = 300 + target:getMod(tpz.mod.SNEAK_DURATION)
    local invisDura = 300 + target:getMod(tpz.mod.INVISIBLE_DURATION)

    target:delStatusEffectSilent(tpz.effect.SNEAK)
    target:delStatusEffectSilent(tpz.effect.INVISIBLE)
    target:addStatusEffect(tpz.effect.SNEAK, 0, 10, math.floor(sneakDura * SNEAK_INVIS_DURATION_MULTIPLIER))
    target:addStatusEffect(tpz.effect.INVISIBLE, 0, 10, math.floor(invisDura * SNEAK_INVIS_DURATION_MULTIPLIER))
end
