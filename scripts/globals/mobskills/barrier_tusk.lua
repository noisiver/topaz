---------------------------------------------
-- Barrier Tusk
-- Enhances defense and magic defense (40% DT)
-- Marids will only use Barrier Tusk if at least one of their tusks remain unbroken
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.PHALANX) then
		return 1
	end
	
    if mob:AnimationSub() == 0 then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    skill:setMsg(MobBuffMove(mob, tpz.effect.PHALANX, 0, 0, 90))
    mob:getStatusEffect(tpz.effect.PHALANX):unsetFlag(tpz.effectFlag.DISPELABLE)
    return tpz.effect.PHALANX
end
