-----------------------------------
-- Area: Bearclaw Pinnacle
--  Mob: Eldertaur
--  ENM: Brothers
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.EVA, -20)
    mob:setMod(tpz.mod.UDMGPHYS, 0)
    mob:setMod(tpz.mod.UDMGRANGE, 0)
    mob:setMod(tpz.mod.UDMGMAGIC, 0)
    mob:setMod(tpz.mod.UDMGBREATH, 0)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
    mob:setMod(tpz.mod.EEM_BLIND, 30)
    mob:setMod(tpz.mod.EEM_DARK_SLEEP, 5)
    mob:setMod(tpz.mod.EEM_LIGHT_SLEEP, 5)
    mob:setMod(tpz.mod.EEM_SILENCE, 5)
	mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setLocalVar("PDTTime", math.random(45, 60))
end

function onMobRoam(mob)

       --mob:setPos(-463.0055,0.6080,898.2466,60)
end

function onMobFight(mob, target)
	local PDTTime = mob:getLocalVar("PDTTime")
	local MDTTime = mob:getLocalVar("MDTTime")
	local MixTime = mob:getLocalVar("MixTime")
    local BattleTime = mob:getBattleTime()

    -- Alternates between phys immune and magic immune after a random amount of time(45-60s)
    if PDTTime > 0 and BattleTime >= PDTTime then
	    mob:setDamage(60) -- Hits for ~100
        mob:setMod(tpz.mod.ATT, 200)
        mob:setMod(tpz.mod.DEF, 750)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
        mob:setMod(tpz.mod.UDMGPHYS, -100)
        mob:setMod(tpz.mod.UDMGRANGE, -100)
        mob:setMod(tpz.mod.UDMGMAGIC, 0)
        mob:setMod(tpz.mod.UDMGBREATH, 0)
        mob:useMobAbility(627) -- Yellow 2 hour cloud animation
        mob:setLocalVar("PDTTime", 0)
        mob:setLocalVar("MDTTime", BattleTime + math.random(45, 60))
        --printf("Does little physical damage (less than 100 normally). Takes full magic damage, yet takes little to no physical damage.")
    end

    if MDTTime > 0 and BattleTime >= MDTTime then
	    mob:setDamage(450) -- Hits for 600+
        mob:setMod(tpz.mod.ATT, 750)
        mob:setMod(tpz.mod.DEF, 200)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 50)
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 25)
        mob:setMod(tpz.mod.UDMGPHYS, 0)
        mob:setMod(tpz.mod.UDMGRANGE, 0)
        mob:setMod(tpz.mod.UDMGMAGIC, -100)
        mob:setMod(tpz.mod.UDMGBREATH, -100)
        mob:useMobAbility(625)  -- Blue 2 hour cloud animation
        mob:setLocalVar("MDTTime", 0)
        mob:setLocalVar("MixTime", BattleTime + math.random(45, 60))
        --printf("Extremely high melee damage (600+), double attacks and triple attacks a lot. Takes little to no magic damage, yet takes full physical damage. ")
    end

    if MixTime > 0 and BattleTime >= MixTime then
	    mob:setDamage(100) -- Hits for 200+
        mob:setMod(tpz.mod.ATT, 400)
        mob:setMod(tpz.mod.DEF, 400)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
        mob:setMod(tpz.mod.UDMGPHYS, -33)
        mob:setMod(tpz.mod.UDMGRANGE, -33)
        mob:setMod(tpz.mod.UDMGMAGIC, -33)
        mob:setMod(tpz.mod.UDMGBREATH, -33)
        mob:useMobAbility(624)  -- Green 2 hour cloud animation
        mob:setLocalVar("MixTime", 0)
        mob:setLocalVar("PDTTime", BattleTime + math.random(45, 60))
        --printf("Moderate melee damage (200ish). Takes magic and physical damage, but not 100 of both.")
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
end
