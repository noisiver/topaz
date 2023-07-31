-----------------------------------
-- Area: Aydeewa Subterrane
--  ZNM: Nosferatu
-----------------------------------
mixins =
{
    require("scripts/mixins/rage")
}
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
-----------------------------------
function spawnPetInBattle(mob, pet)
    mob:entityAnimationPacket("casm")
    mob:SetAutoAttackEnabled(false)
    mob:SetMagicCastingEnabled(false)
    mob:SetMobAbilityEnabled(false)
    mob:timer(3000, function(mob)
        mob:entityAnimationPacket("shsm")
        pet:spawn()
        pet:updateEnmity(mob:getTarget())
    end)
end

function syncAbilityUseWithPet(mob, skillid)
    mob:timer(3000, function(mob)
        mob:SetMobAbilityEnabled(true)
        mob:useMobAbility(skillid)
    end)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setDamage(40)
    mob:setMod(tpz.mod.ATT, 522)
    mob:setMod(tpz.mod.DEF, 522)
    mob:setMod(tpz.mod.EVA, 360)
    mob:setMod(tpz.mod.MDEF, 20)
    mob:setMod(tpz.mod.UDMGMAGIC, -38)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 8000) -- 9k Gil
    mob:setMobMod(tpz.mobMod.GIL_MAX, 9000) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0)
    mob:setMod(tpz.mod.PARALYZERESTRAIT, 0)
    mob:AnimationSub(0)
    mob:SetAutoAttackEnabled(true)
    mob:SetMagicCastingEnabled(true)
    mob:SetMobAbilityEnabled(true)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setLocalVar("AstralFlowHPP", math.random(25, 50))
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
    SetServerVariable("NosferatuAF", 0)
end

function onMobEngaged(mob, target)
    mob:setLocalVar("SummonTime", 90)
end

function onMobFight(mob, target)
	local SummonTime = mob:getLocalVar("SummonTime")
    local AstralFlowHPP = mob:getLocalVar("AstralFlowHPP")
	local AstralFlowUsed = mob:getLocalVar("AstralFlowUsed")
	local Pudding = mob:getLocalVar("Pudding")
	local LastPudding = mob:getLocalVar("LastPudding")
	local Retaliated = mob:getLocalVar("Retaliated")
	local BattleTime = mob:getBattleTime()
    -- Spawns three random adds of the same type every few minutes that use their TP move then immediarely despawn
    -- He also uses a TP move with them
	if SummonTime == 0 then
		mob:setLocalVar("SummonTime", BattleTime + 90)
	elseif BattleTime >= SummonTime and mob:actionQueueEmpty() then
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        local RNG = math.random()
        if GetServerVariable("NosferatuAF") == 1 then -- Ensure summoned mobs use proper TP moves
            SetServerVariable("NosferatuAF", 2)
        end
        if RNG <= 0.3 then
            for v = 17056158, 17056160, 1 do -- Bats
            local pet = GetMobByID(v)
                if not pet:isSpawned() then
                    pet:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
                    spawnPetInBattle(mob, pet)
                end
            end
            mob:setLocalVar("SummonTime", BattleTime + 90)
            syncAbilityUseWithPet(mob, 2108) -- Nosferatus Kiss
        elseif RNG <= 0.6 then -- Wolves
            for v = 17056161, 17056163, 1 do
            local pet = GetMobByID(v)
                if not pet:isSpawned() then
                    pet:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
                    spawnPetInBattle(mob, pet)
                end
            end
            mob:setLocalVar("SummonTime", BattleTime + 90)
            syncAbilityUseWithPet(mob, 2106) -- Bloodrake
        else
            for v = 17056164, 17056166, 1 do -- Fomors
            local pet = GetMobByID(v)
                if not pet:isSpawned() then
                    pet:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
                    spawnPetInBattle(mob, pet)
                end
            end
            mob:setLocalVar("SummonTime", BattleTime + 90)
            syncAbilityUseWithPet(mob, 2107) -- Decollation
        end
        mob:SetAutoAttackEnabled(true)
        mob:SetMagicCastingEnabled(true)
    end
    -- Astral flows and summonns 3-6 of his pets
    if mob:getHPP() < AstralFlowHPP and AstralFlowUsed == 0 then
        mob:useMobAbility(734) -- Astral Flow
        mob:setLocalVar("AstralFlowUsed", 1)
        SetServerVariable("NosferatuAF", 1)
        mob:setLocalVar("SummonTime", BattleTime + 90) -- Make sure he won't summon adds again too quicly after AFing
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
    -- Summons one of each add when he uses Astral Flow
    if skill:getID() == 734 then 
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        GetMobByID(17056158):setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        GetMobByID(17056158):updateEnmity(mob:getTarget())
        GetMobByID(17056161):setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        GetMobByID(17056161):spawn()
        GetMobByID(17056161):updateEnmity(mob:getTarget())
        GetMobByID(17056164):setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        GetMobByID(17056164):spawn()
        GetMobByID(17056164):updateEnmity(mob:getTarget())
        syncAbilityUseWithPet(mob, 2110) -- Wings of Gehenna
    end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.HP_DRAIN, {chance = 20, power = 80})
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addCurrency("zeni_point", 300)
	if isKiller  then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
	if isKiller and math.random(1,100) <= 15 then 
		player:addTreasure(5735, mob)--Cotton Coin Purse
	end
end
