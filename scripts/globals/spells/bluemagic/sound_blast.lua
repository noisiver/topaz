-----------------------------------------
-- Spell: Sound Blast
-- Lowers Intelligence of enemies within range.
-- Spell cost: 25 MP
-- Monster Type: Birds
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 1
-- Stat Bonus: None
-- Level: 32
-- Casting Time: 4 seconds
-- Recast Time: 30 seconds
-- Magic Bursts on: Liquefaction, Fusion, and Light
-- Combos: Magic Attack Bonus
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
    local typeEffect = tpz.effect.INT_DOWN
    local params = {}
    params.diff = caster:getStat(tpz.mod.INT)-target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.effect = tpz.effect.INT_DOWN
    local resist = applyResistanceEffect(caster, target, spell, params)
    local duration = 90 * resist
	local level = (caster:getMainLvl()  / 5)
	local power = level 
	local aquan = (target:getSystem() == 2)
	local amorph = (target:getSystem() == 1)
	
	if aquan then
		params.bonus = 25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
	elseif amorph then
		params.bonus = -25
	end

    typeEffect = tpz.effect.INT_DOWN

    if target:hasStatusEffect(typeEffect) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        return typeEffect
    end

    params.effect = typeEffect
    if BlueTryEnfeeble(caster, target, spell, 1, power, 3, 180, params) then
        spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return typeEffect
end

