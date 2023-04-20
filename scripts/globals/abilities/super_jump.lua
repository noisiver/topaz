-----------------------------------
-- Ability: Super Jump
-- Performs a super jump.
-- Obtained: Dragoon Level 50
-- Recast Time: 3:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")
require("scripts/globals/msg")
require("scripts/globals/job_util")
-----------------------------------

function onAbilityCheck(player, target, ability)
    jobUtil.CheckForFlyHigh(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)

    -- Reduce 99% of total accumulated enmity
    -- http://wiki.ffo.jp/html/3367.html
    for _, mob in pairs(player:getNotorietyList()) do
        -- TODO: testing shows max range on this is >50' but stops somewhere above this. Need exact number.
        if mob:isMob() and mob:checkDistance(player) <= 75.0 then
            mob:setCE(player, 1)
            mob:setVE(player, 0)
        end
    end

    ability:setMsg(tpz.msg.basic.NONE)

    -- Prevent the player from performing actions while in the air
    player:queue(0, function(player)
        player:stun(5000)
    end)

    -- If the Dragoon's wyvern is out and alive, tell it to use Super Climb
    local wyvern = player:getPet()
    if (wyvern ~= nil and player:getPetID() == tpz.pet.id.WYVERN and wyvern:getHP() > 0) then
        wyvern:useJobAbility(636, wyvern)
    end

end
