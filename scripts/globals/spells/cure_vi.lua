-----------------------------------------
-- Spell: Cure VI
-- Restores target's HP.
-- Shamelessly stolen from http://members.shaw.ca/pizza_steve/cure/Cure_Calculator.html
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local divisor = 0
    local constant = 0
    local basepower = 0
    local power = 0
    local basecure = 0
    local final = 0

    local minCure = 600
    power = getCurePower(caster)
    if (power < 210) then
        divisor = 1.5
        constant = 600
        basepower = 90
    elseif (power < 300) then
        divisor =  0.9
        constant = 680
        basepower = 210
    elseif (power < 400) then
        divisor = 10/7
        constant = 780
        basepower = 300
    elseif (power < 500) then
        divisor = 2.5
        constant = 850
        basepower = 400
    elseif (power < 700) then
        divisor = 5/3
        constant = 890
        basepower = 500
    else
        divisor = 999999
        constant = 1010
        basepower = 0
    end

    if isValidHealTarget(caster, target) then
        basecure = getBaseCure(power, divisor, constant, basepower)
        final = getCureFinal(caster, spell, basecure, minCure, false)
        if caster:hasStatusEffect(tpz.effect.AFFLATUS_SOLACE) and target:hasStatusEffect(tpz.effect.STONESKIN) == false then
            local solaceStoneskin = 0
            local equippedBody = caster:getEquipID(tpz.slot.BODY)
            if (equippedBody == 11186) then
                solaceStoneskin = math.floor(final * 0.30)
            elseif (equippedBody == 11086) then
                solaceStoneskin = math.floor(final * 0.35)
            else
                solaceStoneskin = math.floor(final * 0.25)
            end

            solaceStoneskin = solaceStoneskin * (1 + caster:getMerit(tpz.merit.ANIMUS_SOLACE)/100)

            target:addStatusEffect(tpz.effect.STONESKIN, solaceStoneskin, 0, 25, 0, 0, 1)
        end
        final = final + (final * (target:getMod(tpz.mod.CURE_POTENCY_RCVD)/100))

        --Applying server mods....
        final = final * CURE_POWER

        local diff = (target:getMaxHP() - target:getHP())
        if (final > diff) then
            final = diff
        end
        target:restoreHP(final)

        target:wakeUp()
        caster:updateEnmityFromCure(target, final)
    else
        if (target:isUndead()) then
            spell:setMsg(tpz.msg.basic.MAGIC_DMG)
            local params = {}
            params.dmg = minCure
            params.multiplier = 1
            params.skillType = tpz.skill.HEALING_MAGIC
            params.attribute = tpz.mod.MND
            params.hasMultipleTargetReduction = false

            local dmg = calculateMagicDamage(caster, target, spell, params)*0.5
            local params = {}
            params.diff = caster:getStat(tpz.mod.MND)-target:getStat(tpz.mod.MND)
            params.attribute = tpz.mod.MND
            params.skillType = tpz.skill.HEALING_MAGIC
            params.bonus = 0
            local resist = applyResistance(caster, target, spell, params)
            dmg = dmg*resist
            dmg = addBonuses(caster, spell, target, dmg)
            dmg = adjustForTarget(target, dmg, spell:getElement())
            dmg = finalMagicAdjustments(caster, target, spell, dmg)
            final = dmg
            target:takeDamage(final, caster, tpz.attackType.MAGICAL, tpz.damageType.LIGHT)
            target:updateEnmityFromDamage(caster, final)
        elseif (caster:getObjType() == tpz.objType.PC) then
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        else
            -- e.g. monsters healing themselves.
            if (USE_OLD_CURE_FORMULA == true) then
                basecure = getBaseCureOld(power, divisor, constant)
            else
                basecure = getBaseCure(power, divisor, constant, basepower)
            end
            final = getCureFinal(caster, spell, basecure, minCure, false)
            local diff = (target:getMaxHP() - target:getHP())
            if (final > diff) then
                final = diff
            end
            target:addHP(final)
        end
    end

    local mpBonusPercent = (final*caster:getMod(tpz.mod.CURE2MP_PERCENT))/100
    if (mpBonusPercent > 0) then
        caster:addMP(mpBonusPercent)
    end

    return final
end
