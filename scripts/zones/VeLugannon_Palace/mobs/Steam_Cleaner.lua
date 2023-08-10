-----------------------------------
-- Area: Ve'Lugannon Palace
--   NM: Steam Cleaner
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 15) 
    mob:addMod(tpz.mod.ATTP, 15)
    mob:addMod(tpz.mod.ACC, 5) 
    mob:addMod(tpz.mod.EVA, 5)
    mob:setMod(tpz.mod.REFRESH, 300)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.TP_DRAIN, {chance = 25, power = math.random(50, 100)})
end

function onMonsterMagicPrepare(mob, target)
	rnd = math.random()

    if (rnd < 0.5) then
        return 196 -- thundaga III
    elseif (rnd < 0.7) then
        return 167 -- thunder IV
    else
        return 239 -- shock
    end
    return 0 -- Still need a return, so use 0 when not casting
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    local respawn = 7200
    mob:setRespawnTime(respawn) -- 2 hours
    SetServerVariable("SteamCleaner_Respawn", (os.time() + respawn))
end
