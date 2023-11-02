---------------------------------------------
-- Wanion
-- Transfers all ailments the Seether itself has to players in AoE range.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local transferred, effect = MobTransferEnfeeblesMove(mob, target, skill, 15, true)
    if transferred then
        return effect
    else
        skill:setMsg(tpz.msg.basic.EVADES) -- no effect
        return 0
    end
end
