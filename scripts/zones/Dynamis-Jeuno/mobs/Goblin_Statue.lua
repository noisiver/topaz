-----------------------------------
-- Area: Dynamis - Jeuno
--  Mob: Goblin Statue
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------
function onMobFight(mob, target)
	mob:setDamage(250)
    mob:setMod(tpz.mod.REFRESH, 300)
end

function onMobDeath(mob, player, isKiller)
    dynamis.timeExtensionOnDeath(mob, player, isKiller)
end
