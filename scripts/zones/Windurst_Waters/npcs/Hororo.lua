-----------------------------------
-- Area: Windurst Waters
--  NPC: Hororo
-- Working 100%
-----------------------------------
require("scripts/globals/settings")
local ID = require("scripts/zones/Windurst_Waters/IDs")

require("scripts/globals/pathfind")
-----------------------------------
local flags = tpz.path.flag.RUN
local path =
{
    -3.357, -1.000, 72.110,
    -1.515, -1.000, 74.222,
    -0.882, -1.049, 75.426,
    -0.446, -1.732, 77.128,
    0.140, -3.025, 80.003,
    0.635, -4.285, 82.479,
    1.022, -5.000, 84.439,
    0.906, -5.000, 85.585,
    0.451, -5.000, 86.603,
    -1.006, -5.000, 89.196,
    -1.887, -5.000, 90.184,
    -3.032, -5.000, 90.623,
    -3.785, -5.000, 90.813,
    -5.889, -5.000, 91.243,
    -7.119, -5.000, 90.895,
    -7.830, -5.000, 90.544,
    -8.612, -5.000, 90.125,
    -10.465, -5.000, 88.799,
    -11.703, -5.000, 86.927,
    -12.198, -5.000, 86.112,
    -12.725, -5.000, 85.238,
    -12.808, -5.000, 84.916,
    -12.808, -5.000, 84.916,
    -12.808, -5.000, 84.916,
    -12.808, -5.000, 84.916,
    -12.808, -5.000, 84.916,
    -12.808, -5.000, 84.916,
    -12.754, -4.490, 83.009,
    -12.702, -3.628, 81.166,
    -12.653, -2.785, 79.410,
    -12.611, -2.033, 77.917,
    -12.532, -1.070, 75.112,
    -11.532, -1.002, 72.400,
    -10.140, -1.000, 71.435,
    -8.912, -1.000, 71.263,
    -7.203, -1.000, 71.262,
    -4.422, -1.000, 71.349,
}

function onSpawn(npc)
    npc:initNpcAi()
    npc:setPos(tpz.path.first(path))
    onPath(npc)
end

function onPath(npc)
    tpz.path.patrolsimple(npc, path, flags)
end

function onTrade(player, npc, trade)
    onStarlightSmilebringersTrade(player, trade, npc)
end

function onTrigger(player, npc)
    player:startEvent(570)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
