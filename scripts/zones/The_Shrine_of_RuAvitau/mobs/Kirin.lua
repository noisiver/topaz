-----------------------------------
-- Area: The Shrine of Ru'Avitau
--   NM: Kirin
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
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
        tpz.effect.HELIX, tpz.effect.KAUSTRA, tpz.effect.SILENCE,
    }

function onMobInitialize( mob )
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
	mob:setDamage(155)
    mob:setMod(tpz.mod.ATT, 522)
    mob:setMod(tpz.mod.DEF, 465) -- 515
    mob:setMod(tpz.mod.REFRESH, 300)
    mob:setMod(tpz.mod.REGEN, 50)
    mob:setMod(tpz.mod.REGAIN, 50)
    mob:SetAutoAttackEnabled(true)
    mob:SetMobAbilityEnabled(true)
    mob:SetMagicCastingEnabled(true)
    mob:setUnkillable(true)
    mob:setLocalVar("GodsSummoned", 0)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.ASTRAL_FLOW, hpp = 69},
        },
    })
end

function onMobRoam(mob)
    mob:SetAutoAttackEnabled(true)
    mob:SetMobAbilityEnabled(true)
    mob:SetMagicCastingEnabled(true)
end

function onMobFight( mob, target )
    local GodsSummoned = mob:getLocalVar("GodsSummoned")
	local BattleTime = mob:getBattleTime()
    -- Disable movement / attacking if any God is spawned
    for i = 17506671, 17506674 do
        local pet = GetMobByID(i)
        if pet:isSpawned() then
            mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
            mob:SetAutoAttackEnabled(false)
            mob:SetMobAbilityEnabled(false)
            mob:SetMagicCastingEnabled(false)
        end
    end

    -- spawn gods
    if mob:getHPP() <= 75 and GodsSummoned == 0 and mob:getCurrentAction() ~= tpz.action.MAGIC_CASTING then
        local godsRemaining = {}
        for i = 1, 4 do
            if (mob:getLocalVar("add"..i) == 0) then
                table.insert(godsRemaining, i)
            end
        end
        if (#godsRemaining > 0) then
            local g = godsRemaining[math.random(#godsRemaining)]
            local god = SpawnMob(ID.mob.KIRIN + g)
            mob:useMobAbility(624) -- 2 hour "cloud" animation
            for i, effect in ipairs(removables) do
                if (mob:hasStatusEffect(effect)) then
                    mob:delStatusEffect(effect)
                end
            end
            mob:setMod(tpz.mod.UDMGPHYS, -100)
            mob:setMod(tpz.mod.UDMGRANGE, -100)
            mob:setMod(tpz.mod.UDMGMAGIC, -100)
            mob:setMod(tpz.mod.UDMGBREATH, -100)
            god:updateEnmity(target)
            god:setPos(mob:getXPos() +3, mob:getYPos(), mob:getZPos())
            mob:setLocalVar("add"..g, 1)
            mob:setLocalVar("GodsSummoned", 1)
        end
    end

    if mob:getHPP() <= 50 and GodsSummoned == 1 and mob:getCurrentAction() ~= tpz.action.MAGIC_CASTING then
        local godsRemaining = {}
        for i = 1, 4 do
            if (mob:getLocalVar("add"..i) == 0) then
                table.insert(godsRemaining, i)
            end
        end
        if (#godsRemaining > 0) then
            local g = godsRemaining[math.random(#godsRemaining)]
            local god = SpawnMob(ID.mob.KIRIN + g)
            mob:useMobAbility(624) -- 2 hour "cloud" animation
            for i, effect in ipairs(removables) do
                if (mob:hasStatusEffect(effect)) then
                    mob:delStatusEffect(effect)
                end
            end
            mob:setMod(tpz.mod.UDMGPHYS, -100)
            mob:setMod(tpz.mod.UDMGRANGE, -100)
            mob:setMod(tpz.mod.UDMGMAGIC, -100)
            mob:setMod(tpz.mod.UDMGBREATH, -100)
            god:updateEnmity(target)
            god:setPos(mob:getXPos() +3, mob:getYPos(), mob:getZPos())
            mob:setLocalVar("add"..g, 1)
            mob:setLocalVar("GodsSummoned", 2)
        end
    end

    if mob:getHPP() <= 25 and GodsSummoned == 2 and mob:getCurrentAction() ~= tpz.action.MAGIC_CASTING then
        local godsRemaining = {}
        for i = 1, 4 do
            if (mob:getLocalVar("add"..i) == 0) then
                table.insert(godsRemaining, i)
            end
        end
        if (#godsRemaining > 0) then
            local g = godsRemaining[math.random(#godsRemaining)]
            local god = SpawnMob(ID.mob.KIRIN + g)
            mob:useMobAbility(624) -- 2 hour "cloud" animation
            for i, effect in ipairs(removables) do
                if (mob:hasStatusEffect(effect)) then
                    mob:delStatusEffect(effect)
                end
            end
            mob:setMod(tpz.mod.UDMGPHYS, -100)
            mob:setMod(tpz.mod.UDMGRANGE, -100)
            mob:setMod(tpz.mod.UDMGMAGIC, -100)
            mob:setMod(tpz.mod.UDMGBREATH, -100)
            god:updateEnmity(target)
            god:setPos(mob:getXPos() +3, mob:getYPos(), mob:getZPos())
            mob:setLocalVar("add"..g, 1)
            mob:setLocalVar("GodsSummoned", 3)
        end
    end

    if mob:getHPP() <= 5 and GodsSummoned == 3 and mob:getCurrentAction() ~= tpz.action.MAGIC_CASTING then
        local godsRemaining = {}
        for i = 1, 4 do
            if (mob:getLocalVar("add"..i) == 0) then
                table.insert(godsRemaining, i)
            end
        end
        if (#godsRemaining > 0) then
            local g = godsRemaining[math.random(#godsRemaining)]
            local god = SpawnMob(ID.mob.KIRIN + g)
            mob:setUnkillable(true)
            mob:useMobAbility(624) -- 2 hour "cloud" animation
            for i, effect in ipairs(removables) do
                if (mob:hasStatusEffect(effect)) then
                    mob:delStatusEffect(effect)
                end
            end
            mob:setMod(tpz.mod.UDMGPHYS, -100)
            mob:setMod(tpz.mod.UDMGRANGE, -100)
            mob:setMod(tpz.mod.UDMGMAGIC, -100)
            mob:setMod(tpz.mod.UDMGBREATH, -100)
            god:updateEnmity(target)
            god:setPos(mob:getXPos() +3, mob:getYPos(), mob:getZPos())
            mob:setLocalVar("add"..g, 1)
            mob:setLocalVar("GodsSummoned", 4)
        end
    end

    -- ensure all spawned pets are doing stuff
    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
        local god = GetMobByID(i)
        if (god:getCurrentAction() == tpz.act.ROAMING) then
            god:updateEnmity(target)
        end
    end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENSTONE)
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle( tpz.title.KIRIN_CAPTIVATOR )
    player:showText( mob, ID.text.KIRIN_OFFSET + 1 )
end

function onMobDespawn( mob )
end
