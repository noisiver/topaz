-----------------------------------------
-- Spell: Terror Touch
-- Additional effect: Weakens attacks. Accuracy varies with TP
-- Spell cost: 62 MP
-- Monster Type: Undead
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 3
-- Stat Bonus: HP-5 MP+10
-- Level: 40
-- Casting Time: 3.25 seconds
-- Recast Time: 21 seconds
-- Duration: 60~ seconds
-- Skillchain Element(s): Dark (Primary) and Water (Secondary) - (can open Transfixion, Detonation, Impaction, or Induration can close Compression, Reverberation, or Gravitation)
-- Combos: Defense Bonus
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
    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0
    params.effect = tpz.effect.ATTACK_DOWN
    local resist = applyResistance(caster, target, spell, params)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.tpmod = TPMOD_ACC
    params.attackType = tpz.attackType.PHYSICAL
    params.damageType = tpz.damageType.HTH
    params.scattr = SC_COMPRESSION
    params.numhits = 1
    params.multiplier = 1.5
    params.tp150 = 1.5
    params.tp300 = 1.5
    params.azuretp = 1.5
    params.duppercap = 41
    params.str_wsc = 0.0
    params.dex_wsc = 0.2
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.2
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    if (damage > 0 and resist >= 0.5) then
		if (target:hasStatusEffect(tpz.effect.ATTACK_DOWN)) then
			spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
		else
			target:addStatusEffect(tpz.effect.ATTACK_DOWN, 25, 0, 360)
		end
	end

    return damage
end
