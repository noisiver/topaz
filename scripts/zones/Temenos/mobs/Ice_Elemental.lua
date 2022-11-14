-----------------------------------
-- Area: Temenos E T
--  Mob: Ice Elemental
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/mobs")
require("scripts/globals/pathfind")
local ID = require("scripts/zones/Temenos/IDs")
local flags = tpz.path.flag.NONE
local path =
{
    [0] = 
    {
        {200.000, -161.000, 197.000},
        {200.000, -161.000, 190.000}
    },
    [1] = 
    {
        {197.000, -161.000, 200.000},
        {190.000, -161.000, 200.000}
    },
    [2] = 
    {
        {200.000, -161.000, 203.000},
        {200.000, -161.000, 210.000}
    },
    [3] = 
    {
        {203.000, -161.000, 200.000},
        {210.000, -161.000, 200.000}
    },
}

function onMobSpawn(mob)
    mob:setMod(tpz.mod.HTHRES, 750)
    mob:setMod(tpz.mod.SLASHRES, 750)
    mob:setMod(tpz.mod.PIERCERES, 750)
    mob:setMod(tpz.mod.RANGEDRES, 750)
    mob:setMod(tpz.mod.IMPACTRES, 750)
    local mobID = mob:getID()
    if mobID == ID.mob.TEMENOS_C_MOB[2]+4 then
        mob:setMod(tpz.mod.UDMGMAGIC, -20)
        mob:setMod(tpz.mod.MDEF, 12)
    else
        mob:setMod(tpz.mod.UDMGMAGIC, -25)
        mob:setMod(tpz.mod.MDEF, 70)
    end
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PARALYZE, {power = 35, chance = 100})
end

function onMobRoam(mob)
    if mob:getBattlefieldID() == 1300 then
        local offset = mob:getID() - ID.mob.TEMENOS_E_MOB[2]
        local pause = mob:getLocalVar("pause")
        if pause < os.time() then
            local point = (mob:getLocalVar("point") % 2)+1
            mob:setLocalVar("point", point)
            mob:pathTo(path[offset][point][1], path[offset][point][2], path[offset][point][3], flags)
            mob:setLocalVar("pause", os.time()+5)
        end
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        local battlefield = mob:getBattlefield()
        if battlefield:getLocalVar("crateOpenedF2") ~= 1 then
            local mobID = mob:getID()
            if mobID >= ID.mob.TEMENOS_C_MOB[2] then
                GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(tpz.mod.SDT_ICE, 100)
                if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+5):isAlive() then
                    DespawnMob(ID.mob.TEMENOS_C_MOB[2]+5)
                    SpawnMob(ID.mob.TEMENOS_C_MOB[2]+11)
                end
            else
                local mobX = mob:getXPos()
                local mobY = mob:getYPos()
                local mobZ = mob:getZPos()
                local crateID = ID.npc.TEMENOS_E_CRATE[2] + (mobID - ID.mob.TEMENOS_E_MOB[2])
                GetNPCByID(crateID):setPos(mobX, mobY, mobZ)
                tpz.limbus.spawnRandomCrate(crateID, player, "crateMaskF2", battlefield:getLocalVar("crateMaskF2"), true)
            end
        end
    end
end
