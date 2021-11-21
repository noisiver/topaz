---------------------------------------------
-- Boiling Blood
-- Increases attack, magic attack, magic defense, defense and grants a haste effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.BERSERK) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BERSERK
    local typeEffectTwo = tpz.effect.HASTE
    local typeEffectThree = tpz.effect.MAGIC_ATK_BOOST
    local typeEffectFour = tpz.effect.MAGIC_DEF_BOOST
    MobBuffMove(mob, typeEffect, 50, 0, 180)
    MobBuffMove(mob, typeEffectThree, 25, 0, 180)
    MobBuffMove(mob, typeEffectFour, 25, 0, 180)
    skill:setMsg(MobBuffMove(mob, typeEffectTwo, 2000, 0, 180)) 
    return typeEffectTwo
end
