---------------------------------------------
--  Extremely Bad Breath
--  Description: Instant KO. ~10 yalm radius AOE.
--  Utsusemi/Blink absorb: Ignores shadows.
---------------------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if target:isUndead() or target:hasStatusEffect(tpz.effect.MAGIC_SHIELD) or target:hasStatusEffect(tpz.effect.FEALTY)
    or math.random(0, 99) < target:getMod(tpz.mod.DEATHRES) then
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
        return 0
    end

    target:setHP(0)
    return 0
end
