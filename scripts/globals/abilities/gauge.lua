-----------------------------------
-- Ability: Gauge
-- Checks to see if an enemy can be charmed.
-- Obtained: Beastmaster Level 10
-- Recast Time: 0:30
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)

    local charmChance = GetCharmHitRate(player, target)

    if (charmChance >= 75) then
        ability:setMsg(tpz.msg.basic.SHOULD_BE_ABLE_CHARM)  -- The <player> should be able to charm <target>.
    elseif (charmChance >= 50) then
        ability:setMsg(tpz.msg.basic.MIGHT_BE_ABLE_CHARM)   -- The <player> might be able to charm <target>.
    elseif (charmChance >= 25) then
        ability:setMsg(tpz.msg.basic.DIFFICULT_TO_CHARM)    -- It would be difficult for the <player> to charm <target>.
    elseif (charmChance >= 1) then
        ability:setMsg(tpz.msg.basic.VERY_DIFFICULT_CHARM)  -- It would be very difficult for the <player> to charm <target>.
    else
        ability:setMsg(tpz.msg.basic.CANNOT_CHARM)          -- The <player> cannot charm <target>!
    end

    -- Display targets stats
    local att   = target:getStat(tpz.mod.ATT)
    local acc   = target:getACC()
    local def   = target:getStat(tpz.mod.DEF)
    local eva   = target:getEVA()
    local chr   = target:getStat(tpz.mod.CHR)
    local mobName = target:getName()
    mobName = string.gsub(mobName, '_', ' ');
    MessageGroup(player, player, mobName .. "'s" .. " Attack: " .. att ..  " Accuracy: " .. acc ..  " Defense: " .. def ..  " Evasion: " .. eva ..  " CHR: " .. chr .. ".", tpz.msg.textColor.GREEN, 0)
end
