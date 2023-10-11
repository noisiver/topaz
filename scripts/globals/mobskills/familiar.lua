---------------------------------------------
-- Familiar
-- pet powers increase.
---------------------------------------------
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local pet = mob:getPet()
    if pet then
        pet:addMod(tpz.mod.HASTE_ABILITY, 2500)
        pet:addMod(tpz.mod.MAIN_DMG_RATING, 30)
        pet:addMod(tpz.mod.RANGED_DMG_RATING, 30)
        pet:addMod(tpz.mod.DMG, -50)
    end
    mob:familiar()

    skill:setMsg(tpz.msg.basic.FAMILIAR_MOB)

    return 0
end
