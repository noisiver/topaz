-----------------------------------
-- Area: Bearclaw Pinnacle
-- Name: Snoll Tzar
-----------------------------------
local ID = require("scripts/zones/Bearclaw_Pinnacle/IDs")
require("scripts/globals/titles");
require("scripts/globals/status");
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:setLocalVar("salted", 1)
    mob:AnimationSub(1)
end

function onMobEngaged(mob)
    mob:setLocalVar("salted", 0)
    mob:setLocalVar("shifttime", 15)
end

function onMobFight(mob)
    local size = mob:AnimationSub()
    local shifttime = mob:getLocalVar("shifttime")
    if mob:getBattleTime() > shifttime then
        if size == 3 then
            mob:useMobAbility(1644)
        else
            mob:setLocalVar("shifttime", shifttime + 15)
            mob:AnimationSub(size + 1)
            mob:addMod(tpz.mod.ATT, 25)
        end
    end
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 1644 then
        mob:setLocalVar('suicide', 1)
        mob:showText(mob, ID.text.THE_EXPLOSION)
    end
end

function onMobDeath(mob, player, isKiller)
    if mob:getLocalVar('suicide') == 1 then
        mob:getBattlefield():lose()
    else
        mob:getBattlefield():win()
    end
end

