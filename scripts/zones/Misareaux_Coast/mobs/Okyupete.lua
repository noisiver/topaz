------------------------------
-- Area: Misareaux Coast
--   NM: Okyupete
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.MAIN_DMG_RATING, 25)
	mob:setMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
end

function onMobFight(mob, target)
    if mob:getHPP() <= 25 then
        mob:setMod(tpz.mod.REGAIN, 250)
    end
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 400 then -- Triple Attack
		mob:useMobAbility(401)  -- Gliding Spike
	end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 446)
end
