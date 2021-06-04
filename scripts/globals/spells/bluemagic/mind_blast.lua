-----------------------------------------
-- Spell: Mind Blast
-- Deals lightning damage to an enemy. Additional effect: Paralysis
-- Spell cost: 82 MP
-- Monster Type: Demons
-- Spell Type: Magical (Lightning)
-- Blue Magic Points: 4
-- Stat Bonus: MP+5 MND+1
-- Level: 73
-- Casting Time: 3 seconds
-- Recast Time: 30 seconds
-- Magic Bursts on: Impaction, Fragmentation, and Light
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
    local multi = 3.0
    if (caster:hasStatusEffect(tpz.effect.AZURE_LORE)) then
        multi = multi + 2.0
    end
    params.attackType = tpz.attackType.MAGICAL
    params.damageType = tpz.damageType.LIGHTNING
    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 1.0
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.multiplier = multi
    params.tMultiplier = 1.5
    params.duppercap = 75
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.4
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    local resist = applyResistance(caster, target, spell, params)
    local damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)


    if (damage > 0 and resist >= 0.5) then
        local typeEffect = tpz.effect.PARALYSIS
        target:addStatusEffect(typeEffect, 20, 0, getBlueEffectDuration(caster, resist, typeEffect)) -- https://www.bg-wiki.com/bg/Mind_Blast says 20%
    end

    return damage
end
