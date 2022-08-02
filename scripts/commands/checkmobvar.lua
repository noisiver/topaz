---------------------------------------------------------------------------------------------------
-- func: checkvar <varType> <varName>
-- desc: checks player or server variable and returns result value.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!checkmobvar <variable name>")
end

function onTrigger(player, arg1)
    local targ = player:getCursorTarget()
    local varName = arg1
    
    if targ == nil or targ:isMob() == false then
        error(player, "you must select a target monster with the cursor first")
    end

    if targ:isMob() then
        player:PrintToPlayer(string.format("%s's variable '%s' : %u", targ:getName(), varName, targ:getLocalVar(varName)))
    end
end