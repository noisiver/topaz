-----------------------------------
-- Area: Mount Zhayolm
--   NM: Garhorlur_the_Brutal
-----------------------------------
mixins = {
require("scripts/mixins/weapon_break"),
require("scripts/mixins/job_special")
}
require("scripts/globals/pathfind")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobEngaged(mob, target)
    for v = 17027467, 17027469 do
        GetMobByID(v):updateEnmity(target)
    end
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
