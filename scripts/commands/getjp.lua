---------------------------------------------------------------------------------------------------
-- func: getjp <jpID>
-- desc: gets the amount of JP by ID on the player or cursor target
---------------------------------------------------------------------------------------------------
require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!getmod <jpID>")
end

function onTrigger(player, id)
    -- invert tpz.mod table
    local modNameByNum = {}
    for k, v in pairs(tpz.jp) do
        modNameByNum[v]=k
    end

    -- validate modID
    id = string.upper(id)
    local jpId = tonumber(id)
    local modName = nil

    if jpId ~= nil then
        if modNameByNum[jpId] ~= nil then
            modName = modNameByNum[jpId]
        end
    elseif tpz.jp[id] ~= nil then
        jpId = tpz.jp[id]
        modName = id
    end
    if modName == nil or jpId == nil then
        error(player, "Invalid jpID.")
        return
    end

    -- validate target
    local effectTarget = player:getCursorTarget()
    if effectTarget == nil then
        effectTarget = player
    elseif effectTarget:isNPC() then
        error(player, "Current target is an NPC, which can not have mods.")
        return
    end

    player:PrintToPlayer(string.format("%s's JP level %i (%s) is %i", effectTarget:getName(), jpId, modName, effectTarget:getJobPointLevel(jpId)))
end
