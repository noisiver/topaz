---------------------------------------------------------------------------------------------------
-- func: nocast
-- desc: Disables mob casting
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!nocast")
end

function onTrigger(player)
    
    local targ = player:getCursorTarget()
    
    if targ == nil or targ:isMob() == false then
        error(player, "you must select a target monster with the cursor first")
    end
    if targ:getLocalVar("Cast")  == 0 then
        targ:SetMagicCastingEnabled(false)
        targ:setLocalVar("Cast", 1) 
        player:PrintToPlayer(string.format("%s's casting disabled.", targ:getName()))
    else
        targ:SetMagicCastingEnabled(true)
        targ:setLocalVar("Cast", 0) 
        player:PrintToPlayer(string.format("%s's casting enabled.", targ:getName()))
    end
 end
