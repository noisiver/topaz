---------------------------------------------------------------------------------------------------
-- func: !restockguilds
-- desc: Restocks guilds(mimics day reset)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    UpdateGuildsStock()
    player:PrintToPlayer("Guilds successfully restocked.")
end
