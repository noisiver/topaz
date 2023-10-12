---------------------------------------------------------------------------------------------------
-- func: !restockguilds
-- desc: Restocks guilds(mimics day reset)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!restockguilds <amount>")
end

function onTrigger(player, restockMax)

    if (restockMax == nil) then
        error(player, "Invalid amount of restocks.")
        return
    end

    local restockAmount = 0
    while restockAmount < restockMax do
        UpdateGuildsStock()
        restockAmount = restockAmount +1
    end
    player:PrintToPlayer("Guilds successfully restocked.")
end
