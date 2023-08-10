-----------------------------------
-- Area: Bhaflau Thickets
--  Mob: Chigoe
-----------------------------------
mixins = {require("scripts/mixins/families/chigoe")}
local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.DISEASE)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
