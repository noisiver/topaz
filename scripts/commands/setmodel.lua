
---------------------------------------------------------------------------------------------------
-- func: setmodel
-- desc: Sets the mobs model
---------------------------------------------------------------------------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = "ss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!setmodel {npcID} <modelID>")
end

function onTrigger(player, arg1, arg2)
    local targ
    local modelID

    if (arg2 == nil) then
        -- player did not provide npcId.  Shift arguments by one.
        targ = player:getCursorTarget()
        modelID = arg1
    else
        -- player provided npcId and modelID.
        targ = GetMobByID(tonumber(arg1))
        modelID = arg2
    end

    -- validate target
    if (targ == nil) then
        error(player, "You must either enter a valid npcID or target an entity.")
        return
    end

    targ:setModelId(modelID)
end