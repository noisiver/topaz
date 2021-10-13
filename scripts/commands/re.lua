---------------------------------------------------------------------------------------------------
-- func: re
-- desc: Reloads the party list and PC's around you.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
	
    player:reloadParty()
	player:reloadPC()
	
end;
