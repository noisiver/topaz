-----------------------------------
-- Area: Al'Taieu
--  HNM: Absolute Virtue
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/magic")
mixins ={require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
	mob:setDamage(250)
    mob:setMod(tpz.mod.ATT, 550)
    mob:setMod(tpz.mod.DEF, 550)
    mob:setMod(tpz.mod.EVA, 350)
    mob:setMod(tpz.mod.MATT, 132)
    mob:setMod(tpz.mod.MDEF, 100)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.UDMGMAGIC, -58)
    mob:setMod(tpz.mod.REGAIN, 500)
    mob:setMod(tpz.mod.REGEN, 500)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 2) 
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setLocalVar("Mode", 0)

    local JoL = GetMobByID(ID.mob.JAILER_OF_LOVE)
    -- Special check for regen modification by JoL pets killed
    if (JoL:getLocalVar("JoL_Qn_xzomit_Killed") == 9) then
        mob:addMod(tpz.mod.REGEN, -130)
    end
    if (JoL:getLocalVar("JoL_Qn_hpemde_Killed") == 9) then
        mob:addMod(tpz.mod.REGEN, -130)
    end
    tpz.mix.jobSpecial.config(mob, {
        between = 180,
        specials =
        {

            {id = tpz.jsa.MIGHTY_STRIKES, cooldown = 0, hpp = 100},
            {id = tpz.jsa.HUNDRED_FISTS, cooldown = 0, hpp = 100},
            {id = tpz.jsa.BLOOD_WEAPON, cooldown = 0, hpp = 100},
            {id = tpz.jsa.MEIKYO_SHISUI, cooldown = 0, hpp = 100},
            {id = tpz.jsa.MANAFONT, cooldown = 0, hpp = 100},
            {id = tpz.jsa.CHAINSPELL, cooldown = 0, hpp = 100},
            {id = tpz.jsa.INVINCIBLE, cooldown = 0, hpp = 100},
            {id = tpz.jsa.PERFECT_DODGE, cooldown = 0, hpp = 100},
            {id = tpz.jsa.SOUL_VOICE, duration = 30, cooldown = 0, hpp = 100},
            {id = tpz.jsa.MIJIN_GAKURE, cooldown = 0, hpp = 100},
            {id = tpz.jsa.EAGLE_EYE_SHOT, cooldown = 0, hpp = 100},
            {id = tpz.jsa.BENEDICTION, cooldown = 0, hpp = 100},
            {id = tpz.jsa.ASTRAL_FLOW, cooldown = 0, hpp = 100},
            {id = tpz.jsa.FAMILIAR, cooldown = 0, hpp = 100},
            {id = tpz.jsa.CALL_WYVERN, cooldown = 0, hpp = 100},
        },
    })
end

function onMobFight(mob, target)
	local MeteorTime = mob:getLocalVar("MeteorTime")
	local DreadSpikesTime = mob:getLocalVar("DreadSpikesTime")
	local DrainTime = mob:getLocalVar("DrainTime")
	local BraceletsTime = mob:getLocalVar("BraceletsTime")
	local BraceletsOff = mob:getLocalVar("BraceletsOff")
	local Mode = mob:getLocalVar("Mode")
	local BattleTime = mob:getBattleTime()
	
    -- Braclets mode sub 60% HP
    if mob:getHPP() <= 59 then
        if Mode == 0 then
			mob:setMod(tpz.mod.HASTE_MAGIC, 2500)
			mob:setMod(tpz.mod.ATTP, 100)
			mob:addMod(tpz.mod.MATT, 48)
			mob:setMod(tpz.mod.UDMGPHYS, -60) 
			mob:setMod(tpz.mod.UDMGRANGE, -60)
			mob:setMod(tpz.mod.UDMGMAGIC, -60)
			mob:AnimationSub(2)
			mob:setLocalVar("BraceletsOff", BattleTime + math.random(20, 45))
			mob:setLocalVar("Mode", 1)
        end
    end

    -- 2 hour logic
    if mob:hasStatusEffect(tpz.effect.MANAFONT) then
        mob:setMobMod(tpz.mobMod.MAGIC_COOL, 10)
        mob:setSpellList(492)
    else
        mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
        mob:setSpellList(493)
    end
    if mob:hasStatusEffect(tpz.effect.CHAINSPELL) then
        mob:setSpellList(493)
    else
        mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    end
    if mob:hasStatusEffect(tpz.effect.SOUL_VOICE) then
        mob:setMobMod(tpz.mobMod.MAGIC_COOL, 10)
        mob:setSpellList(494)
    else
        mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
        mob:setSpellList(493)
    end
    if mob:hasStatusEffect(tpz.effect.MIGHTY_STRIKES) or mob:hasStatusEffect(tpz.effect.HUNDRED_FISTS)
        or mob:hasStatusEffect(tpz.effect.BLOOD_WEAPON) then
        mob:SetMobAbilityEnabled(false)
        mob:SetMagicCastingEnabled(false)
    else
        mob:SetMobAbilityEnabled(true)
        mob:SetMagicCastingEnabled(true)
    end

    for v = 16912877, 16912882, 1 do
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        local pet = GetMobByID(v)
        if pet:isSpawned() then
            pet:setPos(mobX, mobY, mobZ)
            pet:updateEnmity(target)
        end
    end

    -- Despawn after 2 hours
    if BattleTime >= 7200 then
        DespawnMob(mob:getID())
    end
end

function onSpellPrecast(mob, spell)
    if (spell:getID() == 218) then -- Meteor
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setFlag(tpz.magic.spellFlag.HIT_ALL)
        spell:setRadius(30)
        spell:setAnimation(280) -- AoE Meteor Animation
        spell:setMPCost(1)
    end
end

function onMagicHit(caster, target, spell)
    local REGEN = target:getMod(tpz.mod.REGEN)
    local DAY = VanadielDayOfTheWeek()
    local ELEM = spell:getElement()
    if (GetServerVariable("AV_Regen_Reduction") < 60) then
        -- Had to serverVar the regen instead of localVar because localVar reset on claim loss.
        if (ELEM == tpz.magic.dayElement[DAY] and (caster:isPC() or caster:isPet())) then
            SetServerVariable("AV_Regen_Reduction", 1+GetServerVariable("AV_Regen_Reduction"))
            target:addMod(tpz.mod.REGEN, -2)
        end
    end
    return 1
end

function onMobDeath(mob, player, isKiller, noKiller)
    for i = 16912877, 16912882, 1 do
        if GetMobByID(i):isSpawned() then
            DespawnMob(i)
        end
    end
    player:addTitle(tpz.title.VIRTUOUS_SAINT)
end
