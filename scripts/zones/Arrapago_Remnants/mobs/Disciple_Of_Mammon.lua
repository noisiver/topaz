-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Disciple Of Mammon (Imp NM)
-- ID: 17081107
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
-----------------------------------
function onMobSpawn(mob)
    mob:setDamage(75)
    mob:setMod(tpz.mod.ATTP, -50)
    mob:setMod(tpz.mod.DEFP, -25)
    mob:setMod(tpz.mod.EVA, -25)
    mob:setLocalVar("forcedTPMove", 0)
end

function onMobEngaged(mob, target)
    local mobid = mob:getID(instance)
    -- Despawn summoned imps on engage
    for impId = mobid + 1, mobid + 5 do
        DespawnMob(impId, instance)
    end
    mob:setLocalVar("forcedTPMove", 0)
    mob:setLocalVar("msgTimer", os.time() + 45)
end

function onMobFight(mob, target)
    local hpp = mob:getHPP()
    local forcedTPMove = mob:getLocalVar("forcedTPMove")

    if (hpp <= 69) and (forcedTPMove == 0) then
        mob:setLocalVar("forcedTPMove", 1)
        mob:useMobAbility(1712) -- Bugle Call
    elseif (hpp <= 39) and (forcedTPMove == 1) then
        mob:setLocalVar("forcedTPMove", 2)
        mob:useMobAbility(2888) -- Dark Recital
    elseif (hpp <= 19) and (forcedTPMove == 2) then
        mob:setLocalVar("forcedTPMove", 3)
        mob:useMobAbility(1712) -- Bugle Call
    end
end

function onMobWeaponSkillPrepare(mob, target)
   local tpMoves = {1711, 2003, 2004}
   -- Frenetic Rip, Grating Tantara, Stifling Tantara
   return tpMoves[math.random(#tpMoves)]
end

function onMobDeath(mob, player, isKiller, noKiller)
    local instance = mob:getInstance()
    local mobid = mob:getID(instance)

    if isKiller or noKiller then
        -- Increase progress counter, at 4 turn teleporter back on
        instance:setProgress(instance:getProgress() +1) 
    end

    -- Despawn summoned imps on death
    for impId = mobid + 1, mobid + 5 do
        DespawnMob(impId, instance)
    end
end

function onMobDespawn(mob)
    local mobid = mob:getID(instance)
    -- Despawn summoned imps on despawn
    for impId = mobid + 1, mobid + 5 do
        DespawnMob(impId, instance)
    end
end