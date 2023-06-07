-----------------------------------
-- Area: Arrapago Reef
--  Mob: Lamie_No9's Avatar
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/families/avatar")}
-----------------------------------
function onMobSpawn(mob)
    mob:setLocalVar("AstralFlow", 0)
    mob:setMobMod(tpz.mobMod.SHARE_TARGET, 16998742)
end

function onMobFight(mob, target)
    local AstralFlow = mob:getLocalVar("AstralFlow")
    if AstralFlow == 1 then
        mob:useMobAbility(866) -- Tidal Wave
        mob:setLocalVar("AstralFlow", 0)
    end
end

function onMobDeath(mob, player, isKiller)
end