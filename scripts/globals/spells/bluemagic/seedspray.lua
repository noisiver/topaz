-----------------------------------------
-- Spell: Seedspray
-- Delivers a threefold attack. Additional effect: Weakens defense. Daamge varies with TP.
-- Spell cost: 61 MP
-- Monster Type: Plantoids
-- Spell Type: Physical (Ranged)
-- Blue Magic Points: 2
-- Stat Bonus: VIT+1
-- Level: 61
-- Casting Time: 4 seconds
-- Recast Time: 35 seconds
-- Skillchain Element(s): Ice (Primary) and Wind (Secondary) - (can open Impaction, Compression, Fragmentation, Scission or Gravitation can close Induration or Detonation)
-- Combos: Beast Killer
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
    params.tpmod = TPMOD_DAMAGE
    params.attackType = tpz.attackType.RANGED
    params.damageType = tpz.damageType.RANGED
    params.scattr = SC_GRAVITATION
    params.numhits = 3
    params.multiplier = 1.36
    params.tp150 = 2.08
    params.tp300 = 2.36
    params.azuretp = 2.61
    params.duppercap = 80 -- D upper >=69
    params.str_wsc = 0.2
    params.dex_wsc = 0.2
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
	params.attkbonus = 1.25
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	local beast = (target:getSystem() == 6)
	local vermin = (target:getSystem() == 20)
	
	if beast then
		damage = damage * (1.25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION)/100 + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)/100)
		params.bonus = 25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
	elseif vermin then
		damage = damage * 0.75
		params.bonus = -25
	end


    params.effect = tpz.effect.DEFENSE_DOWN
    BlueTryEnfeeble(caster, target, spell, damage, 8, 0, 180, params)

    return damage
end
