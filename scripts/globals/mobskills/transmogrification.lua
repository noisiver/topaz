---------------------------------------------
--  Mind Wall
--
--  Description: Activates a shield to absorb all incoming magical damage.
--  Type: Magical
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:AnimationSub() == 0) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)

	mob:addStatusEffectEx(tpz.effect.PHYSICAL_SHIELD, 0, 3, 0, 30)
    skill:setMsg(tpz.msg.basic.NONE)

    return 0
end
