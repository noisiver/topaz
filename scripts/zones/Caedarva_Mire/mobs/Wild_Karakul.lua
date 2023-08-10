-----------------------------------
-- Area: Caedarva Mire
--  Mob: Wild Karakul
-- Note: PH for Peallaidh
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/families/karakul")}
-----------------------------------
function onMobFight(mob, target)
	local TrySummonChigoe = mob:getLocalVar("TrySummonChigoe")
    -- Try to summon a Chigoe
    if TrySummonChigoe == 1 then
        local spawns = { 17100811, 17100812, 17100813, 17100814, 17100815}
        local Chigoe = GetMobByID(spawns[math.random(#spawns)])
        local mobX = mob:getXPos()
        local mobY = mob:getYPos()
        local mobZ = mob:getZPos()
        if Chigoe:isSpawned() then -- Keep trying to summon a Chigoe until not rolling the same Chigoe
            return
        end
        Chigoe:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
	    Chigoe:spawn()
	    Chigoe:updateEnmity(target)
        mob:setLocalVar("TrySummonChigoe", 0)
    end
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() > 0 then -- Spawns a Chigoe after using any TP move
        mob:setLocalVar("TrySummonChigoe", 1)
    end
end


function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.PEALLAIDH_PH, 20, 3600) -- 1 hour
end

function onMobDeath(mob, player, isKiller, noKiller)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(2488, mob)--Alexandrite 
	end
end
