------------------------------
-- Area: Mount Zhayolm
--   NM: Fahrafahr the Bloodied
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/wotg")
------------------------------
function onMobSpawn(mob)
	mob:setDamage(250) -- 350-450 on DD's
    mob:addMod(tpz.mod.DEFP, 25) 
end

function onMobWeaponSkillPrepare(mob, target)
    -- Only uses Drop Hammer
    return 2083
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 458)
    tpz.wotg.MagianT1(mob, player, isKiller)
end
