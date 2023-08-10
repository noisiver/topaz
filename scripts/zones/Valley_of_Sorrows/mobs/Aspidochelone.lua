-----------------------------------
-- Area: Valley of Sorrows
--  HNM: Aspidochelone
-----------------------------------
local ID = require("scripts/zones/Valley_of_Sorrows/IDs")
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------
    local removables =
    {
        tpz.effect.FLASH, tpz.effect.BLINDNESS, tpz.effect.ELEGY, tpz.effect.REQUIEM, tpz.effect.PARALYSIS, tpz.effect.POISON,
        tpz.effect.CURSE_I, tpz.effect.CURSE_II, tpz.effect.DISEASE, tpz.effect.PLAGUE, tpz.effect.WEIGHT, tpz.effect.BIND,
        tpz.effect.BIO, tpz.effect.DIA, tpz.effect.BURN, tpz.effect.FROST, tpz.effect.CHOKE, tpz.effect.RASP, tpz.effect.SHOCK, tpz.effect.DROWN,
        tpz.effect.STR_DOWN, tpz.effect.DEX_DOWN, tpz.effect.VIT_DOWN, tpz.effect.AGI_DOWN, tpz.effect.INT_DOWN, tpz.effect.MND_DOWN,
        tpz.effect.CHR_DOWN, tpz.effect.ADDLE, tpz.effect.SLOW, tpz.effect.HELIX, tpz.effect.ACCURACY_DOWN, tpz.effect.ATTACK_DOWN,
        tpz.effect.EVASION_DOWN, tpz.effect.DEFENSE_DOWN, tpz.effect.MAGIC_ACC_DOWN, tpz.effect.MAGIC_ATK_DOWN, tpz.effect.MAGIC_EVASION_DOWN,
        tpz.effect.MAGIC_DEF_DOWN, tpz.effect.CRIT_HIT_EVASION_DOWN, tpz.effect.MAX_TP_DOWN, tpz.effect.MAX_MP_DOWN, tpz.effect.MAX_HP_DOWN,
        tpz.effect.SLUGGISH_DAZE_1, tpz.effect.SLUGGISH_DAZE_2, tpz.effect.SLUGGISH_DAZE_3, tpz.effect.SLUGGISH_DAZE_4, tpz.effect.SLUGGISH_DAZE_5,
        tpz.effect.LETHARGIC_DAZE_1, tpz.effect.LETHARGIC_DAZE_2, tpz.effect.LETHARGIC_DAZE_3, tpz.effect.LETHARGIC_DAZE_4, tpz.effect.LETHARGIC_DAZE_5,
        tpz.effect.WEAKENED_DAZE_1, tpz.effect.WEAKENED_DAZE_2, tpz.effect.WEAKENED_DAZE_3, tpz.effect.WEAKENED_DAZE_4, tpz.effect.WEAKENED_DAZE_5,
        tpz.effect.HELIX, tpz.effect.KAUSTRA
    }

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 33)
    mob:addMod(tpz.mod.DEFP, 100)
	mob:setDamage(130)
    mob:addMod(tpz.mod.EVA, 35)
    mob:setMod(tpz.mod.REGEN, 0)
    mob:setMod(tpz.mod.UDMGPHYS, 0)
    mob:setMod(tpz.mod.UDMGRANGE, 0)
    mob:AnimationSub(0)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
    mob:SetAutoAttackEnabled(true)
    mob:SetMobAbilityEnabled(true)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 20000) 
    mob:setMobMod(tpz.mobMod.GIL_BONUS, 0)
    if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        GetNPCByID(ID.npc.ADAMANTOISE_QM):setStatus(tpz.status.DISAPPEAR)
    end
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobRoam(mob)
    mob:AnimationSub(0)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
    mob:SetAutoAttackEnabled(true)
    mob:SetMobAbilityEnabled(true)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1) -- Says only add as spawn mod?
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")
    local Dmg = mob:getLocalVar("Dmg")
    local Shell = mob:getLocalVar("Shell")

    if mob:getHPP() <= 75 and hitTrigger == 0 and Shell == 0 then
        mob:setLocalVar("TriggerHit", 1)
        mob:setLocalVar("Shell", 1)
    end
    if mob:getHPP() <= 50 and hitTrigger == 1 and Shell == 0  then
        mob:setLocalVar("TriggerHit", 2)
        mob:setLocalVar("Shell", 1)
    end
    if mob:getHPP() <= 25 and hitTrigger == 2 and Shell == 0  then
        mob:setLocalVar("TriggerHit", 3)
        mob:setLocalVar("Shell", 1)
    end

    if Shell == 1  then
        printf("Inside Shell");
        -- Remove all enfeebles
        for i, effect in ipairs(removables) do
            if (mob:hasStatusEffect(effect)) then
                mob:delStatusEffectSilent(effect)
            end
        end
        mob:setMod(tpz.mod.REGEN, 300)
        mob:setMod(tpz.mod.UDMGPHYS, -95)
        mob:setMod(tpz.mod.UDMGRANGE, -95)
        mob:AnimationSub(1)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
        mob:SetAutoAttackEnabled(false)
        mob:SetMobAbilityEnabled(false)
        mob:setLocalVar("Shell", 2)
        mob:addListener("TAKE_DAMAGE", "URAGNITE_TAKE_DAMAGE", function(mob, amount, attacker, attackType, damageType)
        if amount >= 1500  then
            mob:removeListener("URAGNITE_TAKE_DAMAGE")
        printf("Outside Shell");
        mob:setMod(tpz.mod.REGEN, 0)
        mob:setMod(tpz.mod.UDMGPHYS, 0)
        mob:setMod(tpz.mod.UDMGRANGE, 0)
        mob:AnimationSub(0)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
        mob:SetAutoAttackEnabled(true)
        mob:SetMobAbilityEnabled(true)
        mob:setLocalVar("Shell", 0)
        end
    end)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.ASPIDOCHELONE_SINKER)
end

function onMobDespawn(mob)
    -- Set Aspidochelone's Window Open Time
    if LandKingSystem_HQ ~= 1 then
        local wait = 72 * 3600
        SetServerVariable("[POP]Aspidochelone", os.time() + wait) -- 3 days
        if LandKingSystem_HQ == 0 then -- Is time spawn only
            DisallowRespawn(mob:getID(), true)
        end
    end

    -- Set Adamantoise's spawnpoint and respawn time (21-24 hours)
    if LandKingSystem_NQ ~= 1 then
        SetServerVariable("[PH]Aspidochelone", 0)
        DisallowRespawn(ID.mob.ADAMANTOISE, false)
        UpdateNMSpawnPoint(ID.mob.ADAMANTOISE)
        GetMobByID(ID.mob.ADAMANTOISE):setRespawnTime(36000 + math.random(0, 6) * 1800) -- 21 - 24 hours with half hour windows
    end
end
