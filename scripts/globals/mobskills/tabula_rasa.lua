---------------------------------------------
-- Tabula Rasa
-- Grants manifestation effect on all spells while active
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    MobBuffMove(mob, tpz.effect.TABULA_RASA, 1, 0, 60)

    skill:setMsg(tpz.msg.basic.USES)

    return tpz.effect.TABULA_RASA
end
