---------------------------------------------------------------------------------------------------
-- func: updateguildstock
-- desc: Restocks guilds(mimics day reset)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    UpdateGuildsStock()
end
