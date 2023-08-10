-----------------------------------
-- Area: Dynamis - Beaucedine
--  Mob: Petro Pukis (Angra Mainyuu Dragon)
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
    return 648 -- Only uses Petro Eyes
end

function onMobDeath(mob, player, isKiller, noKiller)
end
