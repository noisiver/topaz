-----------------------------------
-- Area: Periqia (Requiem)
--  Mob: Darkling Draugar
-- THF
-----------------------------------
local ID = require("scripts/zones/Periqia/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:setMod(tpz.mod.CRITHITRATE, 100)
end

function onMobRoam(mob)
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
    return 1795 -- Only uses Malediction
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 1795 then -- Malediction
         mob:useMobAbility(478) -- Hell Slash
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end
