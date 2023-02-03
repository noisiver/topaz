-----------------------------------
-- Area: Temenos E T
--  Mob: Thunder Elemental
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/mobs")
require("scripts/globals/pathfind")
local ID = require("scripts/zones/Temenos/IDs")
local flags = tpz.path.flag.WALLHACK
local path =
{
    [0] = 
    {
        {-312.000, 0.000, 128.000},
        {-312.000, 0.000, 152.000}
    },
    [1] = 
    {
        {-300.000, 0.000, 152.000},
        {-300.000, 0.000, 128.000}
    },
    [2] = 
    {
        {-248.000, 0.000, 152.000},
        {-248.000, 0.000, 128.000}
    },
    [3] = 
    {
        {-260.000, 0.000, 128.000},
        {-260.000, 0.000, 152.000}
    },
}

function onMobSpawn(mob)
    mob:setMod(tpz.mod.HTHRES, 750)
    mob:setMod(tpz.mod.SLASHRES, 750)
    mob:setMod(tpz.mod.PIERCERES, 750)
    mob:setMod(tpz.mod.RANGEDRES, 750)
    mob:setMod(tpz.mod.IMPACTRES, 750)
    local mobID = mob:getID()
    if mobID == ID.mob.TEMENOS_C_MOB[2]+7 then
        mob:setMod(tpz.mod.UDMGMAGIC, -20)
        mob:setMod(tpz.mod.MDEF, 12)
    else
        mob:setMod(tpz.mod.UDMGMAGIC, 0)
        mob:setMod(tpz.mod.MDEF, 0)
    end
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 5)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 5)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.STUN, {chance = 100})
end

function onMobRoam(mob)
    if mob:getBattlefieldID() == 1300 then
        local offset = mob:getID() - ID.mob.TEMENOS_E_MOB[5]
        local pause = mob:getLocalVar("pause")
        if pause < os.time() then
            local point = (mob:getLocalVar("point") % 2)+1
            mob:setLocalVar("point", point)
            mob:pathTo(path[offset][point][1], path[offset][point][2], path[offset][point][3], flags)
            mob:setLocalVar("pause", os.time()+10)
        end
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        local battlefield = mob:getBattlefield()
        if battlefield:getLocalVar("crateOpenedF5") ~= 1 then
            local mobID = mob:getID()
            if mobID >= ID.mob.TEMENOS_C_MOB[2] then
                GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(tpz.mod.SDT_THUNDER, 100)
                if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+8):isAlive() then
                    DespawnMob(ID.mob.TEMENOS_C_MOB[2]+8)
                    SpawnMob(ID.mob.TEMENOS_C_MOB[2]+14)
                end
            else
                local mobX = mob:getXPos()
                local mobY = mob:getYPos()
                local mobZ = mob:getZPos()
                local crateID = ID.npc.TEMENOS_E_CRATE[5] + (mobID - ID.mob.TEMENOS_E_MOB[5])
                GetNPCByID(crateID):setPos(mobX, mobY, mobZ)
                tpz.limbus.spawnRandomCrate(crateID, player, "crateMaskF5", battlefield:getLocalVar("crateMaskF5"), true)
            end
        end
    end
end
