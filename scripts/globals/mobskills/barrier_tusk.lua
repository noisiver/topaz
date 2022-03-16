---------------------------------------------
-- Barrier Tusk
-- Enhances defense and magic defense
-- Marids will only use Barrier Tusk if at least one of their tusks remain unbroken
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.DEFENSE_BOOST) or mob:hasStatusEffect(tpz.effect.PHALANX) then
		return 1
	end
	
    if mob:AnimationSub() == 0 then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)

    if mob:getPool() == 2090 then -- Iriz Ima
        skill:setMsg(MobBuffMove(mob, tpz.effect.PHALANX, 0, 0, 90))
        mob:getStatusEffect(tpz.effect.PHALANX):unsetFlag(tpz.effectFlag.DISPELABLE)
        return tpz.effect.PHALANX
    end

    MobBuffMove(mob, tpz.effect.MAGIC_DEF_BOOST, 30, 0, 90)
    skill:setMsg(MobBuffMove(mob, tpz.effect.DEFENSE_BOOST, 100, 0, 90))

    return tpz.effect.DEFENSE_BOOST
end
