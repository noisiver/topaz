-----------------------------------------------------------------------
-- func: Raises party, removes weakness, and resets JA's.
-- desc: Sends raise menu to GM or target player.
-----------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ss"
}


function onTrigger(player)
    local zonePlayers = player:getZone():getPlayers()
    for _, zonePlayer in pairs(zonePlayers) do
        zonePlayer:setLocalVar("GMRaise", 1)
        zonePlayer:sendRaise(3)
        zonePlayer:setHP(9999)
        zonePlayer:setMP(9999)
        zonePlayer:resetRecasts()
        zonePlayer:PrintToPlayer( string.format( "Sucessfully raised and reset everyone's JA's") )
    end
end
