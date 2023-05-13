---------------------------------------------------
-- Magic Mortar
---------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    local master = automaton:getMaster()
    getAutoTP(master)
    return master:countEffect(tpz.effect.LIGHT_MANEUVER)
end
--[[
Magic motor damage belongs to " magic damage " and is affected by magic damage cuts such as shells . ( Maximum HP - Current HP of Mutton ) *
Magnification + fixed damage of hand - to - hand combat skills . Sure hit . It is a performance that can be said to be a reverse spirit within ,
and its power increases as Mutton 's HP decreases. The higher the TP , the higher the multiplier .
The multiplier is 1.5 at TP 1000 , 1.75 at TP 2000, and 2.5 at TP 3000. Previously hand-to-hand combat skill

Damage dealt = (Automaton Max HP - Automaton Current HP) × fTP + Automaton Melee Skill
]]

function onPetAbility(target, pet, skill)
    local params = {}
    params.multiplier = 1.5
    params.tp150 = 1.75
    params.tp300 = 2.5
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.3
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.IGNORES_SHADOWS = true
    params.MAGIC_MORTAR = true

    local damage = AutoMagicalWeaponSkill(pet, target, skill, tpz.magic.ele.NONE, params, INT_BASED, 0)
    dmg = AutoMagicalFinalAdjustments(damage, pet, skill, target, tpz.attackType.MAGICAL, tpz.magic.ele.NONE, params)

    return dmg
end
