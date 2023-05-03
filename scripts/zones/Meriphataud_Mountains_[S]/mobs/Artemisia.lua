-----------------------------------
-- Area: Meriphataud_Mountains [S]
--  Mob: Artemisia 
-- D-10 Bottom West Corner
-----------------------------------
mixins =
{
    require("scripts/mixins/rage"),
    require("scripts/mixins/job_special")
}
local ID = require("scripts/zones/Meriphataud_Mountains_[S]/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/moblinmazemongers")
-----------------------------------
function onMobSpawn(mob)
    tpz.moblinmazemongers.MobMods(mob)
    mob:setDamage(30)
    mob:setLocalVar("[rage]timer", 7200) -- 2 hrs
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.HUNDRED_FISTS, hpp = 75},
            {id = tpz.jsa.HUNDRED_FISTS, hpp = 50},
            {id = tpz.jsa.HUNDRED_FISTS, hpp = 25},
        },
    })
end

function onMobRoam(mob)
    local Turn = mob:getLocalVar("Turn")
    local Time = os.time()
    if Time > Turn then
        mob:setPos(-488.3861,-7.9355,-357.3130, math.random(0, 255))
        mob:setLocalVar("Turn", Time + 25)
    end
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobFight(mob, target)
    local hp = mob:getHPP()

    if (hp < 20) then
        AddMobAura(mob, target, 10, tpz.effect.GEO_EVASION_DOWN, 50, 3)
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
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
