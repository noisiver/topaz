-----------------------------------
-- Area: Arrapago Remnants
--   NM: Armored Chariot
-- ID: 17080585
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
require("scripts/globals/items")
require("scripts/globals/mobs")
require("scripts/globals/titles")
-----------------------------------
local bosses =
-- Medjed Head / Body 17081183 and 17081184
{
17081055, 17081056, 17081057, 17081058, 17081105, 17081106, 17081107, 17081113, 17081148, 17081149, 17081182, 17081183, 17081184, 17081211,
17081233, 17081245
}
function onMobFight(mob, target)
    local instance = mob:getInstance()
    local progress = instance:getProgress()
    local hp = mob:getHPP()

    -- At 95% HP despawn and summons the first boss of the zone
    if (hp <= 95) and (progress == 0) then
        DespawnMob(mob:getID(instance), instance)
        salvageUtil.TrySpawnChariotBoss(mob, target, 17081055)
        instance:setProgress(1)
    end
end

function onMobSpawn(mob)
    mob:setMod(tpz.mod.DEFP, 25)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 1)
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.SUN_CHARIOTEER)
    local instance = mob:getInstance()
    instance:setStage(8)
end

function onMobDespawn(mob)
end
