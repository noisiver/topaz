-----------------------------------
-- Area: The Garden of Ru'Hmet
--  MOB: Ix'Zdei (BLM)
-- Animation Sub 0 Pot Form
-- Animation Sub 1 Pot Form (reverse eye position)
-- Animation Sub 2 Bar Form
-- Animation Sub 3 Ring Form
-----------------------------------
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
end

function onMobInitialize(mob)
end

function onMobEngaged(mob)
    mob:SetAutoAttackEnabled(true)
    mob:setLocalVar("recover", math.random(20, 50))
end

function onMobFight(mob)
    local recover = mob:getLocalVar("recover")
    if mob:getHPP() <= recover then
        local pos = mob:getSpawnPos()
		mob:pathTo(pos.x, pos.y, pos.z)
		mob:SetAutoAttackEnabled(false)

	local Pos = mob:getPos()
		if Pos.x == pos.x and Pos.y == pos.y and Pos.z == pos.z then
            local time = mob:getLocalVar("time")
            local now = os.time()
            if time ~= 0 and now > time then
                mob:SetAutoAttackEnabled(true)
                mob:setHP(mob:getMaxHP())
                mob:setLocalVar("recover", 0)
            elseif time == 0 then
                mob:setLocalVar("time", os.time() + 3)
            end
        end
    end
end

function onMobDeath(mob, player, isKiller)
end
