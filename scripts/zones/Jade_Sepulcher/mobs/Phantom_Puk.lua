-----------------------------------
-- Area: Jade Sepulcher
-- MOB: Phantom Puk
-- ISNM3000: Shadows of the Mind
-----------------------------------
local ID = require("scripts/zones/Jade_Sepulcher/IDs")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(125)
	mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobEngaged(mob, target)
    mob:setLocalVar("boreas_mantle", os.time() + math.random(15, 30))
end

function onMobFight(mob, target)
    local now = os.time()
    if mob:getLocalVar("boreas_mantle") <= now then
        mob:useMobAbility(1980)
        mob:setLocalVar("boreas_mantle", now + 45)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    mobid = mob:getID()
    for cloneid = mobid + 1, mobid + 4 do
        if GetMobAction(cloneid) ~= 0 then
            DespawnMob(cloneid)
        end
    end
end
