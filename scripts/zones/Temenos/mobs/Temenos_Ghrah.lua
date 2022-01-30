-----------------------------------
-- Area: Temenos
--  Mob: Temenos Ghrah
-----------------------------------
local ID = require("scripts/zones/Temenos/IDs")

function onMobSpawn(mob)
    mob:addMod(tpz.mod.MDEF, 30)
    mob:setMod(tpz.mod.UDMGMAGIC, -25)
    mob:AnimationSub(1)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        local battlefield = mob:getBattlefield()
        battlefield:setLocalVar("lootSpawned", 0)
        GetNPCByID(ID.npc.TEMENOS_C_CRATE[5]):setStatus(tpz.status.NORMAL)
    end
end
