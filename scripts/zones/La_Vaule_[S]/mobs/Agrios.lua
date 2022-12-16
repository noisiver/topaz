-----------------------------------
-- Area: La Vaule [S]
--   NM: Agrios
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
require("scripts/globals/wotg_strongholds")
-----------------------------------
local wsList = {665, 666} -- Grand Slam, Power Attack
local wsList2 = {665, 666, 2349} -- Grand Slam, Power Attack, Daunting Hurl


function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
end


function onMobFight(mob, target)
    local repeatSkill = mob:getLocalVar("repeatTPMove")

    if (repeatSkill > 0) then
        mob:setLocalvar("repeatTPMove", 0)
        UseMultipleTPMoves(mob, math.random(2), repeatSkill)
    end
end

function onMobWeaponSkillPrepare(mob, target)
    local hp = mob:getHPP()
    if (hp > 40) then
        return wsList[math.random(#wsList)]
    else
        return wsList2[math.random(#wsList2)]
    end
end

function onMobWeaponSkill(target, mob, skill)
    -- Has a chance to use all TP moves up to 3 times in a row
    if skill:getID() ~= 658 then
        if math.random(100) <= 20 then
            mob:setLocalvar("repeatTPMove", skill:getID())
        end
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(7200) -- 2 hours
end
