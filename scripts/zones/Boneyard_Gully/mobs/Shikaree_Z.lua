-----------------------------------
-- Area: Boneyard_Gully
-- Name: Shikaree Z
-----------------------------------
local ID = require("scripts/zones/Boneyard_Gully/IDs")
require("scripts/globals/status")
-----------------------------------

-- TODO: They skillchain with each other

function onMobInitialize(mob)
    mob:addMod(tpz.mod.DEFP, 100) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 15) 
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMod(tpz.mod.REFRESH, 40)
end

function onMobSpawn(mob)
    mob:setMod(tpz.mod.REGAIN, 150)
    mob:setLocalVar("regain", 150)
    mob:setLocalVar("chat", ID.text.HOW_IS_THIS_POSSIBLE)
end

function onMobEngaged(mob, target)
    mob:showText(mob, ID.text.WE_ARE_TRACKERS)
    SpawnMob(mob:getID() + 3)
    mob:setLocalVar("distracted", 0)
    mob:setMod(tpz.mod.REGAIN, 150)
end

function onMobWeaponSkill(target, mob, skill)
    mob:showText(mob, ID.text.TIME_TO_DIE)
end

function onMobDeath(mob, player, isKiller)
    mob:showText(mob, mob:getLocalVar("chat"))
	DespawnMob(GetMobByID(mob:getID()+1))
end