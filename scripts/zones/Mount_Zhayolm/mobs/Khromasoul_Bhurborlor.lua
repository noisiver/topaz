-----------------------------------
-- Area: Mount Zhayolm
--  ZNM: Khromasoul Bhurborlor
-----------------------------------
mixins =
{
    require("scripts/mixins/rage"),
    require("scripts/mixins/job_special"),
    require("scripts/mixins/weapon_break")
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
        mob:SetAutoAttackEnabled(true)
        mob:SetMagicCastingEnabled(true)
        mob:SetMobAbilityEnabled(true)
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        pet:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
        pet:spawn()
        pet:updateEnmity(mob:getTarget())
    end)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setDamage(130)
    mob:setMod(tpz.mod.ATT, 350)
    mob:setMod(tpz.mod.DEF, 700)
    mob:setMod(tpz.mod.EVA, 300)
    mob:setMod(tpz.mod.MDEF, 0)
    mob:setMod(tpz.mod.UDMGMAGIC, 0)
    mob:setMod(tpz.mod.UDMGBREATH, 0) 
    mob:setMod(tpz.mod.SDT_FIRE, 40)
    mob:setMod(tpz.mod.SDT_ICE, 70)
    mob:setMod(tpz.mod.SDT_WIND, 85)
    mob:setMod(tpz.mod.SDT_EARTH, 70)
    mob:setMod(tpz.mod.SDT_THUNDER, 70)
    mob:setMod(tpz.mod.SDT_WATER, 100)
    mob:setMod(tpz.mod.SDT_LIGHT, 85)
    mob:setMod(tpz.mod.SDT_DARK, 85)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 8000) -- 9k Gil
    mob:setMobMod(tpz.mobMod.GIL_MAX, 9000) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0) 
    mob:AnimationSub(0)
    mob:SetAutoAttackEnabled(true)
    mob:SetMagicCastingEnabled(true)
    mob:SetMobAbilityEnabled(true)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
    -- Spawns 3 RDM Trolls when popped
    for v = 17027475, 17027477, 1 do
        local pet = GetMobByID(v)
        spawnPetInBattle(mob, pet)
    end
end

function onMobFight(mob, target)
	local AddsPhase = mob:getLocalVar("AddsPhase")
    local SyngerismUses = mob:getLocalVar("SyngerismUses")
	local PathToPudding = mob:getLocalVar("PathToPudding")
	local Pudding = mob:getLocalVar("Pudding")
	local LastPudding = mob:getLocalVar("LastPudding")
	local Retaliated = mob:getLocalVar("Retaliated")
	local BattleTime = mob:getBattleTime()
    -- Cheer animation then summons Adds
    if mob:getHPP() < 80 and AddsPhase == 0 then
        -- Despawn old adds
        for v = 17027475, 17027477, 1 do
           DespawnMob(v)
        end
        -- Spawn new set of adds
        for v = 17027478, 17027480, 1 do
            local pet = GetMobByID(v)
            spawnPetInBattle(mob, pet)
        end
        mob:setLocalVar("AddsPhase", 1)
    end
    if mob:getHPP() < 60 and AddsPhase == 1 then
        -- Despawn old adds
        for v = 17027475, 17027480, 1 do
           DespawnMob(v)
        end
        -- Spawn new set of adds
        for v = 17027481, 17027482, 1 do
            local pet = GetMobByID(v)
            spawnPetInBattle(mob, pet)
        end
        mob:setLocalVar("AddsPhase", 2)
    end
    if mob:getHPP() < 40 and AddsPhase == 2 then
        -- Despawn old adds
        for v = 17027475, 17027482, 1 do
           DespawnMob(v)
        end
        -- Spawn new set of adds
        for v = 17027483, 17027484, 1 do
            local pet = GetMobByID(v)
            spawnPetInBattle(mob, pet)
        end
        mob:setLocalVar("AddsPhase", 3)
    end
    -- Despawn ALL adds at 20%
    if mob:getHPP() < 20 and AddsPhase == 3 then
        for v = 17027475, 17027484, 1 do
           DespawnMob(v)
        end
        mob:setLocalVar("AddsPhase", 4)
    end
end

function onMobWeaponSkillPrepare(mob, target)
    -- Only uses overthrow below 20%
    if mob:getHPP() < 20 then
        return 1895
    end
end

function onMobWeaponSkill(target, mob, skill)
end

function onAdditionalEffect(mob, target, damage)
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
