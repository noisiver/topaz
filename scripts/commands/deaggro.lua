---------------------------------------------------------------------------------------------------
-- func: Deaggro
-- desc: Clears a mob's enmity list
---------------------------------------------------------------------------------------------------
require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = ""
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!deaggro")
end

function onTrigger(player)

    local targ = player:getCursorTarget()

    if targ == nil or targ:isMob() == false then
        error(player, "you must select a target monster with the cursor first")
		return
    end

	if targ:deaggroAll() then
		player:PrintToPlayer(string.format("The %s is now deaggrod.", targ:getName()))
	else
		player:PrintToPlayer(string.format("Could not deaggro the %s.", targ:getName()))
	end

end
