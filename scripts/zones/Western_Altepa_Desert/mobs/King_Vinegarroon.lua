-----------------------------------
-- Area: Western Altepa Desert
--   NM: King Vinegarroon
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/world")
require("scripts/globals/mobs")
-- !gotoid 17289575
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(100)
	mob:setMod(tpz.mod.ATTP, 50)
    mob:setMod(tpz.mod.DEF, 522)
    mob:setMod(tpz.mod.EVA, 335)
	mob:setMod(tpz.mod.VIT, 50)
    mob:setMod(tpz.mod.UDMGMAGIC, -25)
    mob:setMod(tpz.mod.MDEF, 70)
    mob:setMod(tpz.mod.REGEN, 200)
    mob:setMod(tpz.mod.REFRESH, 300)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobFight(mob, target)
    local DrawinTime = mob:getLocalVar("Drawin")
    if DrawinTime == 0 then
        mob:setLocalVar("Drawin", mob:getBattleTime() + math.random(15, 30))
        printf("Set Draw in time");
        return
    elseif mob:getBattleTime() >= DrawinTime then
        mob:setMobMod(tpz.mobMod.DRAW_IN, 2)
        mob:setLocalVar("Drawin", mob:getBattleTime() + math.random(15, 45))
        printf("Drawing in");
        local RNG = math.random(1,2)
        if RNG == 1 then
            mob:useMobAbility(math.random(722, 723)) -- AOE
        elseif RNG == 2 then
            mob:useMobAbility(354) -- AOE (Wild Rage)
        end
        mob:useMobAbility(math.random(719, 720)) -- Single target
    else
        mob:setMobMod(tpz.mobMod.DRAW_IN, 0)
    end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PETRIFY, {chance = 100})
end

function onMobDisengage(mob, weather)
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.VINEGAR_EVAPORATOR)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(36000, 43200)) -- 11 to 12 hours
end
