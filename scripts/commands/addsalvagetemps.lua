---------------------------------------------------------------------------------------------------
-- func: addnyzultempitems
-- desc: Adds all temp items from nyzul to the players inventory.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "ii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addsalvagetemps")
end

local temps =
{
    4146, -- Revitalizer (available in chests in addition to all the buyable temps)
    4147, -- Body Boost
    4200, -- Mana Boost
    5385, -- Barbarian
    5386, -- Fighter
    5387, -- Oracle
    5388, -- Assasin
    5389, -- Spy
    5390, -- Braver
    5391, -- Soldier
    5392, -- Champion
    5393, -- Monarch
    5394, -- Gnostic
    5395, -- Cleric
    5396, -- Shepard
    5397, -- Sprinter -- stopped
    5431, -- Dusty Poition
    5432, -- Dusty Ether
    5433, -- Dusty Elixir
    5434, -- Fanatics
    5435, -- Fools 
    5436, -- Dusty Reraise
    5437, -- Strange Milk
    5438, -- Strange Juice
    5439, -- Vicars
    5440, -- Dusty Wing
}

function onTrigger(player)
    for k,v in pairs(highGradeItems) do
        player:addTempItem(v.ItemID)
    end
    player:PrintToPlayer("Added all temp items available in Salvage to temp inventory")
end