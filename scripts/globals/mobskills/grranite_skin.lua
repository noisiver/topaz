---------------------------------------------
-- Granite Skin
--
-- Description: The enemy gains Physical Shield from the front only.
-- Type: Enhancing
--
-- Range: Self
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    -- addEx to pervent dispel
    mob:addStatusEffectEx(tpz.effect.PHYSICAL_SHIELD, 0, 1, 0, 45)
    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)

    return tpz.effect.PHYSICAL_SHIELD
end
