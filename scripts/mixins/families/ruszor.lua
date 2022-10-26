require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

-- AnimationSub for Ruszor
-- 0 = Nothing
-- 1 = Icy Mist (Ice Absorb)
-- 2 = Bubbles (Water Absorb)

g_mixins.families.ruszor = function(mob)
    
	mob:addListener("SPAWN", "RUSZOR_SPAWN", function(mob)
		mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
        mob:AnimationSub(0)
    end)
	mob:addListener("TICK", "RUSZOR_TICK", function(mob)
        local icyMistBuff = mob:getLocalVar("icyMist")
        local bubblesBuff = mob:getLocalVar("bubbles")
        local animationSub = mob:AnimationSub()
        -- Go back to animation sub 0 when buff timer ends for buffs
        if (os.time() > icyMistBuff) and (os.time() > bubblesBuff) then
            mob:AnimationSub(0)
        end
        -- Gain's Ice Or Water absorb depending on current buff from using Frozen Mist / Hydro Wave
        if (animationSub == 1) then
            mob:setMod(tpz.mod.ICE_ABSORB, 100)
            mob:setMod(tpz.mod.WATER_ABSORB, 0)
        elseif (animationSub == 2) then
            mob:setMod(tpz.mod.WATER_ABSORB, 100)
            mob:setMod(tpz.mod.ICE_ABSORB, 0)
        else
            mob:setMod(tpz.mod.ICE_ABSORB, 0)
            mob:setMod(tpz.mod.WATER_ABSORB, 0)
        end
    end)

end

return g_mixins.families.ruszor
