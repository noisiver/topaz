-----------------------------------
-- Area: Dynamis - Tavnazia
--  Mob: Kindred Ranger
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ATTACK_SKILL_LIST, 1157)
end

function onMobDeath(mob, player, isKiller)
end
