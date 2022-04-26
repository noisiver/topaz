---------------------------------------------------------------------------------------------------
-- func: mog
-- desc: opens the Mog House menu anywhere in the world
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:sendMenu(1)
end
