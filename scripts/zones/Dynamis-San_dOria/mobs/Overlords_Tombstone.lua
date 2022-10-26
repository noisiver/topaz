-----------------------------------
-- Area: Dynamis - San d'Oria
--  Mob: Overlord's Tombstone
-- Note: Mega Boss
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.REFRESH, 300)
    mob:delImmunity(tpz.immunity.STUN)
    mob:delImmunity(tpz.immunity.PARALYZE)
    mob:delImmunity(tpz.immunity.BLIND)
    mob:delImmunity(tpz.immunity.POISON)
end

function onMobEngaged(mob, target)
    local mobId = mob:getID()
    for i = mobId + 1, mobId + 2 do
        if not GetMobByID(i):isSpawned() then
            SpawnMob(i):updateEnmity(target)
        end
    end
end

function onMobDeath(mob, player, isKiller)
    dynamis.megaBossOnDeath(mob, player, isKiller)

    if isKiller then
        local mobId = mob:getID()
        for i = mobId + 1, mobId + 2 do
            if GetMobByID(i):isSpawned() then
                DespawnMob(i)
            end
        end
    end
end
