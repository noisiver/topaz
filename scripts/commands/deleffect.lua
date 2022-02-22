---------------------------------------------------------------------------------------------------
-- func: addeffect
-- desc: Removes the given effect from the given player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = "si"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!deleffect {player} <effect>")
end

function onTrigger(player, arg1)
    local targ

    if (arg1 == nil) then
        error(player, "You must provide an effect ID.")
        return
    else
        targ = GetPlayerByName(arg1)
    end

    -- validate target
    if (targ == nil) then
        error(player, string.format("Player named '%s' not found!", arg1))
        return
    end

    -- delete status effect
    for v = 1,31,1 do
        targ:delStatusEffectSilent(v)
    end
    if (targ:getID() ~= player:getID()) then
        player:PrintToPlayer(string.format("Removed effect %i from %s.", id, targ:getName()))
    end
end
