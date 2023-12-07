-----------------------------------------
-- Spell: Sacrifice
--
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local count = 1

    local removables =
    {
        tpz.effect.FLASH, tpz.effect.BLINDNESS, tpz.effect.ELEGY, tpz.effect.REQUIEM, tpz.effect.PARALYSIS, tpz.effect.POISON,
        tpz.effect.CURSE_I, tpz.effect.CURSE_II, tpz.effect.DISEASE, tpz.effect.PLAGUE, tpz.effect.WEIGHT, tpz.effect.BIND,
        tpz.effect.BIO, tpz.effect.DIA, tpz.effect.BURN, tpz.effect.FROST, tpz.effect.CHOKE, tpz.effect.RASP, tpz.effect.SHOCK, tpz.effect.DROWN,
        tpz.effect.STR_DOWN, tpz.effect.DEX_DOWN, tpz.effect.VIT_DOWN, tpz.effect.AGI_DOWN, tpz.effect.INT_DOWN, tpz.effect.MND_DOWN,
        tpz.effect.CHR_DOWN, tpz.effect.ADDLE, tpz.effect.SLOW, tpz.effect.HELIX, tpz.effect.ACCURACY_DOWN, tpz.effect.ATTACK_DOWN,
        tpz.effect.EVASION_DOWN, tpz.effect.DEFENSE_DOWN, tpz.effect.MAGIC_ACC_DOWN, tpz.effect.MAGIC_ATK_DOWN, tpz.effect.MAGIC_EVASION_DOWN,
        tpz.effect.MAGIC_DEF_DOWN, tpz.effect.CRIT_HIT_EVASION_DOWN, tpz.effect.MAX_TP_DOWN, tpz.effect.MAX_MP_DOWN, tpz.effect.MAX_HP_DOWN,
        tpz.effect.SLUGGISH_DAZE_1, tpz.effect.SLUGGISH_DAZE_2, tpz.effect.SLUGGISH_DAZE_3, tpz.effect.SLUGGISH_DAZE_4, tpz.effect.SLUGGISH_DAZE_5,
        tpz.effect.LETHARGIC_DAZE_1, tpz.effect.LETHARGIC_DAZE_2, tpz.effect.LETHARGIC_DAZE_3, tpz.effect.LETHARGIC_DAZE_4, tpz.effect.LETHARGIC_DAZE_5,
        tpz.effect.WEAKENED_DAZE_1, tpz.effect.WEAKENED_DAZE_2, tpz.effect.WEAKENED_DAZE_3, tpz.effect.WEAKENED_DAZE_4, tpz.effect.WEAKENED_DAZE_5
    }

    -- remove one effect and add it to me
    for i, effect in ipairs(removables) do

        if (target:hasStatusEffect(effect)) then
            local currentEffect = target:getStatusEffect(effect)
            local effectFlags = currentEffect:getFlag()
            if (bit.band(effectFlags, tpz.effectFlag.WALTZABLE) ~= 0) or (currentEffect == tpz.effect.PETRIFICATION) then
                spell:setMsg(tpz.msg.basic.MAGIC_ABSORB_AILMENT)

                local statusEffect = target:getStatusEffect(effect)

                -- only add it to me if I don't have it
                if (caster:hasStatusEffect(effect) == false) then
                    caster:addStatusEffect(effect, statusEffect:getPower(), statusEffect:getTickCount(), statusEffect:getDuration())
                end

                target:delStatusEffectSilent(effect)
                return 1
            end
        end
    end

    spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    return 0
end
