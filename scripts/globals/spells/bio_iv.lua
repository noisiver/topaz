-----------------------------------------
-- Spell: Bio IV
-- Deals dark damage that weakens an enemy's attacks and gradually reduces its HP.
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/msg")
--------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local basedmg = caster:getSkillLevel(tpz.skill.DARK_MAGIC) / 4
    local params = {}
    params.dmg = basedmg
    params.multiplier = 3
    params.skillType = tpz.skill.DARK_MAGIC
    params.attribute = tpz.mod.INT
    params.hasMultipleTargetReduction = false
    params.diff = caster:getStat(tpz.mod.INT)-target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.DARK_MAGIC
    params.bonus = 1.0

    -- Calculate raw damage
    local dmg = calculateMagicDamage(caster, target, spell, params)
    -- Softcaps at 80, should always do at least 1
    dmg = utils.clamp(dmg, 1, 80)
    -- Get resist multiplier (1x if no resist)
    local resist = applyResistance(caster, target, spell, params)
    -- get the resisted damage
    dmg = dmg * resist
    -- Add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster, spell, target, dmg)
    -- Add in target adjustment
    dmg = adjustForTarget(target, dmg, spell:getElement())
	if dmg <= 0 then dmg = 1 end
    -- Add in final adjustments including the actual damage dealt
    local final = finalMagicAdjustments(caster, target, spell, dmg)

    -- Calculate duration
    local duration = 180

    -- Calculate DoT effect (rough, though fairly accurate)
        local dotdmg = 0
        if     skillLvl > 400 then dotdmg = 17
        elseif skillLvl > 373 then dotdmg = 16
        elseif skillLvl > 346 then dotdmg = 15
        elseif skillLvl > 319 then dotdmg = 14
        elseif skillLvl > 291 then dotdmg = 13
        elseif skillLvl > 280 then dotdmg = 12
        elseif skillLvl > 269 then dotdmg = 11
        elseif skillLvl > 258 then dotdmg = 10
        elseif skillLvl > 246 then dotdmg =  9
        elseif skillLvl > 211 then dotdmg =  8
        elseif skillLvl > 171 then dotdmg =  7
        elseif skillLvl > 131 then dotdmg =  6
        else                       dotdmg =  5
        end

    -- Do it!
    target:delStatusEffectSilent(tpz.effect.BIO)
    target:delStatusEffectSilent(tpz.effect.DIA)
    target:addStatusEffect(tpz.effect.BIO, dotdmg, 3, duration, 0, 20, 4)
    spell:setMsg(tpz.msg.basic.MAGIC_DMG)

    return final
end
