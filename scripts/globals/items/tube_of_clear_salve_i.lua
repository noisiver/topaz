-----------------------------------------
-- ID: 5837
-- Item: tube_of_clear_salve_i
-- Item Effect: Instantly removes 1-2 negative status effects at random from pet
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/msg")

function onItemCheck(target)
    if not target:hasPet() then
        return tpz.msg.basic.NO_TARGET_AVAILABLE
    end
    return 0
end

function onItemUse(target)
    local pet = target:getPet()
    local effects =
    {
        tpz.effect.FLASH, tpz.effect.BLINDNESS, tpz.effect.ELEGY, tpz.effect.REQUIEM, tpz.effect.PARALYSIS, tpz.effect.POISON,
        tpz.effect.CURSE_I, tpz.effect.DISEASE, tpz.effect.PLAGUE, tpz.effect.WEIGHT, tpz.effect.BIND,
        tpz.effect.BIO, tpz.effect.DIA, tpz.effect.BURN, tpz.effect.FROST, tpz.effect.CHOKE, tpz.effect.RASP, tpz.effect.SHOCK, tpz.effect.DROWN,
        tpz.effect.STR_DOWN, tpz.effect.DEX_DOWN, tpz.effect.VIT_DOWN, tpz.effect.AGI_DOWN, tpz.effect.INT_DOWN, tpz.effect.MND_DOWN,
        tpz.effect.CHR_DOWN, tpz.effect.ADDLE, tpz.effect.SLOW, tpz.effect.HELIX, tpz.effect.ACCURACY_DOWN, tpz.effect.ATTACK_DOWN,
        tpz.effect.EVASION_DOWN, tpz.effect.DEFENSE_DOWN, tpz.effect.MAGIC_ACC_DOWN, tpz.effect.MAGIC_ATK_DOWN, tpz.effect.MAGIC_EVASION_DOWN,
        tpz.effect.MAGIC_DEF_DOWN, tpz.effect.CRIT_HIT_EVASION_DOWN, tpz.effect.MAX_TP_DOWN, tpz.effect.MAX_MP_DOWN, tpz.effect.MAX_HP_DOWN,
        tpz.effect.SLUGGISH_DAZE_1, tpz.effect.SLUGGISH_DAZE_2, tpz.effect.SLUGGISH_DAZE_3, tpz.effect.SLUGGISH_DAZE_4, tpz.effect.SLUGGISH_DAZE_5,
        tpz.effect.LETHARGIC_DAZE_1, tpz.effect.LETHARGIC_DAZE_2, tpz.effect.LETHARGIC_DAZE_3, tpz.effect.LETHARGIC_DAZE_4, tpz.effect.LETHARGIC_DAZE_5,
        tpz.effect.WEAKENED_DAZE_1, tpz.effect.WEAKENED_DAZE_2, tpz.effect.WEAKENED_DAZE_3, tpz.effect.WEAKENED_DAZE_4, tpz.effect.WEAKENED_DAZE_5,
        tpz.effect.HELIX, tpz.effect.KAUSTRA, tpz.effect.SILENCE, tpz.effect.PETRIFICATION
    }

    local count = math.random(1, 2)
    local statusEffectTable = utils.shuffle(effects)

    local function removeStatus()
        for _, effect in ipairs(statusEffectTable) do
            if (pet:hasStatusEffect(effect)) then
                local currentEffect = pet:getStatusEffect(effect)
                local effectFlags = currentEffect:getFlag()
                if (bit.band(effectFlags, tpz.effectFlag.WALTZABLE) ~= 0) or (effect == tpz.effect.PETRIFICATION) then
                    if pet:delStatusEffect(effect) then return true end
                end
            end
        end
        if pet:eraseStatusEffect() ~= 255 then return true end
        return false
    end

    local removed = 0

    for i = 0, count do
        if not removeStatus() then break end
        removed = removed + 1
        if removed >= count then break end
    end

    if removed > 0 then
        target:messagePublic(tpz.msg.basic.EFFECTS_DISAPPEAR, pet, removed, removed)
    else
        target:messagePublic(tpz.msg.basic.NO_EFFECT, pet)
    end

    return removed
end
