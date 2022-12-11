-- Ghrah family mixin

require("scripts/globals/magic")
require("scripts/globals/mixins")
require("scripts/globals/utils")
require("scripts/globals/status")
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
            mob:setSpellList(192)
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
        if (mob:AnimationSub() == 0 and os.time() - roamTime > 45) then
            mob:AnimationSub(mob:getLocalVar("form2"))
            mob:setAggressive(1)
            SetJob(mob)
            SetSDT(mob)
            SetCasting(mob)
            mob:setLocalVar("roamTime", os.time())
        elseif (mob:AnimationSub() == mob:getLocalVar("form2") and os.time() - roamTime > 45) then
            mob:AnimationSub(0)
            mob:setAggressive(0)
            SetJob(mob)
            SetSDT(mob)
            SetCasting(mob)
            mob:setLocalVar("roamTime", os.time())
        end
    end)

    mob:addListener("ENGAGE", "GHRAH_ENGAGE", function(mob, target)
        mob:setLocalVar("changeTime", math.random(15, 45))
    end)

    mob:addListener("COMBAT_TICK", "GHRAH_CTICK", function(mob)
        local changeTime = mob:getLocalVar("changeTime")

        if (mob:AnimationSub() == 0 and mob:getBattleTime() >= changeTime) then
            mob:AnimationSub(mob:getLocalVar("form2"))
            mob:setAggressive(1)
            SetJob(mob)
            SetSDT(mob)
            SetCasting(mob)
            SetClusterDrops(mob)
            mob:setLocalVar("changeTime", mob:getBattleTime() + math.random(15, 45))
        elseif (mob:AnimationSub() == mob:getLocalVar("form2") and mob:getBattleTime() >= changeTime) then
            mob:AnimationSub(0)
            mob:setAggressive(0)
            SetJob(mob)
            SetSDT(mob)
            SetCasting(mob)
            SetClusterDrops(mob)
            mob:setLocalVar("changeTime", mob:getBattleTime() + math.random(15, 45))
        end
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

function SetJob(mob)
    -- Humanoid does not cast
    if mob:AnimationSub() == 0 then
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
        DelDefenseBonus(mob)
        DelEvasionBonus(mob)
    elseif mob:AnimationSub() == 1 then  -- human form gives defense bonus equal to paladin of that level AND 100% defense modifier
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
        AddDefenseBonus(mob, 120)
        DelEvasionBonus(mob)
    elseif mob:AnimationSub() == 2 then  -- spider form gives defense bonus equal to warrior of that level
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
        DelDefenseBonus(mob)
        AddDefenseBonus(mob, 10)
        DelEvasionBonus(mob)
    elseif mob:AnimationSub() == 3 then  -- Bird form grants evasion and triple attack equal to appropriate level thief
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 15)
        DelDefenseBonus(mob)
        AddEvasionBonus(mob)
    end
end

function AddDefenseBonus(mob, amount)
    if mob:getLocalVar("defBonus") == 0 then
        mob:setLocalVar("defBonus", amount)
        mob:addMod(tpz.mod.DEFP, amount)
    end
end

function DelDefenseBonus(mob)
    local defBonus = mob:getLocalVar("defBonus")
    if mob:getLocalVar("defBonus") > 0 then
        mob:delMod(tpz.mod.DEFP, defBonus)
        mob:setLocalVar("defBonus", 0)
    end
end

function AddEvasionBonus(mob)
    if mob:getLocalVar("evaBonus") == 0 then
        mob:setLocalVar("evaBonus", 1)
        mob:addMod(tpz.mod.EVA, 48)
    end
end

function DelEvasionBonus(mob)
    if mob:getLocalVar("evaBonus") == 1 then
        mob:setLocalVar("evaBonus", 0)
        mob:delMod(tpz.mod.EVA, 48)
    end
end

function SetSDT(mob)
    local element = mob:getLocalVar("element")
    if element == 1 then -- Fire
        mob:setMod(tpz.mod.SDT_FIRE, 5)
        mob:setMod(tpz.mod.SDT_ICE, 5)
        mob:setMod(tpz.mod.SDT_WATER, 150)
    elseif element == 2 then --Ice
        mob:setMod(tpz.mod.SDT_ICE, 5)
        mob:setMod(tpz.mod.SDT_WIND, 5)
        mob:setMod(tpz.mod.SDT_FIRE, 150)
    elseif element == 3 then -- Wind
        mob:setMod(tpz.mod.SDT_WIND, 5)
        mob:setMod(tpz.mod.SDT_ICE, 150)
        mob:setMod(tpz.mod.SDT_EARTH, 5)
    elseif element == 4 then --Earth
        mob:setMod(tpz.mod.SDT_EARTH, 5)
        mob:setMod(tpz.mod.SDT_THUNDER, 5)
        mob:setMod(tpz.mod.SDT_WIND, 150)
    elseif element == 5 then --Lightning
        mob:setMod(tpz.mod.SDT_THUNDER, 5)
        mob:setMod(tpz.mod.SDT_WATER, 5)
        mob:setMod(tpz.mod.SDT_EARTH, 150)
    elseif element == 6 then -- Water
        mob:setMod(tpz.mod.SDT_WATER, 5)
        mob:setMod(tpz.mod.SDT_THUNDER, 150)
        mob:setMod(tpz.mod.SDT_FIRE, 5)
    elseif element == 7 then --Light
        mob:setMod(tpz.mod.SDT_LIGHT, 5)
        mob:setMod(tpz.mod.SDT_DARK, 150)
    elseif element == 8 then --Dark
        mob:setMod(tpz.mod.SDT_DARK, 5)
        mob:setMod(tpz.mod.SDT_LIGHT, 150)
    end
end

function SetClusterDrops(mob)
    local element_drop = 
    {
        [tpz.magic.ele.FIRE] = 4104,
        [tpz.magic.ele.ICE] = 4105,
        [tpz.magic.ele.WIND] = 4106,
        [tpz.magic.ele.EARTH] = 4107,
        [tpz.magic.ele.LIGHTNING] = 4108,
        [tpz.magic.ele.WATER] = 4109,
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
