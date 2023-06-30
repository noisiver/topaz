---------------------------------------------------------------------------------------------------
-- func: getfame
-- desc: prints the current targets fame level
---------------------------------------------------------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/quests")

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!getfame <city>")
end

function onTrigger(player, city)
    
    local targ = player:getCursorTarget()
    local cityData = _G[string.upper(city)]

    if (type(cityData) == 'table') and (cityData.full_name ~= nil) then

    
        if targ == nil or not targ:isPC() then
            error(player, "You must select a target player with the cursor first")
            return
        end
    
        player:PrintToPlayer(string.format("%s's %s fame is: %u ", targ:getName(), city, targ:getFameLevel(cityData)))
    else
        error(player, "Invalid city.")
        return
     end
end
