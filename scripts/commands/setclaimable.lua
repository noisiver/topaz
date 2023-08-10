---------------------------------------------------------------------------------------------------
-- func: setclaimable
-- desc: Sets the mob claimable
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!notattack")
end

function onTrigger(player)
    
    local targ = player:getCursorTarget()
    
    if targ == nil or targ:isMob() == false then
        error(player, "you must select a target monster with the cursor first")
    end
    if targ:getLocalVar("claimable")  == 0 then
        targ:SetClaimable(false)
        targ:setLocalVar("claimable", 1) 
        player:PrintToPlayer(string.format("%s is no longer claimable.", targ:getName()))
    else
        targ:SetClaimable(true)
        targ:setLocalVar("claimable", 0) 
        player:PrintToPlayer(string.format("%s is now claimable.", targ:getName()))
    end
 end
