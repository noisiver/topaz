
-----------------------------------
-- tpz.effect.INCREASED_DAMAGE_TAKEN
-- Must be called with addStatusEffectEx()
-- i.e mob:addStatusEffectEx(tpz.effect.INCREASED_DAMAGE_TAKEN, tpz.effect.INCREASED_DAMAGE_TAKEN, power, 0, duration)
-- Increased Physical Damage (Broken)
-- Increases damage taken based on power
-- 1 = All normal damage(not sc or mb)
-- 2 = Phys
-- 3 = Breath
-- 4 = Magic
-- 5 = Ranged
-- 6 = Skillchain
-- 7 = Magic Burst
-- 8 = Spirits
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local power = {
    { 1, tpz.mod.DMG, 50}, 
    { 2, tpz.mod.UDMGPHYS, 50}, 
    { 3, tpz.mod.UDMGBREATH, 50}, 
    { 4,  tpz.mod.UDMGMAGIC, 50}, 
    { 5,  tpz.mod.UDMGRANGE, 50}, 
    { 6,  tpz.mod.DMGSC, 50}, 
    { 7,  tpz.mod.DMGMB, 50}, 
    { 8,  tpz.mod.DMGSPIRITS, 50}, 
}


function onEffectGain(target, effect)
    for i,mod in pairs(power) do
        if (effect:getPower() == mod[1]) then
            target:addMod(mod[2], mod[3])
        end
    end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    for i,mod in pairs(power) do
        if (effect:getPower() == mod[1]) then
            target:delMod(mod[2], mod[3])
        end
    end
end
