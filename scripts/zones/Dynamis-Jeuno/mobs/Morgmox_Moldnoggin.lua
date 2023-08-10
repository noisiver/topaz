-----------------------------------
-- Area: Dynamis - Jeuno
--  Mob: Morgmox Moldnoggin
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------
function onMobEngaged(mob, target)
	mob:spawnPet()
end

function onMobDeath(mob, player, isKiller, noKiller)
end
