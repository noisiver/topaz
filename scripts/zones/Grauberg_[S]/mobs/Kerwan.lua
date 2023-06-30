-----------------------------------
-- Area: Grauberg [S]
--  Mob: Kerwan
-- F-12 in Cave entrance @ G-12
-----------------------------------
mixins =
{
    require("scripts/mixins/rage"),
    require("scripts/mixins/job_special")
}
local ID = require("scripts/zones/Grauberg_[S]/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/moblinmazemongers")
-----------------------------------
function onMobSpawn(mob)
    tpz.moblinmazemongers.MobMods(mob) 
    mob:setLocalVar("[rage]timer", 7200) -- 2 hrs
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.MEIKYO_SHISUI, hpp = 75},
            {id = tpz.jsa.MEIKYO_SHISUI, hpp = 50},
            {id = tpz.jsa.MEIKYO_SHISUI, hpp = 25},
        },
    })
end

function onMobRoam(mob)
    mob:setPos(-120.2638,9.7138,-497.8309,5)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobFight(mob, target)
    local auraMode = mob:getLocalVar("auraMode")
    if (auraMode == 1) then
        AddMobAura(mob, target, 10, tpz.effect.GEO_PARALYSIS, 25, 3)
    elseif (auraMode == 2) then
        AddMobAura(mob, target, 10, tpz.effect.AMNESIA, 1, 3)
    elseif (auraMode == 3) then
        AddMobAura(mob, target, 10, tpz.effect.MUTE, 1, 3)
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 685 then -- Sprout Spin
        mob:setLocalVar("auraMode", 1)
    elseif skill:getID() == 686 then -- Slumber Powder
        mob:setLocalVar("auraMode", 2)
    elseif skill:getID() == 687 then -- Sprout Smack
        mob:setLocalVar("auraMode", 3)
    end
end

function onMobDeath(mob, player, isKiller)
    player:addCurrency("allied_notes", 500)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(3510, mob)-- Silver Mirror 
	end
    tpz.moblinmazemongers.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
