-----------------------------------
-- Area: Aydeewa Subterrane
--  NPC: Damp Soil
-- Spawns Crystal Eater
-- !gotoid 17056365
-----------------------------------
local ID = require("scripts/zones/Aydeewa_Subterrane/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)
    local crystals =
    {
        [1] = 4096, 
        [2] = 4098,
        [3] = 4099,
        [4] = 4100,
        [5] = 4101,
        [6] = 4102,
        [7] = 4103,
        [8] = 4104,
    }
    local positions =
    {
        {-302.285,   36.687,    -32.392},
        {-308.9644,  36.7856,   -1.1265},
        {-314.3235,  36.9701,  -15.5626},
        {-272.4044,  36.5532,  -64.8852},
        {-274.8207,  36.7241,  -96.9227},
        {-260.1673,  36.2386,  -27.9922},
        {-276.5262,  36.7957,  -96.8899},
    }
    local funguars =
    { {17056106}, {17056107}, {17056110}, {17056111} }

    for _,v in pairs(crystals) do
        if npcUtil.tradeHas(trade, v) then 
            player:confirmTrade()
            local newPosition = npcUtil.pickNewPosition(ID.npc.DAMPSOIL, positions)
            GetNPCByID(ID.npc.DAMPSOIL):setPos(newPosition.x, newPosition.y, newPosition.z)
            if math.random(100) <= 5 and npcUtil.popFromQM(player, npc, ID.mob.CRYSTAL_EATER, {radius = 5, hide = 14400}) then
                player:messageSpecial(ID.text.DRAWS_NEAR)
            else
                npcUtil.popFromQM(player, npc, funguars[math.random(#funguars)], {radius = 5, hide = 0})
            end
        end
    end
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS)
end
