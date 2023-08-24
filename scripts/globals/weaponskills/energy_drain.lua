------------------------
--    Energy Drain    --
-- 	Dagger (175 Skill)
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local fTPAnchors = { 1.25, 2.5, 4.125 }

    local startingAnchor = math.floor(tp / 1000)
    
    local multiplier = 0

    if tp >= 3000 then
        multiplier = fTPAnchors[3]
    else
        local basefTP   = fTPAnchors[startingAnchor]
        local nextfTP   = fTPAnchors[startingAnchor + 1]
        local multPerTP = (nextfTP - basefTP) / 1000 * (tp - 1000 * startingAnchor)
        -- TP = 1250; multiplier = 1.25 + ( (2.5 - 1.25) / 1000 * (1250 - (1000 * 1))
        --            multiplier = 1.25 + (1.25 / 1000) * 250)
        --            multiplier = 1.25 + 0.3125 = 1.5625
        multiplier = basefTP + multPerTP
    end

    local skill = player:getSkillLevel(tpz.skill.DAGGER)
    local wsc   = player:getStat(tpz.mod.MND) * 1.0
    local mpRestored = math.floor((math.floor(skill * 0.11) + wsc) * multiplier)

    if target:isUndead() then
        mpRestored = 0
    else
        -- Absorb MP from target
        target:delMP(mpRestored)
        player:addMP(mpRestored)
    end

    -- Display MP actually given to player
    action:messageID(target:getID(), tpz.msg.basic.SKILL_DRAIN_MP)
    action:param(target:getID(), mpRestored)

    return 1, 0, false, mpRestored
end