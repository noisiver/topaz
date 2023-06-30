---------------------------------------------
-- Heat Barrier
-- Family: Wamouracampa
-- Description: Applies a thermal barrier, granting fiery spikes and fire damage on melee hits.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:hasStatusEffect(tpz.effect.BLAZE_SPIKES) then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    -- TODO: Enfire power, Blaze Spikes reduced power in Salvage zones
    -- spikes: lv * .8, enfire lv *.4
    local typeEffectOne = tpz.effect.BLAZE_SPIKES
    local typeEffectTwo = tpz.effect.ENFIRE
    local powerOne = math.floor(mob:getMainLvl() * 0.8)
    local powerTwo = math.floor(mob:getMainLvl() * 0.4)
    skill:setMsg(MobBuffMove(mob, typeEffectOne, powerOne, 0, 180))
    MobBuffMove(mob, typeEffectTwo, powerTwo, 0, 300)

    return typeEffectOne
end
