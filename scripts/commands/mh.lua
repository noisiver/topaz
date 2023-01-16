---------------------------------------------------------------------------------------------------
-- func: mh
-- desc: opens the Moogle Menu menu anywhere in the world
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:sendMenu(1)
end
