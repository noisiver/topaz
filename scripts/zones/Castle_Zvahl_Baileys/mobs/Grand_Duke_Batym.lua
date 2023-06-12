-----------------------------------
-- Area: Castle Zvahl Baileys (161)
--   NM: Grand Duke Batym
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
require("scripts/globals/mobs")
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

function onMobSpawn(mob)
    mob:setDamage(50)
    mob:setMod(tpz.mod.REFRESH, 300)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 6000)
    mob:addImmunity(tpz.immunity.SLEEP)
    mob:addImmunity(tpz.immunity.GRAVITY)
    mob:addImmunity(tpz.immunity.BIND)
    mob:addImmunity(tpz.immunity.SILENCE)
    mob:setUnkillable(false)
    mob:setLocalVar("NextPhase", 80)
end

function onMobFight(mob, target)
    local NextPhase = mob:getLocalVar("NextPhase")
    local AvatarPhase = mob:getLocalVar("AvatarPhase")
    if mob:getHPP() < NextPhase and AvatarPhase == 0 then -- Summons a random avatar every 20% HP
        local pet = GetMobByID(17437018)
        DespawnMob(pet)
        spawnPetInBattle(mob, pet)
        mob:setLocalVar("NextPhase", NextPhase - 20)
        mob:setLocalVar("AvatarPhase", 1)
    end
    -- Remove all enfeebles and go invul and become unkillable when avatar is out, remove invul when not out
    if AvatarPhase == 1 then
        for i, effect in ipairs(removables) do
            if (mob:hasStatusEffect(effect)) then
                mob:delStatusEffectSilent(effect)
            end
        end
        mob:setMod(tpz.mod.UDMGPHYS, -100)
        mob:setMod(tpz.mod.UDMGRANGE, -100)
        mob:setMod(tpz.mod.UDMGMAGIC, -100)
        mob:setMod(tpz.mod.DMGBREATH, -100)
        mob:setUnkillable(true)
    else
        mob:setUnkillable(false)
        mob:setMod(tpz.mod.UDMGPHYS, 0)
        mob:setMod(tpz.mod.UDMGRANGE, 0)
        mob:setMod(tpz.mod.UDMGMAGIC, 0)
        mob:setMod(tpz.mod.DMGBREATH, 0)
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    -- Set Grand_Duke_Batym's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(36000, 43200))
end
