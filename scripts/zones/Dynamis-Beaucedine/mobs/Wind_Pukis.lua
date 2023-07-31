-----------------------------------
-- Area: Dynamis - Beaucedine
--  Mob: Wind Pukis (Angra Mainyuu Dragon)
-----------------------------------
require("scripts/globals/dynamis")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    mob:setDamage(25)
    mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
end

function onMobWeaponSkillPrepare(mob, target)
    return 644 -- Only uses Wind Breath
end

function onMobDeath(mob, player, isKiller, noKiller)
end
