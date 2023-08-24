-----------------------------------------
-- Spell: Bloodrake
-- Delivers a threefold attack. Damage varies with TP. Additional effect: HP Drain.
-- Spell cost: 48 MP
-- Monster Type: Undead
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 5
-- Stat Bonus: DEX+1, CHR+1, HP+5
-- Level: 60
-- Casting Time: 0.5 seconds
-- Recast Time: 23.75 seconds
-- Skillchain Properties: Impaction (can open Liquefaction or Detonation can close Impaction or Fusion)
-- Combos: Accuracy Bonus
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.tpmod = TPMOD_ATTACK
    params.attackType = tpz.attackType.PHYSICAL
    params.damageType = tpz.damageType.SLASHING
    params.scattr = SC_IMPACTION
    params.numhits = 3
    params.multiplier = 1.0
    params.tp150 = 1.1375
    params.tp300 = 1.6
    params.azuretp = 1.6
    params.duppercap = 80 
    params.str_wsc = 0.3
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.3
    params.chr_wsc = 0.0
    params.attkbonus = 1.5
    damage = BluePhysicalSpell(caster, target, spell, params)
	local arcana = (target:getSystem() == 3)
	
	if arcana then
		damage = damage * (1.25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION)/100 + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)/100)
	end
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    if not target:isUndead() and not caster:hasStatusEffect(tpz.effect.CURSE_II) and (damage > 0) then
        caster:addHP(damage)
    end

    return damage
end
