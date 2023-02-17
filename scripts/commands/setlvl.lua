---------------------------------------------------------------------------------------------------
-- func: setlevel
-- desc: Sets the targets current level
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addspell <lvl>")
end

function onTrigger(player, lvl)
    
    local targ = player:getCursorTarget()
    if lvl == nil then
        error(player, "you must select a level between 1 and 199")
        return
    end
    
    if targ == nil or targ:isMob() == false then
        error(player, "you must select a target monster with the cursor first")
    else
        targ:setMobLevel(lvl)
        player:PrintToPlayer(string.format("%s's level was set to %i.", targ:getName(), lvl))
    end
end