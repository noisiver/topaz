-----------------------------------
-- Area: East Ronfaure [S]
--  Mob: Dark Ixion
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/mobs")
local ID = require("scripts/zones/East_Ronfaure_[S]/IDs")
-----------------------------------
local DarkIxionID =
{
    --17109367, -- Ronfaure
    17150321,
    17113468, -- Jugner
    17121697,
    17142112,
    17166730,
    17170649
}
function onMobInitialize(mob)
end

function onMobSpawn(mob)
    mob:setMod(tpz.mod.DEF, 522)
    mob:setMod(tpz.mod.EVA, 395) 
    mob:addMod(tpz.mod.MDEF, 40)
    mob:setMod(tpz.mod.REGAIN, 0)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:SetMobSkillAttack(6096) -- JA Autoattacks
    mob:SetAutoAttackEnabled(true)
    mob:SetMagicCastingEnabled(true)
    mob:SetMobAbilityEnabled(true)
    mob:AnimationSub(0)
    mob:setLocalVar("Ashed", 0)
    mob:setLocalVar("AuraTimeOn", 0)
    mob:setLocalVar("AuraTimeOff", 0)
    mob:setLocalVar("Stance", 0)
end

function onMobRoam(mob)
    mob:setLocalVar("Ashed", 0)
    mob:setLocalVar("AuraTimeOn", 0)
    mob:setLocalVar("AuraTimeOff", 0)
    mob:setLocalVar("Stance", 0)
end

function onMobEngaged(mob)
    for i = 1,#DarkIxionID do -- despawn all ixions in all zones
        local id = DarkIxionID[i];
        local DarkIxion = GetMobByID(id)
        if DarkIxion:isSpawned() and mob ~= id then
            DespawnMob(id)
        end
    end
end

function onMobFight(mob, target)
	local Ashed = mob:getLocalVar("Ashed")
    local AuraTimeOn = mob:getLocalVar("AuraTimeOn")
    local AuraTimeOff = mob:getLocalVar("AuraTimeOff")
    local Stance = mob:getLocalVar("Stance")
    local TrampleTime = mob:getLocalVar("TrampleTime")
    local TrampleTracker = mob:getLocalVar("TrampleTracker")
    local TrackingTarget = mob:getLocalVar("TrackingTarget")
    local BattleTime = mob:getBattleTime()
    local AnimationSub = mob:AnimationSub()

	if mob:hasStatusEffect(tpz.effect.PHYSICAL_SHIELD) == false then
		mob:addStatusEffect(tpz.effect.PHYSICAL_SHIELD, 5, 0, 3600)
	end
    if Ashed == 0 then -- Failed to hit with stygian ash
		mob:SetAutoAttackEnabled(false)
        mob:SetMagicCastingEnabled(false)
        mob:SetMobAbilityEnabled(false)
        mob:addStatusEffect(tpz.effect.FLEE, 50, 0, 60)
        mob:disengage()
        mob:pathTo(478, -6, -423, 0)
        mob:timer(10000, function(mob) -- after 10 seconds of running, despawn, then respawn in next zone
            DespawnMob(mob:getID())
            local ixion = GetMobByID(17113468)
            ixion:spawn()
        end)
    end

	if AuraTimeOn == 0 then
		mob:setLocalVar("AuraTimeOn", BattleTime + 180)
	elseif BattleTime >= AuraTimeOn and Stance == 0 and AnimationSub == 0 then
        printf("Aura Mode On");
        mob:setDamage(150)
        mob:setMod(tpz.mod.REGAIN, 250)
        mob:AnimationSub(3)
		mob:setLocalVar("AuraTimeOff", BattleTime + 60)
		mob:setLocalVar("Stance", 1)
	end

	if AuraTimeOff > 0 and BattleTime >= AuraTimeOff and Stance == 1 then
        printf("Aura Mode Off");
        mob:setMod(tpz.mod.REGAIN, 0)
        mob:setDamage(100)
        mob:AnimationSub(0)
		mob:setLocalVar("AuraTimeOn", BattleTime + 180)
		mob:setLocalVar("Stance", 0)
	end

    if TrampleTime == 0 then
		--mob:setLocalVar("TrampleTime", BattleTime + 120)
		mob:setLocalVar("TrampleTime", BattleTime + 30)
        printf("Setting trample time");
	elseif BattleTime >= TrampleTime and Stance == 0 and AnimationSub == 0 then
        printf("Battle time greater than trample time");
        mob:resetEnmity(target)
        if mob:getHPP() > 75 and TrackingTarget == 0 then
            printf("Tracking target above 75 HP");
            mob:AnimationSub(1)
            mob:pathTo(target:getXPos(), target:getYPos(), target:getZPos())
            mob:setLocalVar("TrackingTarget", 1)
            if mob:checkDistance(target) <= 5 then
                printf("Trampling above 75 HP");
                mob:useMobAbility(2333) -- Trample
                mob:AnimationSub(0)
		        --mob:setLocalVar("TrampleTime", BattleTime + 120)
		        mob:setLocalVar("TrampleTime", BattleTime + 30)
                mob:setLocalVar("TrackingTarget", 0)
            end
        elseif mob:getHPP() > 25 and mob:getHPP() <= 75 and TrackingTarget == 0 then
            printf("Tracking target above 75 HP");
            mob:AnimationSub(1)
            mob:pathTo(target:getXPos(), target:getYPos(), target:getZPos())
            mob:setLocalVar("TrackingTarget", 1)
            if mob:checkDistance(target) <= 5 then
                printf("Trampling above 75 HP");
                mob:useMobAbility(2333) -- Trample
                mob:AnimationSub(0)
		        --mob:setLocalVar("TrampleTime", BattleTime + 120)
		        mob:setLocalVar("TrampleTime", BattleTime + 5)
                mob:setLocalVar("TrackingTarget", 0)
            end
        end
    end
