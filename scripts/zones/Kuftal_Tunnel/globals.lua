-- Zone: Kuftal Tunnel (174)
-- Desc: this file contains functions that are shared by multiple luas in this zone's directory
-----------------------------------
local ID = require("scripts/zones/Kuftal_Tunnel/IDs")
require("scripts/globals/status")
-----------------------------------

KUFTAL_TUNNEL = {
    --[[..............................................................................................
        move Phantom Worm QM
        ..............................................................................................]]
    movePhantomWormQM = function()
        local npc = GetNPCByID(ID.npc.PHANTOM_WORM_QM)

        switch (math.random(1, 7)): caseof
        {
            [1] = function (x) npc:setPos(71.571, 30.241, 110.704) end,
            [2] = function (x) npc:setPos(75.758, 30.000, 125.815) end,
            [3] = function (x) npc:setPos(65.222, 29.364, 131.645) end,
            [4] = function (x) npc:setPos(60.740, 22.638, 86.1781) end,
            [5] = function (x) npc:setPos(80.460, 30.293, 112.721) end,
            [6] = function (x) npc:setPos(76.929, 30.050, 127.630) end,
            [7] = function (x) npc:setPos(68.810, 30.175, 123.516) end,
        }
        npc:timer(5000, function(npc) KUFTAL_TUNNEL.movePhantomWormQM() end)
    end
}

return KUFTAL_TUNNEL
