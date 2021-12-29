-----------------------------------
-- Area: Dynamis - Jeuno
--  Mob: Goblin Golem
-- Note: Mega Boss
-----------------------------------
require("scripts/globals/dynamis")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobFight(mob, target)
	mob:setDamage(250)
    mob:setMod(tpz.mod.REFRESH, 300)
end

function onMobDeath(mob, player, isKiller)
    dynamis.megaBossOnDeath(mob, player, isKiller)
end
