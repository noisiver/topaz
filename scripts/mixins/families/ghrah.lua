-- Ghrah family mixin

require("scripts/globals/magic")
require("scripts/globals/mixins")
require("scripts/globals/utils")
require("scripts/globals/status")
	--TODO: Item drops
    -- 0:ball - 1:humanoid - 2:spider - 3:bird
g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.ghrah = function(mob)
    mob:addListener("SPAWN", "GHRAH_SPAWN", function(mob)
        -- Set core skin and mob elemental resist/weakness other elements set to 0.
        -- Set to non aggro.
        mob:AnimationSub(0)
        mob:setAggressive(0)
        mob:setLocalVar("changeTime", os.time())
        mob:setLocalVar("form2", math.random(1, 3))
        local skin = math.random(1161, 1168)
        mob:setModelId(skin)

        mob:setMod(tpz.mod.SDT_ICE, 0)
        mob:setMod(tpz.mod.SDT_WATER, 0)
        mob:setMod(tpz.mod.SDT_THUNDER, 0)
        mob:setMod(tpz.mod.SDT_WIND, 0)
        mob:setMod(tpz.mod.SDT_FIRE, 0)
        mob:setMod(tpz.mod.SDT_EARTH, 0)
        mob:setMod(tpz.mod.SDT_LIGHT, 0)
        mob:setMod(tpz.mod.SDT_DARK, 0)
        if skin == 1161 then -- Fire
            mob:setMod(tpz.mod.SDT_ICE, 5)
            mob:setMod(tpz.mod.SDT_WATER, 150)
            mob:setSpellList(188)
            mob:setLocalVar("element", tpz.magic.ele.FIRE)
        elseif skin == 1164 then --Earth
            mob:setMod(tpz.mod.SDT_THUNDER, 5)
            mob:setMod(tpz.mod.SDT_WIND, 150)
            mob:setSpellList(190)
            mob:setLocalVar("element", tpz.magic.ele.EARTH)
        elseif skin == 1162 then -- Water
            mob:setMod(tpz.mod.SDT_THUNDER, 150)
            mob:setMod(tpz.mod.SDT_FIRE, 5)
            mob:setSpellList(191)
            mob:setLocalVar("element", tpz.magic.ele.WATER)
        elseif skin == 1163 then -- Wind
            mob:setMod(tpz.mod.SDT_ICE, 150)
            mob:setMod(tpz.mod.SDT_EARTH, 5)
            mob:setSpellList(193)
            mob:setLocalVar("element", tpz.magic.ele.WIND)
        elseif skin == 1166 then --Ice
            mob:setMod(tpz.mod.SDT_WIND, 5)
            mob:setMod(tpz.mod.SDT_FIRE, 150)
            mob:setSpellList(189)
            mob:setLocalVar("element", tpz.magic.ele.ICE)
        elseif skin == 1165 then --Lightning
            mob:setMod(tpz.mod.SDT_WATER, 5)
            mob:setMod(tpz.mod.SDT_EARTH, 150)
            mob:setSpellList(191)
            mob:setLocalVar("element", tpz.magic.ele.LIGHTNING)
        elseif skin == 1167 then --Light
            mob:setMod(tpz.mod.SDT_LIGHT, 5)
            mob:setMod(tpz.mod.SDT_DARK, 150)
            mob:setSpellList(195)
            mob:setLocalVar("element", tpz.magic.ele.LIGHT)
        elseif skin == 1168 then --Dark
            mob:setMod(tpz.mod.SDT_DARK, 5)
            mob:setMod(tpz.mod.SDT_LIGHT, 150)
            mob:setSpellList(194)
            mob:setLocalVar("element", tpz.magic.ele.DARK)
        end
    end)

    mob:addListener("ROAM_TICK", "GHRAH_RTICK", function(mob)
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
        SetCasting(mob)
    end)

    mob:addListener("COMBAT_TICK", "GHRAH_CTICK", function(mob)
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
        SetCasting(mob)
        SetClusterDrops(mob)
    end)
end

function SetCasting(mob)
    -- Humanoid does not cast
    if mob:AnimationSub() == 1 then 
        mob:SetMagicCastingEnabled(false)
    else
        mob:SetMagicCastingEnabled(true)
    end
end

function SetClusterDrops(mob)
    local element_drop = 
    {
        [tpz.magic.ele.FIRE] = 4104,
        [tpz.magic.ele.EARTH] = 4107,
        [tpz.magic.ele.WATER] = 4109,
        [tpz.magic.ele.WIND] = 4106,
        [tpz.magic.ele.ICE] = 4105,
        [tpz.magic.ele.LIGHTNING] = 4108,
        [tpz.magic.ele.LIGHT] = 4110,
        [tpz.magic.ele.DARK] = 4111,
    }
    if mob:getPool() == 1241 then -- Eo'Ghrah
        for v = 4104, 4111 do
            SetDropRate(777, v, 0)
        end
        SetDropRate(777, element_drop[mob:getLocalVar("element")], 50)
    elseif mob:getPool() == 300 then -- Aw'Ghrah
        for v = 4104, 4111 do
            SetDropRate(200, v, 0)
        end
        SetDropRate(200, element_drop[mob:getLocalVar("element")], 50)
    end
end

return g_mixins.families.ghrah
