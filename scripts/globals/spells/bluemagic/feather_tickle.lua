-----------------------------------------
-- Spell: Feather Tickle
-- Paralyzes an enemy(Para II scaling)
-- Spell cost: 48 MP
-- Monster Type: Birds
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 3
-- Stat Bonus: AGI+1
-- Level: 64
-- Casting Time: 4 seconds
-- Recast Time: 26 seconds
-- Magic Bursts on: Detonation, Fragmentation, and Light
-- Combos: Clear Mind
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0
    params.effect = tpz.effect.PARALYSIS
    local resist = applyResistanceEffect(caster, target, spell, params)
	local cap = target:getTP() * 0.4
	local aquan = (target:getSystem() == 2)
	local amorph = (target:getSystem() == 1)
    local dMND = caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND)
    local power = utils.clamp(math.floor(dMND / 4) + 20, 10, 30)
	
	if aquan then
		params.bonus = 25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
	elseif amorph then
		params.bonus = -25
	end
	

    if BlueTryEnfeeble(caster, target, spell, 1, power, 0, 180, params) then
        spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end
	return params.effect 
end
