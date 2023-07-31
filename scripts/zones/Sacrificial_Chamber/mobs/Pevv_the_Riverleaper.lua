-----------------------------------
-- Area: Sacrificial Chamber
--  Mob: Pevv the Riverleaper
-- BCNM: Amphibian Assault
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobFight(mob, target)
    -- spawn pet wyvern and assign it a target
    local mobId = mob:getID()
    local pet = GetMobByID(mobId + 2)
    if not pet:isSpawned() then
        SpawnMob(mobId + 2):updateEnmity(target)
    elseif pet:getCurrentAction() == tpz.act.ROAMING then
        pet:updateEnmity(target)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    DespawnMob(mob:getID() + 2)
end
