-----------------------------------
-- Area: Castle Zvahl Baileys
--  Mob: Celestial Avatar
-- Note: Summoned mechanic Avatar for Grand Duke Batym
-----------------------------------
local ID = require("scripts/zones/Castle_Zvahl_Baileys/IDs")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------
local avatars =
{
   [8] = 'Fire Spirit',
   [9] = 'Ice Spirit',
   [10] = 'Air Spirit',
   [11] = 'Earth Spirit',
   [12] = 'Water Spirit',
   [13] = 'Thunder Spirit',
   [14] = 'Light Spirit',
   [15] = 'Dark Spirit',
   [16] = 'Carbuncle',
   [17] = 'Fenrir',
   [18] = 'Ifrit',
   [19] = 'Titan',
   [20] = 'Leviathan',
   [21] = 'Garuda',
   [22] = 'Shiva',
   [23] = 'Ramuh',
   [25] = 'Diabolos',
   [2159] = 'Cait Sith'
}

function setCelestialResistances(mob)
    local pet = avatars[mob:getModelId()]

    if (pet == nil) then
      return
    end

    if (pet == 'Fire Spirit') or (pet == 'Ifrit') then
        mob:setMod(tpz.mod.SDT_FIRE, 5)
        mob:setMod(tpz.mod.SDT_ICE, 5)
        mob:setMod(tpz.mod.SDT_WATER, 150)
        mob:setMod(tpz.mod.EEM_AMNESIA, 5)
        mob:setMod(tpz.mod.EEM_VIRUS, 5)
        mob:setMod(tpz.mod.EEM_PARALYZE, 5)
        mob:setMod(tpz.mod.EEM_BIND, 5)
        mob:setMod(tpz.mod.EEM_POISON, 150)
    elseif (pet == 'Ice Spirit') or (pet == 'Shiva') then
        mob:setMod(tpz.mod.SDT_FIRE, 150)
        mob:setMod(tpz.mod.SDT_ICE, 5)
        mob:setMod(tpz.mod.SDT_WIND, 5)
        mob:setMod(tpz.mod.EEM_AMNESIA, 150)
        mob:setMod(tpz.mod.EEM_VIRUS, 150)
        mob:setMod(tpz.mod.EEM_SILENCE, 5)
        mob:setMod(tpz.mod.EEM_GRAVITY, 5)
        mob:setMod(tpz.mod.EEM_PARALYZE, 5)
        mob:setMod(tpz.mod.EEM_BIND, 5)
    elseif (pet == 'Air Spirit') or (pet == 'Garuda') then
        mob:setMod(tpz.mod.SDT_ICE, 150)
        mob:setMod(tpz.mod.SDT_WIND, 5)
        mob:setMod(tpz.mod.SDT_EARTH, 5)
        mob:setMod(tpz.mod.EEM_SILENCE, 5)
        mob:setMod(tpz.mod.EEM_GRAVITY, 5)
        mob:setMod(tpz.mod.EEM_PARALYZE, 150)
        mob:setMod(tpz.mod.EEM_BIND, 150)
        mob:setMod(tpz.mod.EEM_SLOW, 5)
        mob:setMod(tpz.mod.EEM_PETRIFY, 5)
        mob:setMod(tpz.mod.EEM_TERROR, 5)
    elseif (pet == 'Earth Spirit') or (pet == 'Titan') then
        mob:setMod(tpz.mod.SDT_WIND, 150)
        mob:setMod(tpz.mod.SDT_EARTH, 5)
        mob:setMod(tpz.mod.SDT_THUNDER, 5)
        mob:setMod(tpz.mod.EEM_SILENCE, 150)
        mob:setMod(tpz.mod.EEM_GRAVITY, 150)
        mob:setMod(tpz.mod.EEM_STUN, 5)
        mob:setMod(tpz.mod.EEM_SLOW, 5)
        mob:setMod(tpz.mod.EEM_PETRIFY, 5)
        mob:setMod(tpz.mod.EEM_TERROR, 5)
    elseif (pet == 'Thunder Spirit') or (pet == 'Ramuh') then
        mob:setMod(tpz.mod.SDT_EARTH, 150)
        mob:setMod(tpz.mod.SDT_THUNDER, 5)
        mob:setMod(tpz.mod.SDT_WATER, 5)
        mob:setMod(tpz.mod.EEM_STUN, 5)
        mob:setMod(tpz.mod.EEM_SLOW, 150)
        mob:setMod(tpz.mod.EEM_PETRIFY, 150)
        mob:setMod(tpz.mod.EEM_TERROR, 150)
        mob:setMod(tpz.mod.EEM_POISON, 5)
    elseif (pet == 'Water Spirit') or (pet == 'Leviathan') then
        mob:setMod(tpz.mod.SDT_FIRE, 5)
        mob:setMod(tpz.mod.SDT_THUNDER, 150)
        mob:setMod(tpz.mod.SDT_WATER, 5)
        mob:setMod(tpz.mod.EEM_AMNESIA, 5)
        mob:setMod(tpz.mod.EEM_VIRUS, 5)
        mob:setMod(tpz.mod.EEM_STUN, 150)
        mob:setMod(tpz.mod.EEM_POISON, 5)
    elseif (pet == 'Light Spirit') or (pet == 'Carbuncle') or (pet == 'Cait Sith') then
        mob:setMod(tpz.mod.SDT_LIGHT, 5)
        mob:setMod(tpz.mod.SDT_DARK, 150)
        mob:setMod(tpz.mod.EEM_LIGHT_SLEEP, 5)
        mob:setMod(tpz.mod.EEM_CHARM, 5)
        mob:setMod(tpz.mod.EEM_DARK_SLEEP, 150)
        mob:setMod(tpz.mod.EEM_BLIND, 150)
    elseif (pet == 'Dark Spirit') or (pet == 'Fenrir') or (pet == 'Diabolos') then
        mob:setMod(tpz.mod.SDT_LIGHT, 150)
        mob:setMod(tpz.mod.SDT_DARK, 5)
        mob:setMod(tpz.mod.EEM_LIGHT_SLEEP, 150)
        mob:setMod(tpz.mod.EEM_CHARM, 150)
        mob:setMod(tpz.mod.EEM_DARK_SLEEP, 5)
        mob:setMod(tpz.mod.EEM_BLIND, 5)
    end
end

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
    mob:addImmunity(tpz.immunity.SLEEP)
    mob:addImmunity(tpz.immunity.GRAVITY)
    mob:addImmunity(tpz.immunity.BIND)
        -- First set all SDT's and EEM's to 100
        for v = tpz.mod.SDT_FIRE, tpz.mod.SDT_DARK, 1 do
            mob:setMod(v, 100)
        end
        for v = tpz.mod.EEM_AMNESIA, tpz.mod.EEM_BLIND, 1 do
            mob:setMod(v, 100)
        end
        setCelestialResistances(mob)
end

function onMobDeath(mob, player, isKiller)
    local Batym = GetMobByID(17436927)
    Batym:setLocalVar("AvatarPhase", 0)
end

function onMobDespawn(mob)
end
