---------------------------------------------
-- Microspores
-- Only used by Goldcap and Morille Mortelle.
-- Description: Transfers all ailments to target
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores Shadows
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:getPool() == 1749 or mob:getPool() == 4698 then
        return 0
     end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local transferred, effect = MobTransferEnfeeblesMove(mob, target, skill, 10, true)
    if transferred then
        return effect
    else
        skill:setMsg(tpz.msg.basic.EVADES) -- no effect
        return 0
    end
end
