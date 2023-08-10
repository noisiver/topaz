-----------------------------------
-- Area: Al'Taieu
--  Mob: Om'aern
-----------------------------------
mixins = {require("scripts/mixins/families/aern")}
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobEngaged(mob, target)
	mob:SetMagicCastingEnabled(true)
	if mob:getMainJob() == tpz.job.DRG or mob:getMainJob() == tpz.job.BST then
		mob:spawnPet()
	end
end

function onMobSpawn(mob)
	mob:SetMagicCastingEnabled(false)
end

function onMobRoam(mob)
	mob:SetMagicCastingEnabled(false)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
