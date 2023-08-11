-----------------------------------
-- Ability: Charm a monster
-- Tames a monster to fight by your side.
-- Obtained: Beastmaster Level 1
-- Recast Time: 0:15
-- Duration: Varies
-- Check            |Duration
-- ---------------- |--------------
-- Too Weak         |30 Minutes
-- Easy Prey        |20 Minutes
-- Decent Challenge |10 Minutes
-- Even Match       |3.0 Minutes
-- Tough            |1.5 Minutes
-- Very Tough       |1-20 seconds
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")
require("scripts/globals/msg")
require("scripts/globals/magic")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if player:getPet() ~= nil then
        return tpz.msg.basic.ALREADY_HAS_A_PET, 0
    elseif target:getMaster() ~= nil and target:getMaster():isPC() then
        return tpz.msg.basic.THAT_SOMEONES_PET, 0
    else
        return 0, 0
    end
end

function onUseAbility(player, target, ability)
    local charmChance = GetCharmHitRate(player, target)
    player:PrintToPlayer(string.format( "Your charm hit rate is %i.", charmChance))

    if target:isPC() then
        ability:setMsg(tpz.msg.basic.NO_EFFECT)
    else
        if math.random(100) <= charmChance then
            player:charmPet(target)
        end
    end
end
