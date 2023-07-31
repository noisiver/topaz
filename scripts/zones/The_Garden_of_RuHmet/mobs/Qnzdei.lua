-----------------------------------
-- Area: The Garden of Ru'Hmet
--  MOB: Aw'Zdei
-- Animation Sub 0 Pot Form
-- Animation Sub 1 Pot Form (reverse eye position)
-- Animation Sub 2 Bar Form
-- Animation Sub 3 Ring Form
-----------------------------------
local ID = require("scripts/zones/The_Garden_of_RuHmet/IDs")
mixins = {require("scripts/mixins/families/zdei")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 25) 
	mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMod(tpz.mod.REFRESH, 40)
end

function changeState(mob, idle)
    if mob:getLocalVar("idle") ~= idle then
        mob:setLocalVar("idle", idle)
        local door = GetNPCByID(ID.npc.QNZDEI_DOORS[mob:getID()])
        local doorIdle = door:getLocalVar("idle")
        if idle == 0 then
            doorIdle = math.max(0, doorIdle - 1)
        else
            doorIdle = math.min(doorIdle + 1, 4)
        end
        if doorIdle == 4 then
            door:setAnimation(tpz.animation.OPEN_DOOR)
            door:untargetable(true)
        else
            door:setAnimation(tpz.animation.CLOSE_DOOR)
            door:untargetable(false)
        end
        door:setLocalVar("idle", doorIdle)
    end
end

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    mob:setMod(tpz.mod.SDT_DARK, 50)
	mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
    changeState(mob, 1)
end

function onMobEngaged(mob, target)
    changeState(mob, 0)
end

function onPath(mob)
    local spawnPos = mob:getSpawnPos()
    mob:pathThrough({spawnPos.x, spawnPos.y, spawnPos.z})
    local pos = mob:getPos()
    if spawnPos.x == pos.x and spawnPos.z == pos.z then
        changeState(mob, 1)
        mob:setPos(spawnPos.x, spawnPos.y, spawnPos.z, mob:getRotPos() + 16)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end
