-----------------------------------
-- Area: Boneyard_Gully
-- Name: Shikaree X
-----------------------------------
local ID = require("scripts/zones/Boneyard_Gully/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.DUAL_WIELD, 1)
    mob:addMod(tpz.mod.DEFP, 100) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 15) 
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMod(tpz.mod.REFRESH, 40)
end

function onMobSpawn(mob)
    mob:setMod(tpz.mod.REGAIN, 175)
    mob:setLocalVar("regain", 175)
    mob:setLocalVar("chat", ID.text.DEFEATED)
end

function onMobEngaged(mob, target)
    SpawnMob(mob:getID() + 2)
    mob:setLocalVar("distracted", 0)
    mob:setMod(tpz.mod.REGAIN, 175)
end

function onMobWeaponSkill(target, mob, skill)
    mob:showText(mob, ID.text.MY_TURN_MY_TURN)
end

function onMobDeath(mob, player, isKiller)
    mob:showText(mob, mob:getLocalVar("chat"))
	DespawnMob(GetMobByID(mob:getID()+1))
end