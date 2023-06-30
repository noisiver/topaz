---------------------------------------------
-- Cannibal Blade
---------------------------------------------
require("scripts/globals/automatonweaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    local master = automaton:getMaster()
    getAutoTP(master)
    return master:countEffect(tpz.effect.DARK_MANEUVER)
end

function onPetAbility(target, pet, skill)
    local params = {}
    -- TODO: fTP is probably completely overtuned
    --[[1000 ( Melee combat skill less than 201)
    180 + int {( Melee combat skill -146)/9} x 11
    ( Melee combat skill 201 or higher)
    180 + int {( Melee combat skill - (147 + int ( Melee combat skill -201)/100) )/9}×11
    ]]
    params.multiplier = 4.0 -- 16.0
    params.tp150 = 4.5 -- 23.5
    params.tp300 = 5.0 -- 31.5
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 1.0
    params.chr_wsc = 0.0
    params.IGNORES_SHADOWS = true
    params.NO_RESIST = true
    params.CANNIBAL_BLADE = true


    local damage = AutoMagicalWeaponSkill(pet, target, skill, tpz.magic.ele.DARK, params, MND_BASED, 0)
    dmg = AutoMagicalFinalAdjustments(damage, pet, skill, target, tpz.attackType.MAGICAL, tpz.magic.ele.DARK, params)
    dmg = dmg * (target:getMod(tpz.mod.SLASHRES) / 1000)

    -- Does not drain HP from undead, but still deals damage.
    if not target:isUndead() then
        pet:addHP(dmg)
    end

    return dmg
end
