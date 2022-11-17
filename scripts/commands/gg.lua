-----------------------------------------------------------------------
-- func: Kills everyone.
-----------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function onTrigger(player)
    local zonePlayers = player:getZone():getPlayers()
    for _, zonePlayer in pairs(zonePlayers) do
        zonePlayer:setHP(0)
   end
end
