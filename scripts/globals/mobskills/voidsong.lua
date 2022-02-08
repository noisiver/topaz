---------------------------------------------
--  Voidsong
--
--  Description: Removes all status effects in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 20' radial
--  Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    -- can only used if not silenced
    if (mob:hasStatusEffect(tpz.effect.SILENCE) == false) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dispel =  target:dispelAllStatusEffect(bit.bor(tpz.effectFlag.DISPELABLE, tpz.effectFlag.FOOD))

    if (dispel == 0) then
        -- no effect
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT) -- no effect
    else
        skill:setMsg(tpz.msg.basic.DISAPPEAR_NUM)
    end

    return dispel
end
