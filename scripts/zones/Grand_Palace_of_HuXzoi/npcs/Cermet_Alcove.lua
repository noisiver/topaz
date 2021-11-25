-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--  NPC: Cermet Alcove
-- Note: Escort Quest
-----------------------------------
local ID = require("scripts/zones/Grand_Palace_of_HuXzoi/IDs")
require("scripts/globals/status")
require("scripts/globals/pathfind")
-----------------------------------

local escorts =
{
    [16916927] =
    {
        ['limit'] = 5,
        ['spawn'] = { -260.000, -1.000,  423.000, 190 },
    },
    [16916928] =
    {
        ['limit'] = 30,
        ['spawn'] = {  797.000, -1.000,  460.000, 125 },
    },
    [16916929] =
    {
        ['limit'] = 30,
        ['spawn'] = {  540.000, -1.000,  297.000, 60 },
    },
    [16916930] =
    {
        ['limit'] = 40,
        ['spawn'] = { -540.000, -1.000,  297.000, 60 },
    },
}

function onTrigger(player,npc)
    local data = escorts[npc:getID()]
    if data ~= nil then
        local quasilumin = GetMobByID(16916926)
        local action = quasilumin:getCurrentAction()
        if quasilumin:getStatus() ~= tpz.status.NORMAL and (action ~= tpz.action.DEATH or action ~= tpz.action.DESPAWN) then
            SpawnMob(16916926)
            player:messageSpecial(ID.text.TIME_RESTRICTION, data.limit)
            quasilumin:setLocalVar("escort", npc:getID())
            quasilumin:setLocalVar("progress", 0)
            quasilumin:setLocalVar("expire", os.time() + data.limit * 60)
            quasilumin:setPos(data.spawn)
            quasilumin:setStatus(tpz.status.NORMAL)
            -- !exec printf("%s", GetMobByID(16916926):getStatus())
            -- TODO: double check to make sure this will display text on first spawn and display animation
            quasilumin:showText(quasilumin, ID.text.REQUEST_CONFIRMED)
        else
            player:messageSpecial(ID.text.RECENTLY_ACTIVATED)
        end
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end