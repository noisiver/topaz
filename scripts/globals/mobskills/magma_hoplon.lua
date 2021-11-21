---------------------------------------------
-- Magma_Hoplon
-- Covers the user in fiery spikes and absorbs damage. Enemies that hit it take fire damage.
-- Stoneskin portion cannot be removed with dispel.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.STONESKIN) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffectOne = tpz.effect.STONESKIN
    local typeEffectTwo = tpz.effect.BLAZE_SPIKES
    skill:setMsg(MobBuffMove(mob, typeEffectOne, 1000, 0, 300))
    MobBuffMove(mob, typeEffectTwo, 30, 0, 180)
    local effect1 = mob:getStatusEffect(typeEffectOne)
    effect1:unsetFlag(tpz.effectFlag.DISPELABLE)

    return typeEffectOne
end
