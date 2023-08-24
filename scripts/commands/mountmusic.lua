---------------------------------------------------------------------------------------------------
-- func: mountmusic
-- desc: Toggles playing mount music
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    if (player:getCharVar("mountMusic") == 0) then
        -- Toggle mountMusic on..
        player:setCharVar("mountMusic", 1)
        player:PrintToPlayer("Mount music enabled!")
    else
        -- Toggle mountMusic off..
        player:setCharVar("mountMusic", 0)
        player:PrintToPlayer("Mount music disabled!")
    end
end
