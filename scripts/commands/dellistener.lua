---------------------------------------------------------------------------------------------------
-- func: dellistener
-- desc: Removes the specified listener off a mob.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!dellistener <listener>")
end

function onTrigger(player, listener)
    
    local targ = player:getCursorTarget()
    if listener == nil then
        error(player, "you must type a listener name (i.e SL_MAGIC_INTERRUPTED)")
        return
    end
    
    if targ == nil or (not targ:isMob() and not targ:isPet()) then
        error(player, "you must select a target monster with the cursor first")
    else
        targ:removeListener(listener)
        player:PrintToPlayer(string.format("%s was removed off %s.", listener, targ:getName()))
    end
end