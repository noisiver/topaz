---------------------------------------------------------------------------------------------------
-- func: giveitembyid <player> <itemId> <amount> <aug1> <v1> <aug2> <v2> <aug3> <v3> <aug4> <v4>
-- desc: Gives an item to the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ssiiiiiiiiii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!additem <target> <itemId> {quantity} {aug1} {v1} {aug2} {v2} {aug3} {v3} {aug4} {v4} {trial}")
end

function onTrigger(player, target, name, quantity, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val, trialId, aug4val)
    local targ = GetPlayerByName( target )
    if (targ == nil) then
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) )
        return
    end

    -- validate itemId
    if (itemId == nil or tonumber(itemId) == nil or tonumber(itemId) == 0) then
        error(player, "Invalid itemId.")
        return
    end
    
    if quantity == nil or quantity == 0 then
        quantity = 1
    end


    -- Load needed text ids for target's current zone..
    local ID = zones[targ:getZoneID()]

    -- Attempt to give the target the item..
    if (targ:getFreeSlotsCount() == 0) then
        targ:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemId )
        player:PrintToPlayer( string.format( "Player '%s' does not have free space for that item!", target ) )
    else
        targ:addItem( itemId, quantity, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val, trialId, aug4val )
        targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId )
        player:PrintToPlayer( string.format( "Gave player '%s' Item with ID of '%u' ", target, itemId ) )
        player:PrintToPlayer(string.format("lua:about to ADDITEM with id %i and quantity %i", itemId, quantity, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val, trialId, aug4val))
    end
end
