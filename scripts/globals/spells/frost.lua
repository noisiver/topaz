-----------------------------------------
-- Spell: Frost
-- Deals ice damage that lowers an enemy's agility and gradually reduces its HP.
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

    if (target:getStatusEffect(tpz.effect.BURN) ~= nil) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    else
        local dINT = caster:getStat(tpz.mod.INT)-target:getStat(tpz.mod.INT)
        local params = {}
        params.diff = dINT
        params.attribute = tpz.mod.INT
        params.skillType = 36
        params.bonus = 0
        params.effect = tpz.effect.FROST
        local resist = applyResistanceEffect(caster, target, spell, params)
        if (resist <= 0.5) then
            spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
        else
            if (target:getStatusEffect(tpz.effect.CHOKE) ~= nil) then
                target:delStatusEffectSilent(tpz.effect.CHOKE)
            end
            local sINT = caster:getStat(tpz.mod.INT)
            local DOT = getElementalDebuffDOT(sINT)
            local effect = target:getStatusEffect(tpz.effect.FROST)
            local noeffect = false
            if (effect ~= nil) then
                if (effect:getPower() >= DOT) then
                    noeffect = true
                end
            end
            if (noeffect) then
                spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
            else
                if (effect ~= nil) then
                    target:delStatusEffectSilent(tpz.effect.FROST)
                end
                spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB)
                CheckForMagicBurst(caster, spell, target)
                local duration = math.floor(ELEMENTAL_DEBUFF_DURATION * resist)
                duration = duration + caster:getMerit(tpz.merit.ELEMENTAL_DEBUFF_DURATION)

                local mbonus = caster:getMerit(tpz.merit.ELEMENTAL_DEBUFF_EFFECT)
                DOT = DOT + mbonus/2 -- Damage
                target:addStatusEffect(tpz.effect.FROST, DOT, 3, duration)
            end
        end
    end

    return tpz.effect.FROST

end
