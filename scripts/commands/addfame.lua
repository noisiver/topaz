---------------------------------------------------------------------------------------------------
-- func: addfame
-- desc: adds fame to your current target
---------------------------------------------------------------------------------------------------
require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = "si"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addfame <city> <amount>")
end

function onTrigger(player, city, amount)
    
    local targ = player:getCursorTarget()
    local cityIndex

    if (city == "sandy") then
        cityIndex = 0
    elseif (city == 'bastok') then
        cityIndex = 1
    elseif (city == "windurst") then
        cityIndex = 2
    elseif (city == "jeuno") then
        cityIndex = 3
    elseif (city == "sebina") or (city == "rabao") then
        cityIndex = 4
    elseif (city == "norg") then
        cityIndex = 5
    end
    
    if targ == nil or not targ:isPC() then
        error(player, "You must select a target player with the cursor first")
        return
    end

    player:addFame(cityIndex, amount)
    player:PrintToPlayer(string.format("%s's %s fame increased by %u", targ:getName(), city, amount))
end
