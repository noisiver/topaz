-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Faust
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 50) 
    mob:addMod(tpz.mod.ATTP, 50)
    mob:addMod(tpz.mod.ACC, 50) 
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMod(tpz.mod.REFRESH, 300)
	mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 30)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobInitialize(mob)
	mob:setMod(tpz.mod.MOVE, 60)
end

function onMobFight(mob, target)
	mob:setMod(tpz.mod.REGAIN, 500)
end


function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 539 then
        local Typhoon = mob:getLocalVar("Typhoon")

        Typhoon = Typhoon +1
        mob:setLocalVar("Typhoon", Typhoon)

        if Typhoon > 2 then
            mob:setLocalVar("Typhoon", 0)
        else
            mob:useMobAbility(539)
        end
    end
end


function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(10800, 21600)) -- respawn 3-6 hrs
end
