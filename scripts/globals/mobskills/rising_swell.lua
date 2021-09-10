---------------------------------------------
--  Rising Swell
--
--  Description: Strips all players in an area of effect of all equipment. 
--  Type:  Magical
--
--  Utsusemi/Blink absorb: Ignores Shadows.
--  Range: 30' radial
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    if (mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 0
    end
    return 1
end



function onMobWeaponSkill(target, mob, skill)

for i = tpz.slot.MAIN, tpz.slot.BACK do
        target:unequipItem(i)
    end
    target:addStatusEffectEx(tpz.effect.ENCUMBRANCE_I, tpz.effect.ENCUMBRANCE_I, 0xFFFF, 0, 60)
end
