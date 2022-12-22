-----------------------------------
-- Area: La Vaule [S]
--   NM: Cogtooth Skagnogg
-- Scattershell is very long cast time(3-4s)
-- Perma 3k TP regain
-- Ceases to use Burst at 80%, Fountain at 60%, Firebomb at 40%, and Blastbomb at 20%.
-- Only uses Tear Grenade, Sticky Grenade, and Scatter Shell below 20%.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
-----------------------------------
local wsList100 = { 635, 636, 637, 638, 639, 2350, 2351, 2352 }
local wsList80 = { 636, 637, 638, 2350, 2351, 2352 }
local wsList60 = { 636, 638, 2350, 2351, 2352 }
local wsList40 = { 636, 2350, 2351, 2352 }
local wsList20 = {2350, 2351, 2352 }

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
    mob:setMod(tpz.mod.REGAIN, 3000)
    mob:SetAutoAttackEnabled(false)
end

function onMobWeaponSkillPrepare(mob, target)
    local hp = mob:getHPP()

    -- Ceases to use Burst at 80%, Fountain at 60%, Firebomb at 40%, and Blastbomb at 20%.
    if (hp < 21) then
        return wsList20[math.random(#wsList20)]
    elseif (hp < 41) then
        return wsList40[math.random(#wsList60)]
    elseif (hp < 66) then
        return wsList60[math.random(#wsList40)]
    elseif (hp < 81) then
        return wsList80[math.random(#wsList80)]
    else
        return wsList100[math.random(#wsList100)]
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(7200) -- 2 hours
end
