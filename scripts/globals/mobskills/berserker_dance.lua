---------------------------------------------
-- Berserker Dance
-- Family: Orc(NM)
-- Description: Self haste.(55%) + Increased damage Taken + Magic Evasion Down
-- Type: Enhancing
-- Can be dispelled: Yes
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: Undispellable
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.HASTE) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local power = 5500 
    local duration = 300
    local typeEffect = tpz.effect.HASTE
    local typeEffect2 = tpz.effect.MAGIC_EVASION_DOWN
    local power2 = 50

    MobBuffMove(mob, typeEffect2, 50, 0, duration)
    mob:addStatusEffectEx(tpz.effect.INCREASED_DAMAGE_TAKEN, tpz.effect.INCREASED_DAMAGE_TAKEN, 1, 0, 180)
    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration))

    local effect1 = mob:getStatusEffect(typeEffect)
    effect1:unsetFlag(tpz.effectFlag.DISPELABLE)
    local effect2 = mob:getStatusEffect(typeEffect2)
    effect2:unsetFlag(tpz.effectFlag.DISPELABLE)

    return typeEffect
end
