---------------------------------------------
-- Altana's Favor
---------------------------------------------
require("scripts/globals/summon")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onPetAbility(target, pet, skill)
    if not target:isPC() then
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
        return 0
    end
    
    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
    
    if target:isDead() then
        target:sendRaise(4) -- WINGSCUSTOM Arise too strong, raise only
        skill:setMsg(tpz.msg.basic.NONE)
    elseif not target:addStatusEffect(tpz.effect.RERAISE, 3, 0, 0) then -- Infinite duration http://wiki.ffo.jp/html/30976.html
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
    end
    
    pet:getMaster():setMP(0)
    return tpz.effect.RERAISE
end

