-----------------------------------------
-- Spell: Queasyshroom
-- Additional effect: Poison. Duration of effect varies with TP
-- Spell cost: 20 MP
-- Monster Type: Plantoids
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 2
-- Stat Bonus: HP-5, MP+5
-- Level: 8
-- Casting Time: 2 seconds
-- Recast Time: 15 seconds
-- Skillchain Element(s): Dark (can open Transfixion or Detonation can close Compression or Gravitation)
-- Combos: None
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
	spell:setFlag(tpz.magic.spellFlag.WIPE_SHADOWS)
    
	return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 1.0
    local resist = applyResistance(caster, target, spell, params)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.tpmod = TPMOD_CRITICAL
    params.attackType = tpz.attackType.RANGED
    params.damageType = tpz.damageType.PIERCING
    params.scattr = SC_DARK
    params.numhits = 1
    params.multiplier = 1.75
    params.tp150 = 1.75
    params.tp300 = 1.75
    params.azuretp = 1.75
    params.duppercap = 15
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.20
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    local damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	local beast = (target:getSystem() == 6)
	local vermin = (target:getSystem() == 20)
	
	if beast then
		params.bonus = 25
	elseif vermin then
		params.bonus = -25
	end

    if (damage > 0 and resist >= 0.5) then
        local typeEffect = tpz.effect.POISON
	    local level = math.floor((caster:getMainLvl()  / 5)) +3
	    local power = level 
        target:addStatusEffect(typeEffect, power, 3, getBlueEffectDuration(caster, resist, typeEffect, true))
	else
		target:delStatusEffect(tpz.effect.BLINK)
        target:delStatusEffect(tpz.effect.COPY_IMAGE)
    end
	

    return damage
end
