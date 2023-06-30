---------------------------------------------------------------------------------------------------
-- func: getTP
-- desc: prints the current targets TP
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
    
    if targ == nil or targ:isMob() == false then
        error(player, "you must select a target monster with the cursor first")
    end
    
    player:PrintToPlayer(string.format("%s's TP is: %u ", targ:getName(), targ:getTP()))
end
