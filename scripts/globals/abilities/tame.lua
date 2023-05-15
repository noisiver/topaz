-----------------------------------
-- Ability: Tame
-- Makes target docile and more susceptible to charm.
-- Obtained: Beastmaster Level 30
-- Recast Time: 10:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    if player:getPet() ~= nil then
        ability:setMsg(tpz.msg.basic.JA_NO_EFFECT)
        target:addEnmity(player, 1, 0)
        return 0
    end
    if target:getMobMod(tpz.mobMod.CHARMABLE) == 0 then
        ability:setMsg(tpz.msg.basic.JA_NO_EFFECT) 
        target:addEnmity(player, 1, 0)
        return 0
    end
    local resist = applyResistanceAbility(player, target, tpz.magic.ele.NONE, tpz.skill.NONE, player:getStat(tpz.mod.CHR) - target:getStat(tpz.mod.CHR))

    if resist <= 0.25 then
        ability:setMsg(tpz.msg.basic.JA_MISS_2)
        target:addEnmity(player, 1, 0)
        return 0
    else
        if target:isEngaged() then
            ability:setMsg(tpz.msg.basic.SEEMS_FRIENDLIER) -- The x seems friendlier
            target:disengage()
            target:deaggroAll()
        else
            player:setLocalVar("Tamed_Mob", target:getID())
            ability:setMsg(tpz.msg.basic.SEEMS_FRIENDLIER) -- The x seems friendlier
        end
    end
end
