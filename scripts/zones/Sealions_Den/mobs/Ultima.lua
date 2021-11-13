-----------------------------------
-- Area: Sealions Den
--   NM: Ultima
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/titles");
require("scripts/globals/msg");
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.DEFP, 20) 
	mob:addMod(tpz.mod.ATTP, 100)
	mob:addMod(tpz.mod.MAIN_DMG_RATING, 25)
	mob:addMod(tpz.mod.ACC, 30) 
	mob:addMod(tpz.mod.EVA, 30)
	mob:setMod(tpz.mod.MDEF, 28) 
	mob:setMod(tpz.mod.REGAIN, 100) -- Should use TP move every ~10 seconds
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 25) 
	mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 10)
	mob:addTP(3000)
    mob:setLocalVar("phase", 0)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobFight(mob,target)
    local phase = mob:getLocalVar("phase")
    if mob:getHPP() < 20 and phase == 0 then
        mob:setLocalVar("phase", 1)
        mob:setMod(tpz.mod.REGAIN, 500)
    end
end;


function onMonsterAbilityPrepare(mob)
    local hpp = mob:getHPP()
    if hpp >= 70 then
        return ({1259, 1269, 1270})[math.random(1, 3)]
    elseif hpp >= 40 then
        mob:queue(500, function(mob)
            mob:useMobAbility(({1262,1263,1264,1265,1266,1267})[math.random(1,6)])
        end)
        return 1268
    elseif hpp >= 20 then
        return ({1261, 1269, 1270})[math.random(1, 3)]
    else
        mob:setMod(tpz.mod.REGAIN, 0)
        mob:queue(6000, function(mob)
            mob:useMobAbility(1260)
        end)
        mob:queue(12000, function(mob)
            mob:setMod(tpz.mod.REGAIN, 500)
            mob:useMobAbility(1260)
        end)

        -- use only particle shield if not active
        if mob:hasStatusEffect(tpz.effect.DEFENSE_BOOST) then
            return 1260
        end
        return 1270
    end

    return 0
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PARALYZE, {duration = 60})
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.ULTIMA_UNDERTAKER)
    player:setLocalVar("[OTBF]cs", 0)
end
