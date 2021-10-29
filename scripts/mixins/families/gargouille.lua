require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

-- AnimationSub for Gargouilles
-- 0 = grounded
-- 1 = flying
-- 2 = "Statue" stance

g_mixins.families.gargouille = function(mob)

    mob:addListener("SPAWN", "GARGOUILLES_SPAWN", function(mob)
        mob:setLocalVar("swapTime", os.time())
    end)

    mob:addListener("TICK", "GARGOUILLES_TICK", function(mob)
        local swapTime = mob:getLocalVar("swapTime")

        if swapTime > 0 and os.time() > swapTime then
            local animationSub = mob:AnimationSub()

            if animationSub == 0 or animationSub == 4 then
                mob:AnimationSub(1)
                mob:setLocalVar("swapTime", os.time() + 60)

            elseif animationSub == 1 then
                mob:AnimationSub(0)
                mob:setLocalVar("swapTime", os.time() + 60)
            end
        end
    end)

end

return g_mixins.families.gargouille
