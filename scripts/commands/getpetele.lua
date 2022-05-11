---------------------------------------------------------------------------------------------------
-- func: getpetele
-- desc: prints your pets element
---------------------------------------------------------------------------------------------------
require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = ""
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!gettp")
end

function onTrigger(player)
    local targ = player:getCursorTarget()
    local pet = player:getPet()
    
    player:PrintToPlayer(string.format("%s's element is: %u ", pet:getName(),  player:getPetElement()))
end
