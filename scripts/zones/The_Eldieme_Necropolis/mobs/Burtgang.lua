------------------------------
-- Area: The Eldieme Necropolis
--   Burtgang
--  !additem 480 
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 300) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:setMod(tpz.mod.UFASTCAST, 50)
    mob:setMod(tpz.mod.UDMGMAGIC, 200)
    mob:setMod(tpz.mod.UDMGPHYS, -10)
    mob:setMod(tpz.mod.REFRESH, 400)
end

function onMobFight(mob, target)
end


function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 45 then
        mob:resetEnmity(target)        
    end
end

function onMobDeath(mob, player, isKiller)
player:PrintToPlayer("Maybe...you...are...worthy...of...my...power...",0,"Burtgang")
end


