-----------------------------------
-- Area: Beaucedine Glacier
--  Mob: Seua Peek
-- I-7 Inside Tower
-----------------------------------
mixins =
{
    require("scripts/mixins/rage"),
    require("scripts/mixins/job_special")
}
local ID = require("scripts/zones/Beaucedine_Glacier_[S]/IDs")
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
    mob:setMobMod(tpz.mobMod.GA_CHANCE, 60)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 30)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 30)
    mob:setLocalVar("[rage]timer", 7200) -- 2 hrs
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.BLOOD_WEAPON, hpp = 75},
            {id = tpz.jsa.BLOOD_WEAPON, hpp = 50},
            {id = tpz.jsa.BLOOD_WEAPON, hpp = 25},
        },
    })
end

function onMobRoam(mob)
    mob:setPos(100.2163,-9.0500,176.3493,65)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobFight(mob, target)
    local crossThrashEnabled = mob:getLocalVar("crossThrashEnabled")
    local hp = mob:getHPP()

    if (crossThrashEnabled > 0) then
        mob:setLocalVar("crossThrashEnabled", 0)
        UseMultipleTPMoves(mob, math.random(3,5), 1681)
    end

    if (hp < 20) then
        AddMobAura(mob, target, 10, tpz.effect.GEO_DEFENSE_DOWN, 50, 3)
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
    -- Uses Cross Thrash 3-5 times after every TP move except Blood Weapon and Cross Thrash
    if skill:getID() ~= 695 and skill:getID() ~= 1681 then 
         mob:setLocalVar("crossThrashEnabled", 1)
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
