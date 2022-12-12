-----------------------------------------
-- Spell: Regurgitation
-- Deals Water damage to an enemy. Additional Effect: Bind
-- Spell cost: 69 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Water)
-- Blue Magic Points: 1
-- Stat Bonus: INT+1 MND+1 MP+3
-- Level: 68
-- Casting Time: 5 seconds
-- Recast Time: 24 seconds
-- Magic Bursts on: Reverberation, Distortion, and Darkness
-- Combos: Resist Gravity
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
    local resist = applyResistanceEffect(caster, target, spell, params)
    local multi = 2.5
    if (caster:hasStatusEffect(tpz.effect.AZURE_LORE)) then
        multi = multi * 1.83
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
    params.int_wsc = 0.0
    params.mnd_wsc = 0.4
    params.chr_wsc = 0.0
    params.NO_ENMITY = true
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    if (caster:isBehind(target, 15)) then -- guesstimating the angle at 15 degrees here
        damage = math.floor(damage * 1.25)
        -- printf("is behind mob")
    end
	local vermin = (target:getSystem() == 20)
	local beast = (target:getSystem() == 6)

	 if vermin then
		damage = damage * (1.25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION)/100 + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)/100)
		params.bonus = 25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
    elseif beast then
		damage = damage * 0.75
		params.bonus = -25
	end
	
    damage = BlueFinalAdjustments(caster, target, spell, damage, params) -- Regurgitation has static enmity https://www.bg-wiki.com/ffxi/Regurgitation
	
    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    params.effect = tpz.effect.BIND
    BlueTryEnfeeble(caster, target, spell, damage, 1, 0, 45, params)

    return damage
end
