-----------------------------------
-- Area: Mamool Ja Trianing Grounds (Imperial Agent Rescue)
--  Mob: Mamool Ja Speerkampfer
-- Job: DRG
-----------------------------------
require("scripts/globals/status")
local ID = require("scripts/zones/Mamool_Ja_Training_Grounds/IDs")
mixins = {require("scripts/mixins/weapon_break")}
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.MDEF, 70)
    mob:setMod(tpz.mod.UDMGMAGIC, -25)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 2) 
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:addImmunity(tpz.immunity.SLEEP)
    mob:setLocalVar("CallWyvernUsed", 0)
    mob:setLocalVar("SpiritSurgeUsed", 0)
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
	local CallWyvernUsed = mob:getLocalVar("CallWyvernUsed")
	local SpiritSurgeUsed = mob:getLocalVar("SpiritSurgeUsed")
	if mob:getHPP() <= 50 and CallWyvernUsed == 0 then
        mob:useMobAbility(732) -- Call Wyvern
        Pet:spawn()
        mob:setLocalVar("CallWyvernUsed", 1)
	end
    if mob:getHPP() <= 25 and SpiritSurgeUsed == 0 and mob:actionQueueEmpty() then
        local zonePlayers = mob:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            zonePlayer:PrintToPlayer("The Speerkampfer sacrifices his wyvern to gain it's strength!",0,"Speerkampfer")
        end
        DespawnMob(mob:getID(instance) +1, instance)
        mob:useMobAbility(1893) -- Spirit Surge
        mob:setMod(tpz.mod.REGAIN, 500)
        mob:setMod(tpz.mod.HTHRES, 500)
        mob:setMod(tpz.mod.SLASHRES, 500)
        mob:setMod(tpz.mod.PIERCERES, 500)
        mob:setMod(tpz.mod.RANGEDRES, 500)
        mob:setMod(tpz.mod.IMPACTRES, 500)
        mob:setMod(tpz.mod.UDMGMAGIC, -50)
        mob:setMod(tpz.mod.UDMGBREATH, -50)
        mob:setLocalVar("SpiritSurgeUsed", 1)
    end 
    if Pet:isSpawned() then
	    Pet:updateEnmity(target)
    end
	if mob:hasStatusEffect(tpz.effect.PHYSICAL_SHIELD) == false then
		mob:addStatusEffect(tpz.effect.PHYSICAL_SHIELD, 6, 0, 3600)
        mob:getStatusEffect(tpz.effect.PHYSICAL_SHIELD):unsetFlag(tpz.effectFlag.DISPELABLE)
	end
end

function onMobWeaponSkillPrepare(mob, target)
    return 1734 -- Only uses Warm-Up
end

function onMobWeaponSkill(target, mob, skill)
    -- Uses Jump after every WS
    if skill:getID() > 0 and skill:getID() ~= 1064 then 
         mob:useMobAbility(1064) 
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    local instance = mob:getInstance()
    DespawnMob(17047947, instance)
    instance:setProgress(instance:getProgress() + 1)
end