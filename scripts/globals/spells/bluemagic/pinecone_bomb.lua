-----------------------------------------
-- Spell: Pinecone Bomb
-- Additional effect: Sleep. Duration of effect varies with TP
-- Spell cost: 48 MP
-- Monster Type: Plantoids
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 2
-- Stat Bonus: STR+1
-- Level: 36
-- Casting Time: 2.5 seconds
-- Recast Time: 26.5 seconds
-- Skillchain Element(s): Fire (can open Scission or Fusion and can close Liquefaction)
-- Combos: None
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------
function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local typeEffect = tpz.effect.SLEEP_I
    local params = {}
    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0
    params.effect = typeEffect
    local resist = applyResistance(caster, target, spell, params)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.tpmod = TPMOD_DURATION
    params.attackType = tpz.attackType.RANGED
    params.damageType = tpz.damageType.RANGED
    params.scattr = SC_LIQUEFACTION
    params.numhits = 1
    params.multiplier = 2.25
    params.tp150 = 2.25
    params.tp300 = 2.25
    params.azuretp = 2.25
    params.duppercap = 37
    params.str_wsc = 0.20
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.20
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    local damage = BluePhysicalSpell(caster, target, spell, params)
	local beast = (target:getSystem() == 6)
	local vermin = (target:getSystem() == 20)
	
	if aquan then
		beast = damage * 1.25
		params.bonus = 25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
	elseif amorph then
		vermin = damage * 0.75
		params.bonus = -25
	end
    local duration = 60 * resist
	
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    -- After damage is applied (which would have woken the target up from a
    -- preexisting sleep, if necesesary), apply the sleep effect for this spell.
    if (damage > 0 and resist >= 0.5) then
        target:addStatusEffect(typeEffect, 1, 0, duration)
    end

    return damage
end
