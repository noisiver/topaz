-----------------------------------
-- Area: Bibiki Bay
--   NM: Dalham
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
    mob:setMod(tpz.mod.QUAD_ATTACK, 0)
end

function onMobInitialize(mob)
    mob:setMod(tpz.mod.WATER_ABSORB, 100)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobFight(mob)
    local Stage = mob:getLocalVar("Stage")
    local TwoHourCloud = mob:getLocalVar("TwoHourCloud")
    local hpp = mob:getHPP()
    if Stage == 0 and TwoHourCloud == 0 and hpp <= 70 then
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        mob:setLocalVar("Stage", 1)
        mob:setLocalVar("TwoHourCloud", 1)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 100)
    elseif Stage == 1 and TwoHourCloud == 1 and hpp <= 40 then
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        mob:setLocalVar("Stage", 2)
        mob:setLocalVar("TwoHourCloud", 2)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 100)
    elseif Stage == 2 and TwoHourCloud == 2 and hpp <= 25 then
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        mob:setLocalVar("Stage", 3)
        mob:setLocalVar("TwoHourCloud", 3)
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
        mob:setMod(tpz.mod.QUAD_ATTACK, 100)
    end
end

function onAdditionalEffect(mob, target, damage)
	return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENAERO, {chance = 100, power = math.random(20, 30)})
end

function onMobDeath(mob, player, isKiller, noKiller)
    if (player:getCurrentMission(COP) == tpz.mission.id.cop.CALM_BEFORE_THE_STORM and player:getCharVar("COP_Dalham_KILL") == 0) then
        player:setCharVar("COP_Dalham_KILL", 1)
    end
end
