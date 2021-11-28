-----------------------------------
-- Area: Boneyard_Gully
-- Name: Shikaree Y
-----------------------------------
local ID = require("scripts/zones/Boneyard_Gully/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(tpz.mod.DEFP, 100) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 15) 
    mob:addMod(tpz.mod.EVA, 15)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:setMod(tpz.mod.COUNTER, 10)
end

function onMobSpawn(mob)
    mob:setLocalVar("regain", 200)
    mob:setLocalVar("chat", ID.text.CANT_HAVE_LOST)
end

function onMobEngaged(mob, target)
    mob:setLocalVar("distracted", 0)
    mob:setMod(tpz.mod.REGAIN, 200)
end

-- TODO: advanced WS logic and dialog
function onMobWeaponSkill(target, mob, skill)
    mob:showText(mob, ID.text.MASSACRRRE_BEGIN)
end

function onMobDeath(mob, player, isKiller)
    mob:showText(mob, mob:getLocalVar("chat"))
end