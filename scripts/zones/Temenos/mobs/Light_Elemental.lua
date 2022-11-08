-----------------------------------
-- Area: Temenos E T
--  Mob: Light Elemental
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
    if mobID == ID.mob.TEMENOS_C_MOB[2]+1 or mobID == ID.mob.TEMENOS_C_MOB[2]+2 then
        mob:setMod(tpz.mod.UDMGMAGIC, -20)
        mob:setMod(tpz.mod.MDEF, 16)
    else
        mob:setMod(tpz.mod.UDMGMAGIC, -25)
        mob:setMod(tpz.mod.MDEF, 70)
    end
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.FLASH, {chance = 100})
end

function onMobEngaged(mob, target)
    local mobID = mob:getID()
    if mobID == ID.mob.TEMENOS_C_MOB[2]+1 then
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]+2):updateEnmity(target)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]):updateEnmity(target)
    elseif mobID == ID.mob.TEMENOS_C_MOB[2]+2 then
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]+1):updateEnmity(target)
        GetMobByID(ID.mob.TEMENOS_C_MOB[2]):updateEnmity(target)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        switch (mob:getID()): caseof
        {
            [ID.mob.TEMENOS_C_MOB[2]+1] = function()
                if GetMobByID(ID.mob.TEMENOS_C_MOB[2]):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[2]+2):isDead() then
                    GetNPCByID(ID.npc.TEMENOS_C_CRATE[2]):setStatus(tpz.status.NORMAL)
                end
            end,
            [ID.mob.TEMENOS_C_MOB[2]+2] = function()
                if GetMobByID(ID.mob.TEMENOS_C_MOB[2]):isDead() and GetMobByID(ID.mob.TEMENOS_C_MOB[2]+1):isDead() then
                    GetNPCByID(ID.npc.TEMENOS_C_CRATE[2]):setStatus(tpz.status.NORMAL)
                end
            end,
        }
    end
end
