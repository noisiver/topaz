-----------------------------------
-- Area: Temenos E T
--  Mob: Fire Elemental
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/mobs")
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.HTHRES, 750)
    mob:setMod(tpz.mod.SLASHRES, 750)
    mob:setMod(tpz.mod.PIERCERES, 750)
    mob:setMod(tpz.mod.RANGEDRES, 750)
    mob:setMod(tpz.mod.IMPACTRES, 750)
    local mobID = mob:getID()
    if mobID == ID.mob.TEMENOS_C_MOB[2]+3 then
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
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PLAGUE, {chance = 100})
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        local battlefield = mob:getBattlefield()
        if battlefield:getLocalVar("crateOpenedF1") ~= 1 then
            local mobID = mob:getID()
            if mobID >= ID.mob.TEMENOS_C_MOB[2] then
                GetMobByID(ID.mob.TEMENOS_C_MOB[2]):setMod(tpz.mod.SDT_FIRE, 100)
                if GetMobByID(ID.mob.TEMENOS_C_MOB[2]+4):isAlive() then
                    DespawnMob(ID.mob.TEMENOS_C_MOB[2]+4)
                    SpawnMob(ID.mob.TEMENOS_C_MOB[2]+10)
                end
            else
                local mobX = mob:getXPos()
                local mobY = mob:getYPos()
                local mobZ = mob:getZPos()
                local crateID = ID.npc.TEMENOS_E_CRATE[1] + (mobID - ID.mob.TEMENOS_E_MOB[1])
                GetNPCByID(crateID):setPos(mobX, mobY, mobZ)
                tpz.limbus.spawnRandomCrate(crateID, player, "crateMaskF1", battlefield:getLocalVar("crateMaskF1"), true)
            end
        end
    end
end
