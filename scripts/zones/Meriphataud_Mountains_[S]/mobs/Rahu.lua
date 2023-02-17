-----------------------------------
-- Area: Meriphataud_Mountains [S]
--  Mob: Rahu
-- K-11 Bottom East Corner
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
	mob:setDamage(140)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.ACC, 200)
    mob:setMod(tpz.mod.DEF, 1250)
    mob:setMod(tpz.mod.EVA, 374) 
	mob:setMod(tpz.mod.VIT, 68)
    mob:setMod(tpz.mod.UDMGBREATH, -66)
    mob:setMod(tpz.mod.REGEN, 50)
    mob:setMod(tpz.mod.REGAIN, 150)
    mob:setMod(tpz.mod.MOVE, 20)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 35)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 30)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 30)
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
        mob:setPos(652.9648,-0.7,-422.5846, math.random(0, 255))
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
        AddMobAura(mob, target, 10, tpz.effect.GEO_SLOW, 5000, 3)
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
