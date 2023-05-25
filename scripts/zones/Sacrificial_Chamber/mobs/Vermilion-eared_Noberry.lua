-----------------------------------
-- Area: Sacrificial Chamber
--  Mob: Vermilion-eared Noberry
-- BCNM: Jungle Boogymen
-----------------------------------
mixins =
{
    require("scripts/mixins/families/tonberry"),
    require("scripts/mixins/job_special")
}
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobDeath(mob, player, isKiller)
    local elementalId = mob:getID() + 1
    if GetMobByID(elementalId):isSpawned() then
        DespawnMob(elementalId)
    end
end
