---------------------------------------------------------------------------------------------------
-- func: addeffect
-- desc: Removes the given effect from the given player.
-- all for arg2 = deletes all status effects, otherwise only deletes effect name
---------------------------------------------------------------------------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = "ss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!deleffect {player} <effect>")
end

function onTrigger(player, arg1, arg2)
    local targ = player
    local id

    if (arg1 == nil) then
        error(player, "Invalid effect.")
        return
    else
        if (targ:isMob() == false) and (targ:isPet() == false) and (targ ~= arg1) then
            targ = player
            -- Target player
            id = arg1
        else
            -- Target is cursor target
            targ = player:getCursorTarget()
            id = arg1
        end
    end

    if (arg2 ~= nil) then
        targ = GetPlayerByName(arg1)
        if (arg2 == 'all') then
            -- delete status effect
            for v = 1,31,1 do
                targ:delStatusEffectSilent(v)
            end
            for v = 128,142,1 do
                targ:delStatusEffectSilent(v)
            end
            for v = 144,149,1 do
                targ:delStatusEffectSilent(v)
            end
            for v = 167,168,1 do
                targ:delStatusEffectSilent(v)
            end
            for v = 174,175,1 do
                targ:delStatusEffectSilent(v)
            end
            for v = 192,194,1 do
                targ:delStatusEffectSilent(v)
            end
            targ:delStatusEffectSilent(tpz.effect.ENCUMBRANCE_II)
            if (targ:getID() ~= player:getID()) then
                return player:PrintToPlayer(string.format("Removed all status effects from %s.", targ:getName()))
            else
                return player:PrintToPlayer(string.format("Removed all status effects from yourself."))
            end
        else
            id = arg2
        end

        if (targ == nil) then
            player:PrintToPlayer( string.format( "Player named '%s' not found!", targ ) )
            return
        end
    end

    -- validate target
    if (targ == nil) then
        error(player, string.format("Player named '%s' not found!", arg1))
        return
    end

    -- validate effect
    if (id == nil) then
        error(player, "Invalid effect.")
        return
    else
        id = tonumber(id) or tpz.effect[string.upper(id)]
        if (id == nil) then
            error(player, "Invalid player or effect.")
            return
        end
    end


    if (targ:getID() ~= player:getID()) then
        player:PrintToPlayer(string.format("Removed effect %i from %s.", id, targ:getName()))
        targ:delStatusEffect(id)
    else
        player:PrintToPlayer(string.format("Removed effect %i from yourself.", id))
        targ:delStatusEffect(id)
    end
end
