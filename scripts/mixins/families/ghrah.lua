-- Ghrah family mixin

require("scripts/globals/magic")
require("scripts/globals/mixins")
require("scripts/globals/utils")
require("scripts/globals/status")
	--TODO: Item drops
g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.ghrah = function(mob)
    mob:addListener("SPAWN", "GHRAH_SPAWN", function(mob)
        -- Set core skin and mob elemental resist/weakness other elements set to 0.
        -- Set to non aggro.
        mob:AnimationSub(0)
        mob:setAggressive(0)
        mob:setLocalVar("changeTime", os.time())
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
            mob:setLocalVar("element", tpz.magic.ele.FIRE)
        elseif skin == 1164 then --Earth
            mob:setMod(tpz.mod.SDT_THUNDER, 5)
            mob:setMod(tpz.mod.SDT_WIND, 150)
            mob:setLocalVar("element", tpz.magic.ele.EARTH)
        elseif skin == 1162 then -- Water
            mob:setMod(tpz.mod.SDT_THUNDER, 150)
            mob:setMod(tpz.mod.SDT_FIRE, 5)
            mob:setLocalVar("element", tpz.magic.ele.WATER)
        elseif skin == 1163 then -- Wind
            mob:setMod(tpz.mod.SDT_ICE, 150)
            mob:setMod(tpz.mod.SDT_EARTH, 5)
            mob:setLocalVar("element", tpz.magic.ele.WIND)
        elseif skin == 1166 then --Ice
            mob:setMod(tpz.mod.SDT_WIND, 5)
            mob:setMod(tpz.mod.SDT_FIRE, 150)
            mob:setLocalVar("element", tpz.magic.ele.ICE)
        elseif skin == 1165 then --Lightning
            mob:setMod(tpz.mod.SDT_WATER, 5)
            mob:setMod(tpz.mod.SDT_EARTH, 150)
            mob:setLocalVar("element", tpz.magic.ele.LIGHTNING)
        elseif skin == 1167 then --Light
            mob:setMod(tpz.mod.SDT_LIGHT, 5)
            mob:setMod(tpz.mod.SDT_DARK, 150)
            mob:setLocalVar("element", tpz.magic.ele.LIGHT)
        elseif skin == 1168 then --Dark
            mob:setMod(tpz.mod.SDT_DARK, 5)
            mob:setMod(tpz.mod.SDT_LIGHT, 150)
            mob:setLocalVar("element", tpz.magic.ele.DARK)
        end
    end)

    mob:addListener("ROAM_TICK", "GHRAH_RTICK", function(mob)
        local changeTime = mob:getLocalVar("changeTime")
        if mob:AnimationSub() == 0 and os.time() >= changeTime then
            mob:AnimationSub(mob:getLocalVar("form"))
            mob:setLocalVar("changeTime", os.time() + 60)
            mob:setAggressive(1)
        elseif mob:AnimationSub() == mob:getLocalVar("form") and os.time() > changeTime then
            mob:AnimationSub(0)
            mob:setAggressive(0)
            mob:setLocalVar("changeTime", os.time() + 60)
        end
    end)

    mob:addListener("COMBAT_TICK", "GHRAH_CTICK", function(mob)
        local changeTime = mob:getLocalVar("changeTime")
        if mob:getCurrentAction() == tpz.act.ATTACK and mob:AnimationSub() == 0 and os.time() >= changeTime then
            mob:AnimationSub(mob:getLocalVar("form"))
            mob:setAggressive(1)
            mob:setLocalVar("changeTime", os.time() + 60)
        elseif mob:getCurrentAction() == tpz.act.ATTACK and mob:AnimationSub() == mob:getLocalVar("form") and os.time() >= changeTime then
            mob:AnimationSub(0)
            mob:setAggressive(0)
            mob:setLocalVar("changeTime", os.time() + 60)
        end
    end)
	--TODO: Item drops
    -- mob:addListener("ITEM_DROPS", "GHRAH_ITEM_DROPS", function(mob)
        -- local element_drop = 
        -- {
            -- [tpz.magic.ele.FIRE] = 4104,
            -- [tpz.magic.ele.EARTH] = 4107,
            -- [tpz.magic.ele.WATER] = 4109,
            -- [tpz.magic.ele.WIND] = 4106,
            -- [tpz.magic.ele.ICE] = 4105,
            -- [tpz.magic.ele.LIGHTNING] = 4108,
            -- [tpz.magic.ele.LIGHT] = 4110,
            -- [tpz.magic.ele.DARK] = 4111,
        -- }
        -- mob:addDrop(element_drop[mob:getLocalVar("element")], tpz.drops.RARE)
    -- end)
end

return g_mixins.families.ghrah
