-----------------------------------------
-- Spell: Corrosive Ooze
-- Deals water damage to an enemy. Additional Effect: Attack Down and Defense Down
-- Spell cost: 55 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Water)
-- Blue Magic Points: 4
-- Stat Bonus: HP-10 MP+10
-- Level: 66
-- Casting Time: 5 seconds
-- Recast Time: 30 seconds
--
-- Combos: Clear Mind
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
    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    local multi = 2.125
    if (caster:hasStatusEffect(tpz.effect.AZURE_LORE)) then
        multi = multi + 0.50
    end
    params.attackType = tpz.attackType.MAGICAL
    params.damageType = tpz.damageType.WATER
    params.multiplier = multi
    params.tMultiplier = 2.0
    params.duppercap = 80
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.4
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.NO_ENMITY = true
	local bird = (target:getSystem() == 8)
	local aquan = (target:getSystem() == 2)
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
	-- add correlation bonus
	if bird then
	 	dmg = dmg * 1.25
		params.bonus = 25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
	elseif aquan then
		dmg = dmg * 0.75
		params.bonus = -25
	end
    damage = BlueFinalAdjustments(caster, target, spell, damage, params) -- Corrosive has static enmity https://www.bg-wiki.com/ffxi/Corrosive_Ooze

    params.effect = tpz.effect.ATTACK_DOWN
    BlueTryEnfeeble(caster, target, spell, damage, 10, 0, 180, params)
    params.effect = tpz.effect.DEFENSE_DOWN
    BlueTryEnfeeble(caster, target, spell, damage, 10, 0, 180, params)

    return damage
end
