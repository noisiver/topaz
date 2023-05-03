-----------------------------------
-- Area: Pashhow Marshlands [S]
--  Mob: Tatzelwurm
-- E-10 at Rotmarsh
-----------------------------------
mixins =
{
    require("scripts/mixins/rage"),
    require("scripts/mixins/job_special")
}
local ID = require("scripts/zones/Pashhow_Marshlands_[S]/IDs")
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
    mob:setPos(-430.9072,24.5248,-226.5151, 55)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobFight(mob, target)
    local hp = mob:getHPP()

    if (hp < 20) then
        AddMobAura(mob, target, 10, tpz.effect.DEBILITATION, 0x1FF, 3)
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 1795 then -- Malediction
         mob:useMobAbility(478) -- Hell Slash
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
