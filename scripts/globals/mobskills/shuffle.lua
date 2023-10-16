---------------------------------------------
-- Shuffle
-- Dispels a single buff at random (which could be food)<-Pending verification. It does not reset hate.
-- Notes: Only used by NM Cardians.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:isNM() then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local effect = MobDispelMove(mob, target, skill, tpz.magic.ele.DARK, tpz.effectFlag.DISPELABLE)

    if (effect == tpz.effect.NONE) then
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT) -- no effect
    else
        skill:setMsg(tpz.msg.basic.SKILL_ERASE)
    end
    return effect
end
