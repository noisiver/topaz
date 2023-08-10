-----------------------------------
-- Area: Jugner Forest [S]
--   ANNM
--   NM: Greater Gnole
--  !addkeyitem RED_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------
function onMobSpawn(mob)
    mob:AnimationSub(0)
    tpz.annm.PetMods(mob) 
end

function onMobFight(mob, target)
    -- Delay reduction based on monphase
    local moon = utils.getMoonPhase()
    local moonphase = 0
    if (moon == 'Full') then
            mob:setMod(tpz.mod.MARTIAL_ARTS, 280)
        mob:addMod(tpz.mod.EVA, 60)
    elseif (moon == 'Gibbeus') then
        mob:setMod(tpz.mod.MARTIAL_ARTS, 200)
        mob:addMod(tpz.mod.EVA, 30)
    elseif (moon == 'Quarter') then
            mob:setMod(tpz.mod.MARTIAL_ARTS, 150)
    elseif (moon == 'Cresecent') then
        mob:setMod(tpz.mod.MARTIAL_ARTS, 70)
        mob:addMod(tpz.mod.EVA, -30)
    elseif (moon == 'New') then
        mob:setMod(tpz.mod.MARTIAL_ARTS, 20)
        mob:addMod(tpz.mod.EVA, -60)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
end
