-----------------------------------
-- Area: La Vaule [S]
--  Mob: Mariehene
-----------------------------------
-----------------------------------
function onMobRoam(mob)
    if VanadielHour() >= 6 and VanadielHour() <= 18 then
		mob:setMobMod(tpz.mobMod.NO_AGGRO, 0)
    else
		mob:setMobMod(tpz.mobMod.NO_AGGRO, 1)
    end
end

function onMobDeath(mob, player, isKiller)
end