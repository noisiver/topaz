---------------------------------------------
-- Fanatic Dance
-- Family: Orc
-- Description: Charms all targets in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: N/A
-- Range: AoE around user
-- Notes: Dynamis NM Orcs only
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:isInDynamis() and mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
	local message = tpz.msg.basic.SKILL_MISS
    local typeEffect = tpz.effect.CHARM_I
    local power = 0

    if (not target:isPC()) then
        skill:setMsg(tpz.msg.basic.SKILL_MISS)
        return typeEffect
    end

    local msg = MobGazeMove(mob, target, typeEffect, power, 3, 150)
    if target:hasStatusEffect(tpz.effect.FEALTY) then
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
    elseif (msg == tpz.msg.basic.SKILL_ENFEEB_IS) then
        mob:charm(target)
    else
         skill:setMsg(msg)
    end

    return typeEffect
end
