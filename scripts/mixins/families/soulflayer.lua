-- Soulflayer family mixin

require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.amphiptere = function(mob)
    mob:addListener("SPAWN", "SOULFLAYER_SPAWN", function(mob)
        mob:AnimationSub(0) -- No spiny shield
    end)
    mob:addListener("ROAM_TICK", "SOULFLAYER_ROAM", function(mob)
        if (mob:getMod(tpz.mod.MAGIC_SS) == 0) then
            mob:AnimationSub(0) -- No spinny shield
        else
            mob:AnimationSub(1) -- One spiny shield
        end
    end)
	mob:addListener("COMBAT_TICK", "SOULFLAYER_CTICK", function(mob)
        if (mob:getMod(tpz.mod.MAGIC_SS) == 0) then
            mob:AnimationSub(0) -- No spinny shield
        else
            mob:AnimationSub(1) -- One spiny shield
        end
	end)
end

return g_mixins.families.amphiptere
