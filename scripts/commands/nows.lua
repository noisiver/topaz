---------------------------------------------------------------------------------------------------
-- func: nows
-- desc: Disables mob WS(TP moves)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!nows")
end

function onTrigger(player)
    
    local targ = player:getCursorTarget()
    
    if targ == nil or targ:isMob() == false then
        error(player, "you must select a target monster with the cursor first")
    end
    if targ:getLocalVar("WS")  == 0 then
        targ:SetMobAbilityEnabled(false)
        targ:setLocalVar("WS", 1) 
        player:PrintToPlayer(string.format("%s's WS disabled.", targ:getName()))
    else
        targ:SetMobAbilityEnabled(true)
        targ:setLocalVar("WS", 0) 
        player:PrintToPlayer(string.format("%s's WS enabled.", targ:getName()))
    end
 end
