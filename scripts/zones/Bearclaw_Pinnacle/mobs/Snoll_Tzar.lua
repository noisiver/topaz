-----------------------------------
-- Area: Bearclaw Pinnacle
-- Name: Snoll Tzar
-----------------------------------
local ID = require("scripts/zones/Bearclaw_Pinnacle/IDs")
require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/player")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(150)
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:setMod(tpz.mod.REFRESH, 40)
    mob:AnimationSub(4) -- starting animationSub
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 30)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobEngaged(mob, target)   
end

function onMobFight(mob, player, target)
    local changeTime = mob:getLocalVar("changeTime")
    local delay = mob:getLocalVar("delayed")
    local cd = mob:getLocalVar("cooldown")
    local salty = mob:getLocalVar("salty")
    local melting = mob:getLocalVar("melt")

    -- handle salt usage
    if melting == 1 then
        mob:showText(mob, ID.text.BEGINS_TO_MELT)
        mob:setLocalVar("melt", 0)
    end   
    
    -- handle salt cooldown 
    if (cd < os.time() and salty == 1) then
        mob:showText(mob, ID.text.SHOOK_SALT)
        mob:setLocalVar("salty", 0)
    end

    -- big
    if (delay < os.time() and mob:AnimationSub() == 4 and mob:getBattleTime() - changeTime > 11) then
        mob:setLocalVar("delayed", 0)
        mob:AnimationSub(5) 
        mob:setLocalVar("changeTime", mob:getBattleTime())
        mob:setDamage(200)
    -- bigger  
    elseif (delay < os.time() and mob:AnimationSub() == 5 and mob:getBattleTime() - changeTime > 11) then
        mob:showText(mob, ID.text.LARGE_STEAM) -- approx. midway point - give warning
        mob:setLocalVar("delayed", 0)
        mob:AnimationSub(6)
        mob:setLocalVar("changeTime", mob:getBattleTime())
        mob:setDamage(250)

    -- biggest
    elseif (delay < os.time() and mob:AnimationSub() == 6 and mob:getBattleTime() - changeTime > 11) then
        mob:setLocalVar("delayed", 0)
        mob:AnimationSub(7)
        mob:setLocalVar("changeTime", mob:getBattleTime())
        mob:setDamage(300)
    -- self-destruct   
    elseif (delay < os.time() and mob:AnimationSub() == 7 and mob:getBattleTime() - changeTime > 12) then
        mob:useMobAbility(1644)
        mob:setLocalVar("changeTime", mob:getBattleTime())
        mob:setLocalVar("gameover", 1)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    local bf = mob:getBattlefield() 
    local changeTime = mob:getLocalVar("changeTime")
    local gameOver = mob:getLocalVar("gameover")

    -- end BCNM  
    if (gameOver == 1 and mob:getBattleTime() - changeTime > 3) then 
        mob:AnimationSub(4)   
        bf:lose()
        return
    end
end


