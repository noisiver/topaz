---------------------------------------------------------------------------------------------------
-- func: additem <itemId> <quantity> <aug1> <v1> <aug2> <v2> <aug3> <v3> <aug4> <v4> <trial>
-- desc: Adds an item to the GMs inventory.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "siiiiiiiiiii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!additem <itemId> {quantity} {aug1} {v1} {aug2} {v2} {aug3} {v3} {aug4} {v4} {trial}")
end

function onTrigger(player, name, quantity, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val, trialId, aug4val)
    -- Load needed text ids for players current zone..
    local ID = zones[player:getZoneID()]
    
    -- validate itemId
    if (name == nil or tostring(name) == nil) then
        error(player, "Invalid name.")
        return
    end
    
    local itemId = GetItemIDByName(name)
    
    if itemId == 0 or itemId == nil then
        error(player, "Invalid ID.")
    end
    
    if quantity == nil or quantity == 0 then
        quantity = 1
    end
    
    -- Ensure the GM has room to obtain the item...
    if (player:getFreeSlotsCount() == 0) then
        player:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemId )
        return
    end
    
    
    print(string.format("lua:about to ADDITEM with id %i and quantity %i", itemId, quantity, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val, trialId, aug4val))
    -- Give the GM the item...
    player:addItem( itemId, quantity, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val, trialId, aug4val )
    player:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
end
