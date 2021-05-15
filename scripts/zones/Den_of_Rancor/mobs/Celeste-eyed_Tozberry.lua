-----------------------------------
-- Area: Den of Rancor
--   NM: Celeste-eyed Tozberry
-----------------------------------
require("scripts/globals/hunts")
mixins =
{
    require("scripts/mixins/families/tonberry"),
}
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 35)
    mob:addMod(tpz.mod.ACC, 25) 
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMod(tpz.mod.UFASTCAST, 50)
    mob:setMod(tpz.mod.SILENCERESTRAIT, 50)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 20000)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobFight(mob, target)
    local hitTrigger = mob:getLocalVar("TriggerHit")

    if mob:getHPP() <= 50 and hitTrigger  < 7 then
        mob:useMobAbility(731) -- Mijin Gakure
        mob:setHPP(100)
        hitTrigger = hitTrigger +1
        mob:setLocalVar("TriggerHit", hitTrigger)
    end
end


function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 395)
end