end

function onMobWeaponSkill(target, mob, skill)
    if mob:AnimationSub() == 3 then
       for v = 2334,2338,1 do -- TP move ID
            if skill:getID() == 2337 then -- Doesn't use Damsel Memento twice
                return
            end
            if skill:getID() == v then -- If TP Move is part of for loop then...
                local TPMove = mob:getLocalVar("TPMove")

                TPMove = TPMove +1 -- Count number of times TP move was used
                mob:setLocalVar("TPMove", TPMove)

                if TPMove > 1 then -- Only use up to twice in a row
                    mob:setLocalVar("TPMove", 0)
                else
                    mob:useMobAbility(v) -- Re-use same TP move
                end
            end
        end
    end
    --[[
    local isEffectedMove = false;
    for v = 2334,2338 do -- TP move ID
        if skill:getID() == v then
            isEffectedMove = true;
        end
    end
    
    if isEffectedMove then
        local isRepeat = mob:getLocalVar("IsRepeat")
        
        if isRepeat then
            mob:setLocalVar("IsRepeat", false);
        else
            mob:useMobAbility(v) -- Re-use same TP move
            mob:setLocalVar("IsRepeat", true);
        end
    end
    ]]
end

function onMobDisengage(mob)
    mob:setLocalVar("Ashed", 0)
    local ixion = GetMobByID(DarkIxionID[math.random(#DarkIxionID)])
    ixion:spawn()
    mob:AnimationSub(0)
end

function onMobDeath(mob, player, isKiller)
    mob:setLocalVar("Ashed", 0)
    for i = 1,#DarkIxionID do -- despawn all ixions in all zones
        local id = DarkIxionID[i];
        local DarkIxion = GetMobByID(id)
        if DarkIxion:isSpawned() and mob ~= id then
            DespawnMob(id)
        end
    end
    player:addTitle(tpz.title.IXION_HORNBREAKER)
end
