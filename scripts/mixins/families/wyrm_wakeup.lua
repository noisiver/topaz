require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.wyrm_wakeup = function(mob)
    mob:addListener("COMBAT_TICK", "WYRM_CTICK", function(mob)
        if mob:AnimationSub() == 1 then
            mob:wakeUp()
			mob:delStatusEffect(tpz.effect.SLEEP_I)
			mob:delStatusEffect(tpz.effect.SLEEP_II)
			mob:delStatusEffect(tpz.effect.LULLABY)
        end
    end)
end

return g_mixins.families.wyrm_wakeup
