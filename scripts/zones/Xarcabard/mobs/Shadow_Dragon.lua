-----------------------------------
-- Area: Xarcabard
--  Mob: Shadow Dragon
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.ACC, 20) 
    mob:addMod(tpz.mod.EVA, 20)
    mob:addMod(tpz.mod.MDEF, 24) 
    mob:setMobMod(tpz.mobMod.GIL_MIN, 1076)
    mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
end

function onMobDespawn(mob)
    local B_ToD = GetServerVariable("[POP]Biast")
    local X = mob:getXPos()
    local Y = mob:getYPos()
    local Z = mob:getZPos()

    -- Check if Biast window is open, and there is not an Biast popped already
    if B_ToD <= os.time() and not GetMobByID(mob:getID() + 1):isSpawned() then
        SpawnMob(mob:getID() + 1)
        GetMobByID(mob:getID() + 1):setPos(X, Y, Z)
        GetMobByID(mob:getID() + 1):setSpawn(X, Y, Z)
        DisallowRespawn(mob:getID(), true)
    end
end
