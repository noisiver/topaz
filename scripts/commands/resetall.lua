-----------------------------------------------------------------------
-- func: Resets all players JA's'
-----------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function onTrigger(player)
    local zonePlayers = player:getZone():getPlayers()
    for _, zonePlayer in pairs(zonePlayers) do
        zonePlayer:resetRecasts()
        zonePlayer:PrintToPlayer( string.format( "Sucessfully reset everyone's JA's") )
    end
end
