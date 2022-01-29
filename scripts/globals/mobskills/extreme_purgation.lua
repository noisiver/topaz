
---------------------------------------------
--  Purges all status effect from players in an area of effect.
-- 	Steals both positive and negative status effects.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    
    -- TODO: Figure out a more efficient way to steal all positive and negative
    --       status effects from players.
    local effect1 = mob:stealStatusEffect(target, tpz.effectFlag.DISPELABLE)
    local effect2 = mob:stealStatusEffect(target, tpz.effectFlag.DISPELABLE)
    local effect3 = mob:stealStatusEffect(target, tpz.effectFlag.DISPELABLE)
    local effect4 = mob:stealStatusEffect(target, tpz.effectFlag.DISPELABLE)
    local effect5 = mob:stealStatusEffect(target, tpz.effectFlag.DISPELABLE)
    local effect6 = mob:stealStatusEffect(target, tpz.effectFlag.DISPELABLE)
    local effect7 = mob:stealStatusEffect(target, tpz.effectFlag.DISPELABLE)
    local effect8 = mob:stealStatusEffect(target, tpz.effectFlag.DISPELABLE)
    local effect9 = mob:stealStatusEffect(target, tpz.effectFlag.DISPELABLE)
    local effect10 = mob:stealStatusEffect(target, tpz.effectFlag.DISPELABLE)
    local dmg = 0

    if (effect1 ~= 0) then
        local count = 1
        if (effect2 ~= 0) then
            count = count + 1
        end
        if (effect3 ~= 0) then
            count = count + 1
        end
        if (effect4 ~= 0) then
            count = count + 1
        end
        if (effect5 ~= 0) then
            count = count + 1
        end
        if (effect6 ~= 0) then
            count = count + 1
        end
        if (effect7 ~= 0) then
            count = count + 1
        end
        if (effect8 ~= 0) then
            count = count + 1
        end
        if (effect9 ~= 0) then
            count = count + 1
        end
        if (effect10 ~= 0) then
            count = count + 1
        end
        
        skill:setMsg(tpz.msg.basic.EFFECT_DRAINED)

        return count
    end
end