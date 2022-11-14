-----------------------------------------------------------------------
-- func: Raises party all party members and removes weakness without an EXP loss
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
        if zonePlayer:getHP() == 0 then
            zonePlayer:setLocalVar("GMRaise", 1)
            zonePlayer:sendRaise(3)
        end
        zonePlayer:delStatusEffect(1)
        zonePlayer:PrintToPlayer( string.format( "Sucessfully raised everyone without an XP loss.") )
    end
end
