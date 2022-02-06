-----------------------------------
-- Area: East Ronfaure [S]
--  Mob: Dark Ixion
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/pathfind")
local ID = require("scripts/zones/East_Ronfaure_[S]/IDs")
-----------------------------------
local DarkIxionID =
{
    17109367, -- Ronfaure
    17150321, -- Rolanberry
    17113468, -- Jugner
    17121697,
    17142112,
    17166730,
    17170649
}

local pathNodes =
{
    -308, -22, 4,
    -383, -17, -21,
    -294, -10, 206,
    -316, -16, 202,
    -279, -7, 265,
    -68, 0, 261,
    12, 0, 105,
    50, -1, 19,
    -116, -8, -35,
}

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    printf("Spawned Batallia")
    mob:setMod(tpz.mod.DEF, 522)
    mob:setMod(tpz.mod.EVA, 374) 
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
    mob:setLocalVar("RunAwayWait", 0)
    mob:setLocalVar("TrackingTarget", 0)
    mob:setLocalVar("StartTrampling", 0)
    mob:setLocalVar("TrampleDelay", 0)
    mob:setLocalVar("RNG", math.random(1, 2))
    onPath(mob)
end

function onPath(mob)
    tpz.path.patrol(mob, pathNodes)
end

function onMobRoam(mob)
    -- move to start position if not moving
    if not mob:isFollowingPath() then
        mob:pathThrough(tpz.path.first(pathNodes))
    end
    mob:setLocalVar("Ashed", 0)
    mob:setLocalVar("AuraTimeOn", 0)
    mob:setLocalVar("AuraTimeOff", 0)
    mob:setLocalVar("Stance", 0)
    mob:setLocalVar("TrackingTarget", 0)
    mob:setLocalVar("StartTrampling", 0)
end

