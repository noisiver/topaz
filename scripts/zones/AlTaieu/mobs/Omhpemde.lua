-----------------------------------
-- Area: Al'Taieu
--  Mob: Om'hpemde
-----------------------------------
require("scripts/globals/status")
mixins = {require("scripts/mixins/families/hpemde")}
-----------------------------------
function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ROAM_DISTANCE, 3)
    mob:setMobMod(tpz.mobMod.ROAM_COOL, 30)
end

function onMobSpawn(mob)
    mob:SetAutoAttackEnabled(false)
    mob:SetMobAbilityEnabled(false)
    mob:AnimationSub(6)
end

function onMobDeath(mob, player, isKiller, noKiller)
end
