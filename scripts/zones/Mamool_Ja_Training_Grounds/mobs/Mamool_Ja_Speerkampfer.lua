-----------------------------------
-- Area: Mamool Ja Trianing Grounds (Imperial Agent Rescue)
--  Mob: Mamool Ja Speerkampfer
-- Job: DRG
-----------------------------------
require("scripts/globals/status")
local ID = require("scripts/zones/Mamool_Ja_Training_Grounds/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.MDEF, 70)
    mob:setMod(tpz.mod.UDMGMAGIC, -25)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 2) 
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:addImmunity(tpz.immunity.SLEEP)
	mob:setLocalVar("TwoHourUsed", 0)
    --mob:AnimationSub(0)
end

function onMobRoam(mob)
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end
    --if mob:getID(instance) == 17035602 then
        --mob:setPos(337.1452,-29.2634,336.1338,55)
    --end
end

function onMobEngaged(mob)
end

function onMobFight(mob, target)
    local instance = mob:getInstance()
	local Pet = GetMobByID(mob:getID(instance)+1, instance)
	local TwoHourUsed = mob:getLocalVar("TwoHourUsed")
	if mob:getHPP() <= 50 and TwoHourUsed == 0 then
        mob:setMod(tpz.mod.REGAIN, 500)
        mob:useMobAbility(732) -- Call Wyvern
        Pet:spawn()
        mob:setLocalVar("TwoHourUsed", 1)
	end
    if Pet:isSpawned() then
	    Pet:updateEnmity(target)
    end
	if mob:hasStatusEffect(tpz.effect.PHYSICAL_SHIELD) == false then
		mob:addStatusEffect(tpz.effect.PHYSICAL_SHIELD, 6, 0, 3600)
	end
end

function onMobWeaponSkillPrepare(mob, target)
    return 1734 -- Only uses Warm-Up
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    DespawnMob(17047947, instance)
    instance:setProgress(instance:getProgress() + 1)
end