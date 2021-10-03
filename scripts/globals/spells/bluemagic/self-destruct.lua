-----------------------------------------
-- Spell: Self-Destruct
-- Sacrifices HP to damage enemies within range. Affects caster with Weakness
-- Spell cost: 100 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 3
-- Stat Bonus: STR+2
-- Level: 50
-- Casting Time: 3.25 seconds
-- Recast Time: 21 seconds
-- Magic Bursts on: Liquefaction, Fusion, and Light
-- Combos: Auto Refresh
-----------------------------------------

require("scripts/globals/settings")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/bluemagic")

function onMagicCastingCheck(caster, target, spell)
    caster:setLocalVar("self-destruct_hp", caster:getHP())
    return 0
end

function onSpellCast(caster, target, spell)
    local params = {}

    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)

    params.attribute = tpz.mod.INT

    params.skillType = tpz.skill.BLUE_MAGIC

    params.bonus = 0

    local resist = applyResistance(caster, target, spell, params)
    local params = {}
    local multi = 3.0
    if (caster:hasStatusEffect(tpz.effect.AZURE_LORE)) then
        multi = multi + 2.0
    end
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.attackType = tpz.attackType.MAGICAL
    params.damageType = tpz.damageType.FIRE
    params.multiplier = multi
    params.tMultiplier = 1.0
    params.duppercap = 200
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.4
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
	

	
	if (target:isUndead()) then
		damage = damage * (1.25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION)/100 + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)/100)
		params.bonus = 25
	end
	
    local duration = 300
    local playerHP = caster:getLocalVar("self-destruct_hp")
    local damage = playerHP - 1

    if damage > 0 then
        target:takeSpellDamage(caster, spell, playerHP, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
        caster:setHP(1)
        caster:delStatusEffect(tpz.effect.WEAKNESS)
        caster:addStatusEffect(tpz.effect.WEAKNESS, 1, 0, duration)
    end

    return damage
end
