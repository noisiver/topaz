-----------------------------------
-- Area: Apollyon NW
--  Mob: Millenary Mossback
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobSpawn(mob)
    mob:setMod(tpz.mod.DEF, 4000)
    mob:addMod(tpz.mod.MDEF, 15)
    mob:setMod(tpz.mod.UDMGMAGIC, -15)
    mob:setMod(tpz.mod.SDT_LIGHT, 70)
    mob:setMod(tpz.mod.SDT_WIND, 70)
    mob:setMod(tpz.mod.SDT_THUNDER, 70)
    mob:setMod(tpz.mod.SDT_DARK, 70)
    mob:setMod(tpz.mod.SDT_FIRE, 70)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        GetNPCByID(ID.npc.APOLLYON_NW_CRATE[3][1]):setPos(mobX, mobY, mobZ)
        GetNPCByID(ID.npc.APOLLYON_NW_CRATE[3][1]):setStatus(tpz.status.NORMAL)
    end
end
