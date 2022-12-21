-----------------------------------
-- Area: La Vaule [S]
--   NM: Draketrader Zlodgodd
-- Spams jump every 3s
-- Uses two Jumps. ID 733 and ID 1064
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
-----------------------------------

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
    mob:setMod(tpz.mod.REGAIN, 1000)
end

function onMobFight(mob, target)
    local hp = mob:getHPP()

    -- Uses Jump every 10 seconds at 50-100% HP, then every 5 seconds below 50.
    if (hp < 25) then
        mob:setMod(tpz.mod.REGAIN, 500)
    elseif (hp < 50) then
        mob:setMod(tpz.mod.REGAIN, 1500)
    else
        mob:setMod(tpz.mod.REGAIN, 1000)
    end

end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end

function onMobWeaponSkillPrepare(mob, target)
    local jumps = {733, 1064}
    return jumps[math.random(#jumps)]
end

function onMobDespawn(mob)
    mob:setRespawnTime(7200) -- 2 hours
end
