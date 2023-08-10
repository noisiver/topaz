------------------------------
-- Area: Lufaise Meadows
--   NM: Flockbock
------------------------------
mixins ={require("scripts/mixins/rage")}
require("scripts/globals/hunts")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(150)
	mob:setMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
	mob:setMod(tpz.mod.MOVE, 12)
	mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 269 then -- Petribreath
        mob:resetEnmity(target)        
    end
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 442)
end
