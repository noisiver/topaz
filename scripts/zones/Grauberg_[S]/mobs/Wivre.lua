-----------------------------------
-- Area: Grauberg [S]
--  Mob: Wivre
-- Note: PH for Vasiliceratops
-----------------------------------
local ID = require("scripts/zones/Grauberg_[S]/IDs")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
	mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
 end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.VASILICERATOPS_PH, 20, 7200) -- 2 hours
end
