---------------------------------------------
-- Reprobation
--
-- Description: Dispels all buffs from targets in area of effect, including food.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Dispels shadows
-- Range: Area of Effect
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:isNM() then
        return 0
    end
    return 1
end


function onMobWeaponSkill(target, mob, skill)
    local dispel =  MobFullDispelMove(mob, target, skill, tpz.effectFlag.DISPELABLE, tpz.effectFlag.FOOD)
    local msg = tpz.msg.basic.EVADES

    if dispel > 0 then
        msg = tpz.msg.basic.DISAPPEAR_NUM
    end

    skill:setMsg(msg)

    return dispel
end
