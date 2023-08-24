-----------------------------------
-- Area: The Ashu Talif (Against All Odds)
--  Mob: Yazquhl
-- COR AF3 Fight
-----------------------------------
require("scripts/globals/status")
local ID = require("scripts/zones/The_Ashu_Talif/IDs")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMobMod(tpz.mobMod.AGGRO_SIGHT, 1)
    mob:setMobMod(tpz.mobMod.ALWAYS_AGGRO, 1)
	mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:addListener("WEAPONSKILL_STATE_ENTER", "WS_START_MSG", function(mob, skillID)
        -- Vorpal Blade
        if skillId == 40 then
            mob:showText(mob, ID.text.TAKE_THIS)
        -- Circle Blade
        elseif skillId == 38 then
            mob:showText(mob, ID.text.REST_BENEATH)
        -- Savage Blade
        elseif skillId == 35 then
            mob:showText(mob, ID.text.STOP_US)
        end
    end)
end

function onMobFight(mob, target)
    local instance = mob:getInstance()
	local Gowam = GetMobByID(mob:getID(instance)-1, instance)

	Gowam:updateEnmity(target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        mob:showText(mob, ID.text.YAZQUHL_DEATH)
    end
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    instance:setProgress(instance:getProgress() + 1)
end
