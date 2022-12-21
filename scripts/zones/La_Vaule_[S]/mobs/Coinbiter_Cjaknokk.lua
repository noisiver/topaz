-----------------------------------
-- Area: La Vaule [S]
--   NM: Coinbiter Cjaknokk
-- Immune to Silence Sleep Bind Gravity Paralyze
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
    mob:setMod(tpz.mod.REGAIN, 1000)
end

function onMobFight(mob, target)
    local hp = mob:getHPP()

    -- Uses TP moves every 10 seconds at 50-100% HP, then every 5 seconds below 50.
    if (hp < 25) then
        mob:setMod(tpz.mod.REGAIN, 500)
    elseif (hp < 50) then
        mob:setMod(tpz.mod.REGAIN, 1500)
    else
        mob:setMod(tpz.mod.REGAIN, 1000)
    end

    -- Keeps up Dread Spikes at all times
    if not mob:hasStatusEffect(tpz.effect.DREAD_SPIKES) then
        mob:castSpell(277, mob)
    end
end

function onMobWeaponSkillPrepare(mob, target)
    return 2264 -- Shoulder Charge
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(7200) -- 2 hours
end
