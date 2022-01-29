---------------------------------------------------------------------------------------------------
-- func: spawnPCs
-- desc: Reload players around you.
--
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    player:spawnPCs()
    player:PrintToPlayer("Players successfully respawned")
end