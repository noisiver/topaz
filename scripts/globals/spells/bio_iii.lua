-----------------------------------------
-- Spell: Bio III
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
	local meritBonus = caster:getMerit(tpz.merit.BIO_III)
    local skillLvl = caster:getSkillLevel(tpz.skill.DARK_MAGIC)
    local basedmg = skillLvl / 4
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
    -- Softcaps at 62, should always do at least 1
    dmg = utils.clamp(dmg, 1, 62)
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

    -- Calculate duration
    local duration = 30 + (meritBonus - 30)
	
	if caster:isMob() then
		duration = 180
	end

    -- Check for Dia
    local dia = target:getStatusEffect(tpz.effect.DIA)

    -- Calculate DoT effect
    -- http://wiki.ffo.jp/html/1954.html
    -- this is a tiered calculation that has at least three tiers,
    -- so I'll use breakpoints for human readability
    local dotdmg = 0
    if     skillLvl > 400 then dotdmg = 105
    elseif skillLvl > 373 then dotdmg = 100
    elseif skillLvl > 346 then dotdmg = 95
    elseif skillLvl > 319 then dotdmg = 90
    elseif skillLvl > 291 then dotdmg = 85
    elseif skillLvl > 280 then dotdmg = 80
    elseif skillLvl > 269 then dotdmg = 75
    elseif skillLvl > 258 then dotdmg = 70
    elseif skillLvl > 246 then dotdmg =  65
    elseif skillLvl > 211 then dotdmg =  55
    elseif skillLvl > 171 then dotdmg =  50
    elseif skillLvl > 131 then dotdmg =  45
    else                       dotdmg =  40
    end

    if caster:isMob() then -- Don't let this scale out of control from mobs
        dotdmg = math.floor(dotdmg * 0.75)
    end

    -- Do it!
    target:delStatusEffectSilent(tpz.effect.DIA)
    target:addStatusEffect(tpz.effect.BIO, dotdmg, 3, duration, 0, 15, 3)
    spell:setMsg(tpz.msg.basic.MAGIC_DMG)

    return final
end
