---------------------------------------------------------------------------------------------------
-- func: addpromyenmrewards
-- desc: adds all promy ENM rewards
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiiiiiiiiii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addpromyenmrewards")
end

function onTrigger(player, itemId, quantity, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val, trialId)
    -- Load needed text ids for players current zone..
    local ID = zones[player:getZoneID()]


    -- Give the GM the item...
    for v = 1790, 1812 do
        player:addItem(v)
        player:messageSpecial(ID.text.ITEM_OBTAINED, v)
    end
end
