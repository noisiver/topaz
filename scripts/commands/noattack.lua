---------------------------------------------------------------------------------------------------
-- func: noattack
-- desc: Disables mob autoattacks
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
    if targ:getLocalVar("Autoattack")  == 0 then
        targ:SetAutoAttackEnabled(false)
        targ:setLocalVar("Autoattack", 1) 
        player:PrintToPlayer(string.format("%s's auto-attack disabled.", targ:getName()))
    else
        targ:SetAutoAttackEnabled(true)
        targ:setLocalVar("Autoattack", 0) 
        player:PrintToPlayer(string.format("%s's auto-attack enabled.", targ:getName()))
    end
 end
