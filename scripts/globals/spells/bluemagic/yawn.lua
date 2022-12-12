-----------------------------------------
-- Spell: Yawn
-- Puts all enemies within range to sleep
-- Spell cost: 55 MP
-- Monster Type: Birds
-- Spell Type: Magical (Light)
-- Blue Magic Points: 3
-- Stat Bonus: CHR+1, HP+5
-- Level: 64
-- Casting Time: 3 seconds
-- Recast Time: 60 seconds
-- Duration: 90 seconds
-- Magic Bursts on: Transfixion, Fusion, Light
-- Combos: Resist Sleep
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local dINT = (caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))
    local params = {}
    params.diff = dINT
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0
    params.effect = tpz.effect.LULLABY
    local resist = applyResistanceEffectEffect(caster, target, spell, params)
	local aquan = (target:getSystem() == 2)
	local amorph = (target:getSystem() == 1)
	
	if aquan then
		params.bonus = 25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
	elseif amorph then
		params.bonus = -25
	end
    local duration = 90 * resist

    -- Can't overwrite any sleep
    if hasSleepT1Effect(target) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        return typeEffect
    end


    if ((target:isFacing(caster))) then
        TryApplyEffect(caster, target, spell, params.effect, 1, 0, duration, resist, 0.5)
    end

    return tpz.effect.SLEEP_I
end
