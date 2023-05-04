---------------------------------------------------------------------------------------------------
-- func: useWS
-- desc: Tells the target mob to use specificed TP move.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!nocast")
end

function onTrigger(player, tpmove)
    
    local targ = player:getCursorTarget()
    
    if targ == nil or (not targ:isMob() and not targ:isPet()) then
        error(player, "you must select a target monster with the cursor first")
    else
        targ:useMobAbility(tpmove)
    end
end
