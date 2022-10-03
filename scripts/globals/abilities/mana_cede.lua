-----------------------------------
-- Ability: Mana Cede
-- Description: Transfers some of your HP to your currently summoned pet.
-- Obtained: SMN Level 50
-- Recast Time: 00:03:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local playerHPP = player:getHPP()
    local healPower = math.floor(player:getMainLvl() / 3)
    local pet = player:getPet()
    local petHPP = pet:getHPP()
    -- Can only be used if the player has more than 25% of their max HP
    if (playerHPP > healPower) and (petHPP < 100) then
        return 0, 0
    else
        return tpz.msg.basic.CANNOT_PERFORM_ACTION, 0
    end 
end

function onUseAbility(player, target, ability)
    local pet = player:getPet()
    local playerMaxHP = player:getMaxHP()
    local playerHP = player:getHP()
    local petHP = pet:getHP()
    local lvl = player:getMainLvl()
    local skill = getSummoningSkillOverCap(pet)

    -- Amount healed is FLOORED((player level / 3) + (summoning magic skill over cap / 2))
    local basePower = math.floor(lvl / 3)
    local playerHPReduction = playerMaxHP * (basePower / 100)
    local playerHPFinal = playerHP - playerHPReduction

    -- Set player to 1 HP instaed of killing them if their HP is less than te cost of Mana Cede(25% of their max HP)
    if playerHPFinal < 0 then
        playerHPFinal = 1
    end

    local power = basePower + (skill / 2)
    local finalPower = playerHP * (power / 100)
    local petHPFinal = petHP + finalPower

    player:setHP(playerHPFinal)
    pet:setHP(petHPFinal)
end
