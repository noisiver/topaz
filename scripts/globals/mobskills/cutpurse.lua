---------------------------------------------
-- Cutpurse
-- Description: Randomly encumbers one piece of equipment.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
-- todo make a random for which gear to remove and how many pieces
   target:addStatusEffectEx(tpz.effect.ENCUMBRANCE_I, tpz.effect.ENCUMBRANCE_I, 0x002, 0, 60)
end
