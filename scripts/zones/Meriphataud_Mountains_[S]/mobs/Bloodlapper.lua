------------------------------
-- Area: Meriphataud Mountains [S]
--   NM: Bloodlapper
-- Immune to Break
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
    mob:addMod(tpz.mod.DARK, 800) -- So it can  drain for 1k+
	mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.REGAIN, 12)
	mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 15)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
    return 2162 -- Only uses Emetic Discharge
end

function onMonsterMagicPrepare(mob, target)
        local rnd = math.random()
        if (rnd < 0.5) then
            return 256 -- virus
        elseif (rnd < 0.8) then
            return 245 -- drain
        elseif (rnd < 0.9) then
            return 247 -- aspir
		else
			return math.random(266, 272)  -- absorb-str to absorb-chr
        end
    return 0 -- Still need a return, so use 0 when not casting
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 526)
end
