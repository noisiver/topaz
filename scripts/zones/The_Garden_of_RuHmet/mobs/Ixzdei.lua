-----------------------------------
-- Area: The Garden of Ru'Hmet
--  MOB: Ix'Zdei (BLM)
-- Animation Sub 0 Pot Form
-- Animation Sub 1 Pot Form (reverse eye position)
-- Animation Sub 2 Bar Form
-- Animation Sub 3 Ring Form
-----------------------------------
local ID = require("scripts/zones/The_Garden_of_RuHmet/IDs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/families/zdei")}
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 12)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 12)
    mob:setMobMod(tpz.mobMod.LINK_RADIUS, 50)
	mob:setAggressive(true)
	mob:setDamage(125)
	mob:addMod(tpz.mod.DEFP, 25) 
	mob:addMod(tpz.mod.ATTP, 25)
	mob:addMod(tpz.mod.ACC, 25) 
	mob:addMod(tpz.mod.EVA, 25)
	mob:setMod(tpz.mod.MDEF, 24) 
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:SetMagicCastingEnabled(false)
    mob:setLocalVar("healed", 0)
end

function onMobInitialize(mob)
end

function onPath(mob)
    local spawnPos = mob:getSpawnPos()
    mob:pathThrough({spawnPos.x, spawnPos.y, spawnPos.z})
    local pos = mob:getPos()
    if spawnPos.x == pos.x and spawnPos.z == pos.z then
        mob:setPos(spawnPos.x, spawnPos.y, spawnPos.z, mob:getRotPos() + 16)
    end
end

function onMobEngaged(mob)
    local spellList =
    {
        [1] = 144,
        [2] = 149,
        [3] = 154,
        [4] = 159,
        [5] = 164,
        [6] = 169,
        [7] = 216,
        [8] = 260,
        [9] = 230,
        [10] = 254,
    }
    mob:SetMagicCastingEnabled(true)
    mob:castSpell(spellList[math.random(#spellList)])

	local target = mob:getTarget()
    local ZdeiOne = GetMobByID(16921011)
    local ZdeiTwo = GetMobByID(16921012)
    local ZdeiThree = GetMobByID(16921013)
    local ZdeiFour = GetMobByID(16921014)
	ZdeiOne:updateEnmity(target)
	ZdeiTwo:updateEnmity(target)
	ZdeiThree:updateEnmity(target)
	ZdeiFour:updateEnmity(target)
    mob:SetAutoAttackEnabled(true)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
    mob:setLocalVar("recover", math.random(5, 50))
end

function onMobFight(mob)
    local recover = mob:getLocalVar("recover")
    local healed = mob:getLocalVar("healed")
    if mob:getHPP() <= recover then
        local pos = mob:getSpawnPos()
		mob:pathTo(pos.x, pos.y, pos.z)
		mob:SetAutoAttackEnabled(false)

	local Pos = mob:getPos()
		if Pos.x == pos.x and Pos.y == pos.y and Pos.z == pos.z then
            local time = mob:getLocalVar("time")
            local now = os.time()
            if time ~= 0 and now > time and healed == 0 then
                mob:SetAutoAttackEnabled(true)
                mob:setHP(mob:getMaxHP())
                mob:setLocalVar("recover", 0)
                mob:setLocalVar("healed", 1)
            elseif time == 0 then
                mob:setLocalVar("time", os.time() + math.random(10, 25))
            end
        end
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end
