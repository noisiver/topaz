---------------------------------------------
-- Immortal Shield
-- Description: Grants a Magic Shield to the user.
-- Note: missing proper rottating shield animation for status buff
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getMod(tpz.mod.MAGIC_SS) == 0) then
        -- only use this skill if there is no remainig magical stoneskin
        return 0
    end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
    -- need a capture to determine how much should be absorbed
    local magicalStoneskinAmount = 1000
    
    if (mob:isNM()) then
        magicalStoneskinAmount = 1500
    end

    mob:setMod(tpz.mod.MAGIC_SS, magicalStoneskinAmount)
    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT) -- lasted 15 mins

    return tpz.effect.MAGIC_SHIELD
end
