-----------------------------------
-- Area: La Vaule [S]
--   NM: Coinbiter Cjaknokk
-- Perma dreadspikes
-- Uses TP moves every 10s at high HP then 5s at low HP
-- Immune to Silence Sleep Bind Gravity Paralyze
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
-----------------------------------

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
    mob:setMod(tpz.mod.REGAIN, 1000)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 3)
end

function onMobEngaged(mob)
    mob:setLocalVar("dreadSpikes", 0)
end

function onMobFight(mob, target)
    local dreadSpikes = mob:getLocalVar("dreadSpikes")
    local hp = mob:getHPP()

    -- Uses TP moves every 10 seconds at 50-100% HP, then every 5 seconds below 50.
    if (hp < 25) then
        mob:setMod(tpz.mod.REGAIN, 500)
    elseif (hp < 50) then
        mob:setMod(tpz.mod.REGAIN, 1500)
    else
        mob:setMod(tpz.mod.REGAIN, 1000)
    end

    if not mob:hasStatusEffect(tpz.effect.DREAD_SPIKES) then
        mob:setLocalVar("dreadSpikes", 1)
    end

    mob:addListener("MAGIC_START", "CJAKNOKK_MAGIC_START", function(mob, spell)
        if spell:getID() == 277 then
            mob:setLocalVar("dreadSpikes", 0)
        end
    end)
end

function onMobWeaponSkillPrepare(mob, target)
    return 2264 -- Shoulder Charge
end

function onMonsterMagicPrepare(mob, target)
    local dreadSpikes = mob:getLocalVar("dreadSpikes")

    -- Keeps up dreadspikes and immediately recasts if it's removed
    if (dreadSpikes > 0) then
        return 277
    else
        return 0
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(7200) -- 2 hours
end
