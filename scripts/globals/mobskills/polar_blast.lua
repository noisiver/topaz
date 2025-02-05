---------------------------------------------
--  Polar Blast
--
--  Description: Deals Ice damage to enemies within a fan-shaped area. Additional effect: Paralyze
--  Type: Breath
--  Ignores Shadows
--  Range: Unknown Cone
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/utils")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    if(mob:getFamily() == 316) then
        local mobSkin = mob:getModelId()

        if (mobSkin == 1796) then
            return 0
        else
            return 1
        end
    end

    if (mob:AnimationSub() < 1) then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = MobHPBasedMove(mob, target, 0.10, 1, tpz.magic.ele.ICE, 1000)
    dmgmod = utils.conalDamageAdjustment(mob, target, skill, dmgmod, 0.50)

    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.ICE, MOBPARAM_IGNORE_SHADOWS)

    MobStatusEffectMove(mob, target, tpz.effect.PARALYSIS, 25, 0, 300)

    target:takeDamage(dmg, mob, tpz.attackType.BREATH, tpz.damageType.ICE)

    if (mob:getFamily() == 313 and bit.band(mob:getBehaviour(), tpz.behavior.NO_TURN) == 0 and mob:AnimationSub() == 1) then -- re-enable no turn if third head is dead (Tinnin), else it's re-enabled after the upcoming Pyric Blast
        mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
    end

    return dmg
end
