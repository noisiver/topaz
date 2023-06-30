---------------------------------------------
--  Suctorial Tentacle
--
--  Description: Poisons and binds a single target.
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadows
--  Range: Unknown radial
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    skill:setMsg(MobStatusEffectMove(mob, target, tpz.effect.POISON, 10, 3, 90))
    MobStatusEffectMove(mob, target, tpz.effect.BIND, 1, 0, 90)
    return tpz.effect.POISON
end
