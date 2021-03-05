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
        pet:addMod(tpz.mod.HASTE_MAGIC, 2500)
        pet:addMod(tpz.mod.MAIN_DMG_RATING, 30)
        pet:addMod(tpz.mod.RANGED_DMG_RATING, 30)
        pet:addMod(tpz.mod.ATTP, 100)
        pet:addMod(tpz.mod.RATTP, 100)
        pet:addMod(tpz.mod.ACC, 100)
        pet:addMod(tpz.mod.RACC, 100)
        pet:addMod(tpz.mod.EVA, 100)
        pet:addMod(tpz.mod.MEVA, 100)
        pet:addMod(tpz.mod.REVA, 100)
        pet:addMod(tpz.mod.DMG, -50)
    end
    mob:familiar()

    skill:setMsg(tpz.msg.basic.FAMILIAR_MOB)

    return 0
end
