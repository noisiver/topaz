-----------------------------------------
-- ID: 5356
-- Item: Remedy Ointment
-- Item Effect: This potion remedies status ailments.
-- Removes a random amount of erase only status effects
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
local removablesMajor =
{
    tpz.effect.SLOW,
    tpz.effect.BIND,
    tpz.effect.WEIGHT,
    tpz.effect.ADDLE,
    tpz.effect.BURN,
    tpz.effect.FROST,
    tpz.effect.CHOKE,
    tpz.effect.RASP,
    tpz.effect.SHOCK,
    tpz.effect.DROWN,
    tpz.effect.DIA,
    tpz.effect.BIO,
    tpz.effect.REQUIEM,
    tpz.effect.ELEGY,
}

local removablesMinor =
{
    tpz.effect.STR_DOWN,
    tpz.effect.DEX_DOWN,
    tpz.effect.VIT_DOWN,
    tpz.effect.AGI_DOWN,
    tpz.effect.INT_DOWN,
    tpz.effect.MND_DOWN,
    tpz.effect.CHR_DOWN,
    tpz.effect.MAX_HP_DOWN,
    tpz.effect.MAX_MP_DOWN,
    tpz.effect.ATTACK_DOWN,
    tpz.effect.EVASION_DOWN,
    tpz.effect.DEFENSE_DOWN,
    tpz.effect.MAGIC_DEF_DOWN,
    tpz.effect.INHIBIT_TP,
    tpz.effect.MAGIC_ACC_DOWN,
    tpz.effect.MAGIC_ATK_DOWN,
    tpz.effect.FLASH,
}
    local activeMajor = {};
    local activeMinor = {};

    for k,v in pairs(removablesMajor) do
        if target:hasStatusEffect(v) then
            activeMajor[#activeMajor + 1] = v;
        end
    end

    for k,v in pairs(removablesMinor) do
        if target:hasStatusEffect(v) then
            activeMinor[#activeMinor + 1] = v;
        end
    end

    if (#activeMajor > 0) then
        local effect = activeMajor[math.random(#activeMajor)];
        if (target:hasStatusEffect(tpz.effect.BLINDNESS) == true) then
            local currentEffect = target:getStatusEffect(tpz.effect.BLINDNESS)
            local effectFlags = currentEffect:getFlag()
            if (bit.band(effectFlags, tpz.effectFlag.WALTZABLE) ~= 0) then
                target:delStatusEffectSilent(effect);
            end
        end
    end

    if (#activeMinor > 0) then
        local effect = activeMinor[math.random(#activeMinor)];
        if (target:hasStatusEffect(tpz.effect.BLINDNESS) == true) then
            local currentEffect = target:getStatusEffect(tpz.effect.BLINDNESS)
            local effectFlags = currentEffect:getFlag()
            if (bit.band(effectFlags, tpz.effectFlag.WALTZABLE) ~= 0) then
                target:delStatusEffectSilent(effect);
            end
        end
    end
end

