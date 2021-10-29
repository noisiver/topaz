------------------------------
-- Area: Meriphataud Mountains [S]
--   NM: Bloodlapper
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/job_special")}
------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 25)
    mob:addMod(tpz.mod.QUAD_ATTACK, 50)
    mob:addMod(tpz.mod.DARK, 800) -- So it can  drain for 1k+
	mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local EDTime = mob:getLocalVar("EDTime")

    if EDTime == 0 then
        mob:setLocalVar("EDTime", math.random(30, 45))
    elseif battletime >= EDTime then
        mob:useMobAbility(2162) -- Emetic Discharge
        mob:setLocalVar("EDTime", battletime + math.random(30,45))
    end
end

function onMonsterMagicPrepare(mob, target)
        local rnd = math.random()
        if (rnd < 0.5) then
            return 256 -- virus
        elseif (rnd < 0.7) then
            return 245 -- drain
        elseif (rnd < 0.9) then
            return 247 -- aspir
		else
			return math.random(266, 272)  -- absorb-str to absorb-chr
        end
    return 0 -- Still need a return, so use 0 when not casting
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 526)
end
