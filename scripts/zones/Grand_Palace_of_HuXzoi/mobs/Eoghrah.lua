-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--  Mob: Eo'ghrah
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    -- Set core Skin and mob elemental resist/weakness; other elements set to 0.
    -- Set to non aggro.
    mob:AnimationSub(0)
    mob:setAggressive(0)
    mob:setLocalVar("roamTime", os.time())
    mob:setLocalVar("form2", math.random(1, 3))
    local skin = math.random(1161, 1168)
    mob:setModelId(skin)
    if (skin == 1161) then -- Fire
        mob:setMod(tpz.mod.SDT_FIRE, 5)
        mob:setMod(tpz.mod.SDT_ICE, 5)
        mob:setMod(tpz.mod.SDT_WATER, 0150)
    elseif (skin == 1162) then --Ice
        mob:setMod(tpz.mod.SDT_ICE, 5)
        mob:setMod(tpz.mod.SDT_WIND, 5)
        mob:setMod(tpz.mod.SDT_FIRE, 0150)
    elseif (skin == 1163) then -- Wind
        mob:setMod(tpz.mod.SDT_WIND, 5)
        mob:setMod(tpz.mod.SDT_EARTH, 5)
        mob:setMod(tpz.mod.SDT_ICE, 0150)
    elseif (skin == 1164) then --Earth
        mob:setMod(tpz.mod.SDT_EARTH, 5)
        mob:setMod(tpz.mod.SDT_THUNDER, 5)
        mob:setMod(tpz.mod.SDT_WIND, 0150)
    elseif (skin == 1165) then --Thunder
        mob:setMod(tpz.mod.SDT_THUNDER, 5)
        mob:setMod(tpz.mod.SDT_WATER, 5)
        mob:setMod(tpz.mod.SDT_EARTH, 0150)
    elseif (skin == 1166) then -- Water
        mob:setMod(tpz.mod.SDT_WATER, 5)
        mob:setMod(tpz.mod.SDT_FIRE, 5)
        mob:setMod(tpz.mod.SDT_THUNDER, 0150)
    elseif (skin == 1167) then --Light
        mob:setMod(tpz.mod.SDT_LIGHT, 5)
        mob:setMod(tpz.mod.SDT_DARK, 0150)
    elseif (skin == 1168) then --Dark
        mob:setMod(tpz.mod.SDT_DARK, 5)
        mob:setMod(tpz.mod.SDT_LIGHT, 0150)
    end
end

function onMobRoam(mob)
    local roamTime = mob:getLocalVar("roamTime")
    if (mob:AnimationSub() == 0 and os.time() - roamTime > 60) then
        mob:AnimationSub(mob:getLocalVar("form2"))
        mob:setLocalVar("roamTime", os.time())
        mob:setAggressive(1)
    elseif (mob:AnimationSub() == mob:getLocalVar("form2") and os.time() - roamTime > 60) then
        mob:AnimationSub(0)
        mob:setAggressive(0)
        mob:setLocalVar("roamTime", os.time())
    end
end

function onMobFight(mob, target)

    local changeTime = mob:getLocalVar("changeTime")

    if (mob:AnimationSub() == 0 and mob:getBattleTime() - changeTime > 60) then
        mob:AnimationSub(mob:getLocalVar("form2"))
        mob:setAggressive(1)
        mob:setLocalVar("changeTime", mob:getBattleTime())
    elseif (mob:AnimationSub() == mob:getLocalVar("form2") and mob:getBattleTime() - changeTime > 60) then
        mob:AnimationSub(0)
        mob:setAggressive(0)
        mob:setLocalVar("changeTime", mob:getBattleTime())
    end
end

function onMobDeath(mob, player, isKiller)
end
