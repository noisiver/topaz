-----------------------------------
-- Area: The Shrine of Ru'Avitau
--   NM: Slave Globe
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/pathfind")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.MOVE, 45)
    onPath(mob)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.STUN)
end

function onPath(mob)
    local mother = GetMobByID(ID.mob.MOTHER_GLOBE.MOTHER)
    if mother:isSpawned() then
        local mobId = mob:getID()
        local pPet = GetMobByID(mobId - 1)
        switch (mobId): caseof {
            [17506397] = function() mob:pathTo(mother:getXPos() + 0.15, mother:getYPos(), mother:getZPos() + 0.15) end,
            [17506398] = function() mob:pathTo(pPet:getXPos() + 0.15, pPet:getYPos(), pPet:getZPos() + 0.15) end,
            [17506399] = function() mob:pathTo(pPet:getXPos() + 0.15, pPet:getYPos(), pPet:getZPos() + 0.15) end,
            [17506400] = function() mob:pathTo(pPet:getXPos() + 0.15, pPet:getYPos(), pPet:getZPos() + 0.15) end,
            [17506401] = function() mob:pathTo(pPet:getXPos() + 0.15, pPet:getYPos(), pPet:getZPos() + 0.15) end,
            [17506402] = function() mob:pathTo(pPet:getXPos() + 0.15, pPet:getYPos(), pPet:getZPos() + 0.15) end,
        }
    end
end

function onMobEngaged(mob, target)
    local mother = GetMobByID(ID.mob.MOTHER_GLOBE.MOTHER)
    if mother:getCurrentAction() == tpz.act.ROAMING then
        mother:updateEnmity(target)
    end

    for i = ID.mob.MOTHER_GLOBE.SLAVE_START, ID.mob.MOTHER_GLOBE.SLAVE_END do
        if i ~= mob:getID() then
            local slave = GetMobByID(i)
            if slave and slave:getCurrentAction() == tpz.act.ROAMING then
                slave:updateEnmity(target)
            end
        end
    end
end

function onMobFight(mob, target)
    mob:setMod(tpz.mod.DEF, 329) 
    mob:setMod(tpz.mod.ATT, 378)
    mob:setMod(tpz.mod.ACC, 321) 
    mob:setMod(tpz.mod.EVA, 302)
    mob:setMod(tpz.mod.MDEF, 0)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.UDMGPHYS, 0)
    mob:setMod(tpz.mod.UDMGMAGIC, 0)
    mob:setMod(tpz.mod.UDMGBREATH, 0)
    mob:setMod(tpz.mod.SDT_WATER, 100)
    mob:setMod(tpz.mod.SDT_LIGHT, 100)
    mob:setMod(tpz.mod.SDT_EARTH, 100)
    mob:setMod(tpz.mod.SDT_WIND, 100)
    mob:setMod(tpz.mod.SDT_THUNDER, 150)
    mob:setMod(tpz.mod.SDT_DARK, 100)
    mob:setMod(tpz.mod.SDT_FIRE, 100)
    mob:setMod(tpz.mod.SDT_ICE, 100)
	mob:setMobMod(tpz.mobMod.SHARE_TARGET, 17506396)
end

function onMobDeath(mob)
end

function onMobDespawn(mob)
    local mother = GetMobByID(ID.mob.MOTHER_GLOBE.MOTHER)
    if mother:isSpawned() then
        mother:setLocalVar("SlavesSpawned", mother:getLocalVar("SlavesSpawned") - 1)
    end
end

