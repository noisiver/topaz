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
    player:PrintToPlayer("!deleffect <effect> {player}")
end

function onTrigger(player, arg1, arg2)
    local targ
    local id


    if (arg1 == nil) then
        targ = player
        id = arg2
    elseif (arg2 == nil) then
        error(player, "You must provide an effect ID.")
        return
    else
        targ = GetPlayerByName(arg2)
        id = arg1
    end

    -- validate target
    if (targ == nil) then
        error(player, string.format("Player named '%s' not found!", arg2)
        return
    end

    -- validate effect
    id = tonumber(id) or tpz.effect[string.upper(id)]
    if (id == nil) then
        error(player, "Invalid effect.")
        return
    elseif (id == 0) then
        id = 1
    end

    -- delete status effect
    targ:delStatusEffect(id)
    if (targ:getID() ~= player:getID()) then
        player:PrintToPlayer(string.format("%s effect removed from %i.", targ:getName(), id))
    end
end
