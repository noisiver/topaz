---------------------------------------------------
--  Mucilaginous Ooze
--  Family: Slugs
--  Description: A dusky slime inflicts slow and a long encumberance.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Cone
--  Notes:
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.SLOW
    local duration = 120

    MobStatusEffectMove(mob, target, typeEffect, 2500, 0, duration)

    for i = tpz.slot.MAIN, tpz.slot.BACK do
        target:unequipItem(i)
    end
    target:addStatusEffectEx(tpz.effect.ENCUMBRANCE_I, tpz.effect.ENCUMBRANCE_I, 0xFFFF, 0, 60)
	
    return typeEffect
end
