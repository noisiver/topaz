-----------------------------------
-- Area: Boneyard Gully
--  Mob: Swift Hunter
-----------------------------------
mixins = {require("scripts/mixins/families/antlion_ambush")}
local ID = require("scripts/zones/Boneyard_Gully/IDs")
-----------------------------------

function onMobSpawn(mob)
    -- Aggros via ambush, not superlinking
    mob:setMobMod(tpz.mobMod.SUPERLINK, 0)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobEngaged(mob, target)
    mob:hideName(false)
    mob:untargetable(false)
    mob:AnimationSub(1)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
    for _, char in pairs(mob:getBattlefield():getPlayers()) do
        char:messageSpecial(ID.text.SMALL_ANTLION)
    end
end

function onMobDeath(mob, player, isKiller)
end
