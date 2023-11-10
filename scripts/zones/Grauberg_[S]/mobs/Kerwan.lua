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
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 685 then -- Sprout Spin
        AddMobAura(mob, target, 10, tpz.effect.GEO_PARALYSIS, 25, 45, 0, 1)
    elseif skill:getID() == 686 then -- Slumber Powder
        AddMobAura(mob, target, 10, tpz.effect.AMNESIA, 1, 45, 0, 2)
    elseif skill:getID() == 687 then -- Sprout Smack
        AddMobAura(mob, target, 10, tpz.effect.MUTE, 1, 45, 0, 3)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addCurrency("allied_notes", 500)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(3510, mob)-- Silver Mirror 
	end
    tpz.moblinmazemongers.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