function onMobEngaged(mob)
    for i = 1,#DarkIxionID do -- despawn all ixions in all zones
        local id = DarkIxionID[i]
        local DarkIxion = GetMobByID(id)
        if DarkIxion:isSpawned() and mob:getID() ~= id then
        --printf("%i", id)
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
    local TramplingDuration = mob:getLocalVar("TramplingDuration")
    local StartTrampling = mob:getLocalVar("StartTrampling")
    local TrampleDelay = mob:getLocalVar("TrampleDelay")
    local RunAwayWait = mob:getLocalVar("RunAwayWait")
    local xPos = mob:getLocalVar("xPos")
    local yPos = mob:getLocalVar("yPos")
    local zPos = mob:getLocalVar("zPos")
    local RNG = mob:getLocalVar("RNG")
    local BattleTime = mob:getBattleTime()
    local AnimationSub = mob:AnimationSub()

    for i = 1,#DarkIxionID do -- despawn all ixions in all zones
        local id = DarkIxionID[i]
        local DarkIxion = GetMobByID(id)
        if DarkIxion:isSpawned() and mob:getID() ~= id then
        --printf("%i", id)
            DespawnMob(id)
        end
    end

	if mob:hasStatusEffect(tpz.effect.PHYSICAL_SHIELD) == false then
		mob:addStatusEffect(tpz.effect.PHYSICAL_SHIELD, 5, 0, 3600)
	end

    if Ashed == 0 then -- Failed to hit with stygian ash
		mob:SetAutoAttackEnabled(false)
        mob:SetMagicCastingEnabled(false)
        mob:SetMobAbilityEnabled(false)
        mob:addStatusEffect(tpz.effect.FLEE, 25, 0, 60)
        if RNG == 1 then
            mob:pathTo(390, 8, -261) -- Rolanberry
        elseif RNG == 2 then
            mob:pathTo(-401, -15, -152) -- Ronfaure
        end
        mob:setLocalVar("RunAwayWait", 30)
        if BattleTime >= RunAwayWait and RunAwayWait > 0 then
            local ixion = 0
            DespawnMob(mob:getID())
            if RNG == 1 then
                ixion = GetMobByID(17150321) -- Rolanberry 
            elseif RNG == 2  then
                ixion = GetMobByID(17109367) -- Ronfaure
            end
            ixion:spawn()
            mob:setLocalVar("RunAwayWait", 0)
        end
    end

    if mob:checkDistance(target) > 35 and Ashed > 0 then
        mob:clearPath()
    end


	if AuraTimeOn == 0 then
		mob:setLocalVar("AuraTimeOn", BattleTime + 180)
	elseif BattleTime >= AuraTimeOn and Stance == 0 and AnimationSub == 0 then
        --printf("Aura Mode On")
        mob:setDamage(150)
        mob:setMod(tpz.mod.REGAIN, 250)
        mob:AnimationSub(3)
		mob:setLocalVar("AuraTimeOff", BattleTime + 180)
		mob:setLocalVar("Stance", 1)
	end

	if AuraTimeOff > 0 and BattleTime >= AuraTimeOff and Stance == 1 then
        --printf("Aura Mode Off")
        mob:setMod(tpz.mod.REGAIN, 0)
        mob:setDamage(100)
        mob:AnimationSub(0)
		mob:setLocalVar("AuraTimeOn", BattleTime + 180)
		mob:setLocalVar("Stance", 0)
	end

    if TrampleTime == 0 then
		mob:setLocalVar("TrampleTime", BattleTime + 120)
        --printf("Setting trample time")
	elseif BattleTime >= TrampleTime and StartTrampling == 0 then
        printf("Battle time greater than trample time")
        mob:setLocalVar("TrampleTracker", 0)
        printf("Tracking target above 75 HP")
        mob:AnimationSub(1)
        mob:SetAutoAttackEnabled(false)
        mob:SetMagicCastingEnabled(false)
        mob:SetMobAbilityEnabled(false)
        mob:setLocalVar("StartTrampling", 1)
        mob:setLocalVar("TramplingDuration", BattleTime + 5)
        TrampleTracker = TrampleTracker + 1
        mob:setLocalVar("TrampleTracker", TrampleTracker)
    end

    if StartTrampling == 1 then
        if TrackingTarget == 0 then
            local RNG = math.random(1, 6)
            if RNG == 1 then
                mob:pathTo(390, 8, -261) -- Rolanberry
            elseif RNG == 2 then
                mob:pathTo(-401, -15, -152) -- Ronfaure
            elseif RNG == 3 then
                mob:pathTo(-157, -7, 453) -- North
            elseif RNG == 4 then
                mob:pathTo(-164, -24, -160) -- South
            elseif RNG == 5 then
                mob:pathTo(193, 8, 202) -- NorthEast
            elseif RNG == 6 then
                mob:pathTo(-444, -16, 232) -- NorthWest
            end
        end
        printf("Pathing to target")
        mob:setLocalVar("TrackingTarget", 1)
    end
    if BattleTime >= TramplingDuration and TrackingTarget == 1 then
        printf("Trampling finished")
        mob:setLocalVar("TramplingDuration", 0)
        mob:setLocalVar("TrackingTarget", 0)
        mob:setLocalVar("StartTrampling", 0)
        if mob:getHPP() < 25 and TrampleTracker < 3 then
            printf("Trampling below 25 HP")
            if mob:checkDistance(target) > 8 then return end -- Ensure it doesn't path around stupid when trampling
            mob:setLocalVar("TrampleTime", BattleTime + 5)
        elseif mob:getHPP() > 25 and mob:getHPP() <= 75 and TrampleTracker < 2 then
            printf("Trampling above 25 and below 75 HP")
            if mob:checkDistance(target) > 8 then return end -- Ensure it doesn't path around stupid when trampling
		    mob:setLocalVar("TrampleTime", BattleTime + 5)
        else
            mob:AnimationSub(0)
            mob:SetAutoAttackEnabled(true)
            mob:SetMagicCastingEnabled(true)
            mob:SetMobAbilityEnabled(true)
            mob:setLocalVar("TrampleTime", BattleTime + 120)
            mob:setLocalVar("TrampleTracker", 0)
        end
    end
    local nearbyPlayers = mob:getPlayersInRange(12)
    if nearbyPlayers == nil then return end
    if TrackingTarget == 1 and BattleTime >= TrampleDelay then
        for _,v in ipairs(nearbyPlayers) do
            printf("Trampling")
            local mp = math.floor((v:getMaxMP() * math.random(1, 3)) / 10)
            local dmg = 500
            dmg = v:physicalDmgTaken(dmg, tpz.damageType.SLASHING)
            v:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
            v:delMP(mp)
            mob:setLocalVar("TrampleDelay", BattleTime + 3)
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
end

function onMobDespawn(mob)
    mob:setLocalVar("Ashed", 0)
    mob:AnimationSub(0)
end

function onMobDeath(mob, player, isKiller)
    mob:setLocalVar("Ashed", 0)
    for i = 1,#DarkIxionID do -- despawn all ixions in all zones
        local id = DarkIxionID[i]
        local DarkIxion = GetMobByID(id)
        if DarkIxion:isSpawned() and mob:getID() ~= id then
            DespawnMob(id)
        end
    end
    player:addTitle(tpz.title.IXION_HORNBREAKER)
end
