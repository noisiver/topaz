-----------------------------------
-- Area: North Gustaberg [S]
--  Mob: Kendi
-- D-9 by Zeika Creek near Lizards
-----------------------------------
mixins =
{
    require("scripts/mixins/rage"),
    require("scripts/mixins/job_special")
}
local ID = require("scripts/zones/North_Gustaberg_[S]/IDs")
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
            {id = tpz.jsa.MANAFONT, hpp = 75},
            {id = tpz.jsa.MANAFONT, hpp = 50},
            {id = tpz.jsa.MANAFONT, hpp = 25},
        },
    })
end

function onMobRoam(mob)
    mob:setPos(-626.8600,41.4641,271.0131,240)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobFight(mob, target)
    local hp = mob:getHPP()

    if (hp < 20) then
        AddMobAura(mob, target, 10, tpz.effect.GEO_MAGIC_DEF_DOWN, 25, 3)
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 1795 then -- Malediction
         mob:useMobAbility(478) -- Hell Slash
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
