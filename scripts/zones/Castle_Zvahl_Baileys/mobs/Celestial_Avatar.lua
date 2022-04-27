-----------------------------------
-- Area: Castle Zvahl Baileys
--  Mob: Celestial Avatar
-- Note: Summoned mechanic Avatar for Grand Duke Batym
-----------------------------------
local ID = require("scripts/zones/Castle_Zvahl_Baileys/IDs")
-----------------------------------
function onMobSpawn(mob)
    -- Spawns as a random avatar
    mob:setModelId(math.random(793, 798))    
    local skillList = nil
    local spellList = nil
    local modelID = mob:getModelId()
    -- Set skill and spell list based on avatar model
    switch (modelID) : caseof
    {
            [793] = function (x) skillList = 38 spellList = 441 end, -- Ifrit
            [794] = function (x) skillList = 45 spellList = 440 end, -- Titan
            [795] = function (x) skillList = 40 spellList = 442 end, -- Leviathan
            [796] = function (x) skillList = 37 spellList = 443 end, -- Garuda
            [797] = function (x) skillList = 44 spellList = 438 end, -- Shiva
            [798] = function (x) skillList = 43 spellList = 439 end, -- Ramuh
    }

    if (skillList ~= nil and spellList ~= nil) then
        mob:setMobMod(tpz.mobMod.SKILL_LIST, skillList)
        mob:setSpellList(spellList)
    end
    mob:setDamage(110)
    mob:setMod(tpz.mod.UDMGPHYS, 200)
    mob:setMod(tpz.mod.UDMGRANGE, 200)
    mob:setMod(tpz.mod.UDMGMAGIC, 200)
    mob:setMod(tpz.mod.DMGBREATH, 200)
    mob:setMod(tpz.mod.SDT_FIRE, 100)
    mob:setMod(tpz.mod.SDT_ICE, 100)
    mob:setMod(tpz.mod.SDT_WIND, 100)
    mob:setMod(tpz.mod.SDT_EARTH, 100)
    mob:setMod(tpz.mod.SDT_THUNDER, 100)
    mob:setMod(tpz.mod.SDT_WATER, 100)
    mob:setMod(tpz.mod.SDT_LIGHT, 100)
    mob:setMod(tpz.mod.SDT_DARK, 100)
    mob:addImmunity(tpz.immunity.SLEEP)
    mob:addImmunity(tpz.immunity.GRAVITY)
    mob:addImmunity(tpz.immunity.BIND)
end

function onMobDeath(mob, player, isKiller)
    local Batym = GetMobByID(17436927)
    Batym:setLocalVar("AvatarPhase", 0)
end

function onMobDespawn(mob)
end
