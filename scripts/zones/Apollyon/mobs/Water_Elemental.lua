-----------------------------------
-- Area: Apollyon SW
--  Mob: Water Elemental
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Apollyon/IDs")

function onMobSpawn(mob)
    mob:setMod(tpz.mod.HTHRES, 750)
    mob:setMod(tpz.mod.SLASHRES, 750)
    mob:setMod(tpz.mod.PIERCERES, 750)
    mob:setMod(tpz.mod.IMPACTRES, 750)
end

function onMobEngaged(mob, target)
    GetMobByID(ID.mob.APOLLYON_SW_MOB[4]+6):updateEnmity(target)
    GetMobByID(ID.mob.APOLLYON_SW_MOB[4]+14):updateEnmity(target)
    GetMobByID(ID.mob.APOLLYON_SW_MOB[4]+22):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        if tpz.limbus.elementalsDead() then
            GetNPCByID(ID.npc.APOLLYON_SW_CRATE[4]):setStatus(tpz.status.NORMAL)
        end
    end
end
