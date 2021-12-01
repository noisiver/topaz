-----------------------------------
-- Area: Riverne - Site B01
--   NM: Boroka
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobSpawn(mob)
	 mob:setMod(tpz.mod.MAIN_DMG_RATING, 25)
     mob:addMod(tpz.mod.DEFP, 25) 
     mob:addMod(tpz.mod.ACC, 25) 
     mob:setMod(tpz.mod.UFASTCAST, 50) 
     tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.SOUL_VOICE, cooldown = 45, hpp = 100},
        },
     })
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 576 or skill:getID() == 578 or skill:getID() == 579 or skill:getID() == 580 or skill:getID() == 2828 then -- Jettatura
		mob:useMobAbility(1330)  -- Hoof Volley
	end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.BOROKA_BELEAGUERER)
    mob:setRespawnTime(math.random(36000, 43200)) -- 11-12 hour respawn
end
