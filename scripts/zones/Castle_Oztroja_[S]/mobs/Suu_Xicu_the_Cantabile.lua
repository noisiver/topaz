-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Suu Xicu the Cantabile
-- BRD/BRD
-- Immune to Silence, Paralyze, Sleep, Bind, Gravity, Break
-- Army's Paeon gives hidden regen effect even if you dipel Paeon. Also gives to adds. Fades after ~1m?
-- Casts: Victory March, Horde Lullaby, Carnage Elegy, Magic Finale, Dragonfoe Mambo, Valor Minuet IV, Army's Paeon V, Knight's Minne IV
-- Cannot miss bard enfeebles (Capped MACC)
-- Cast Timer: 14s
-- Uses: Featherstorm, Sweep, Feathered Furore 
-- Summons two Duu Nazo's' at 50% and 25% HP. 4 Max. (once, regenning hp back doesn't force more adds)
-- Does not despawn adds on death.

-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 15)
end

function onMobRoam(mob, target)
    local mobId = mob:getID()
    local hpp = mob:getHPP()

    if hpp > 50 and mob:getLocalVar("petsOne") == 1 then
        mob:setLocalVar("petsOne", 0)

        for i = mobId + 5, mobId + 6 do
            local pet = GetMobByID(i)
            if pet:isSpawned() then
                DespawnMob(i)
            end
        end
    end

    if hpp > 25 and mob:getLocalVar("petsTwo") == 1 then
        mob:setLocalVar("petsTwo", 0)

        for i = mobId + 7, mobId + 8 do
            local pet = GetMobByID(i)
            if pet:isSpawned() then
                DespawnMob(i)
            end
        end
    end
end

function onMobFight(mob, target)
    local mobId = mob:getID()
    local hpp = mob:getHPP()
    local x = mob:getXPos()
    local y = mob:getYPos()
    local z = mob:getZPos()
    local r = mob:getRotPos()

    if hpp < 50 and mob:getLocalVar("petsOne") == 0 then
        mob:setLocalVar("petsOne", 1)

        for i = mobId + 5, mobId + 6 do
            local pet = GetMobByID(i)
            if not pet:isSpawned() then
                pet:setSpawn(x + math.random(-2, 2), y, z + math.random(-2, 2), r)
                pet:spawn()
            end
        end
    end

    if hpp < 25 and mob:getLocalVar("petsTwo") == 0 then
        mob:setLocalVar("petsTwo", 1)

        for i = mobId + 7, mobId + 8 do
            local pet = GetMobByID(i)
            if not pet:isSpawned() then
                pet:setSpawn(x + math.random(-2, 2), y, z + math.random(-2, 2), r)
                pet:spawn()
            end
        end
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end


function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(14400, 18000)) -- 4 to 5 hours
end
