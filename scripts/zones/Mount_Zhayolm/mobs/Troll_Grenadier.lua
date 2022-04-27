-----------------------------------
-- Area: Mount Zhayolm
--  Mob: Troll_Grenadier
-- Note: 
-----------------------------------
mixins = {require("scripts/mixins/weapon_break")}
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
-----------------------------------
function onMobSpawn(mob)
     if (mob:getID() > ID.mob.KHROMASOUL_BHURBORLOR) then
        mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
        mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
        mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
        mob:setMobMod(tpz.mobMod.CHECK_AS_NM, 1)
     end
end

function onMobFight(mob, target)
     if (mob:getID() > ID.mob.KHROMASOUL_BHURBORLOR) then
     end
end

function onMobDeath(mob)
     if (mob:getID() < ID.mob.KHROMASOUL_BHURBORLOR) then
	    if isKiller and math.random(1,100) <= 24 then 
		    player:addTreasure(2488, mob)--Alexandrite 
	    end
    end
end
