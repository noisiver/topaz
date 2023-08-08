---------------------------------------------------------------------------------------------------
-- func: maxrecasts
-- desc: Maxes all job ability recast timers for the target
-- If a player name is specified, Maxes all job ability recast timers for that player
-- TODO: Bool for 2 hours
-----------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!reset {player}")
end

function onTrigger(player, target)
    -- validate target
    local targ
    if (target == nil) then
        targ = player
    else
        targ = GetPlayerByName(target)
        if (targ == nil) then
            error(player, string.format( "Player named '%s' not found!", target ) )
            return
        end
    end

    -- reset target recasts
    targ:addMaxRecastToAllAbilities()
    if (targ:getID() ~= player:getID()) then
        player:PrintToPlayer( string.format( "Maxed %s's JA timers.", targ:getName() ) )
    end
end
