-----------------------------------
--   Area: Batallia Downs [S]
--   ANNM
--   NM: Scythefang Liger
--  !addkeyitem RED_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
-----------------------------------
local tpMoves = {271, 273, 1680, 1681, 2207}

function onMobSpawn(mob)
    mob:setLocalVar("roarTimer", os.time() + 45)
    tpz.annm.NMMods(mob) 
end

function onMobFight(mob, target)
    local roarTimer = mob:getLocalVar("roarTimer")

    -- Uses Roar 10 times in a row then a random TP move
    if os.time() >= roarTimer then
        mob:setLocalVar("roarTimer", os.time() + 90)
        mob:useMobAbility(270) -- Reuse roar
        mob:useMobAbility(270) -- Reuse roar
        mob:useMobAbility(270) -- Reuse roar
        mob:useMobAbility(270) -- Reuse roar
        mob:useMobAbility(270) -- Reuse roar
        mob:useMobAbility(270) -- Reuse roar
        mob:useMobAbility(270) -- Reuse roar
        mob:useMobAbility(270) -- Reuse roar
        mob:useMobAbility(270) -- Reuse roar
        mob:useMobAbility(270) -- Reuse roar
        mob:useMobAbility(tpMoves[math.random(#tpMoves)]) -- Use a random non-roar TP move
    end

    tpz.annm.PetShield(mob, 17121699, 17121704)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
