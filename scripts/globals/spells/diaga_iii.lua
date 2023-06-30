-----------------------------------------
-- Spell: Diaga III
-- Lowers an enemy's defense and gradually deals light elemental damage.
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local basedmg = caster:getSkillLevel(tpz.skill.ENFEEBLING_MAGIC) / 3
    local params = {}
    params.dmg = basedmg
    params.multiplier = 5
    params.skillType = tpz.skill.ENFEEBLING_MAGIC
    params.attribute = tpz.mod.MND
    params.hasMultipleTargetReduction = false
    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.ENFEEBLING_MAGIC
    params.bonus = 0

    -- Calculate raw damage
    local dmg = calculateMagicDamage(caster, target, spell, params)
    -- Softcaps at 60, should always do at least 1
    dmg = utils.clamp(dmg, 1, 60)
    -- Get resist multiplier (1x if no resist)
    local resist = applyResistance(caster, target, spell, params)
    -- Get the resisted damage
    dmg = dmg * resist
    -- Add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster, spell, target, dmg)
    -- Add in target adjustment
    dmg = adjustForTarget(target, dmg, spell:getElement())
	if dmg <= 0 then dmg = 1 end
    -- Add in final adjustments including the actual damage dealt
    local final = finalMagicAdjustments(caster, target, spell, dmg)

    -- Calculate duration and bonus
    local duration = calculateDuration(120, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    local dotBonus = caster:getMod(tpz.mod.DIA_DOT) -- Dia Wand
    local tier = 3

    if ShouldOverwriteDiaBio(caster, target, tpz.effect.DIA, tier) then
        target:addStatusEffect(tpz.effect.DIA, 3 + dotBonus, 3, duration, 0, 15, 3)
    end

    spell:setMsg(tpz.msg.basic.MAGIC_DMG)
    CheckForMagicBurst(caster, spell, target)

    return final
end
