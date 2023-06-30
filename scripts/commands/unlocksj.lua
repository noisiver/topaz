---------------------------------------------------------------------------------------------------
-- func: addallmaps
-- desc: Adds all maps to the given player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addallmaps {player}")
end

function onTrigger(player, target)
    -- validate target
    local targ
    if (target == nil) then
        targ = player
    else
        targ = GetPlayerByName(target)
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target))
            return
        end
    end

    player:unlockJob(0)
    player:PrintToPlayer(string.format("%s can now choose a support job.", targ:getName()))
end
