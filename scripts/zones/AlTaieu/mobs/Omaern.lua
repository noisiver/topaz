-----------------------------------
-- Area: Al'Taieu
--  Mob: Om'aern
-----------------------------------
mixins = {require("scripts/mixins/families/aern")}
require("scripts/globals/mobs")
-----------------------------------
function onMobEngaged(mob, target)
	if mob:getMainJob() == tpz.job.DRG or mob:getMainJob() == tpz.job.SMN then
		mob:spawnPet()
	end
end

function onMobDeath(mob, player, isKiller)
end
