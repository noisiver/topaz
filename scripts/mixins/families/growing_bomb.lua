-- Growing Bomb(Big Bomb etc) family mixin

require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.growing_bomb = function(mob)
    mob:addListener("TAKE_DAMAGE", "GROWING_BOMB_TAKE_DAMAGE", function(mob, amount, attacker, attackType, damageType)
		local animationSub = mob:AnimationSub()
		if amount > 500 then
			if animationSub == 0 then
				mob:AnimationSub(1)
			elseif animationSub == 1 then
				mob:AnimationSub(2)
			elseif animationSub == 2 then
				mob:AnimationSub(3)
			elseif animationSub == 3 then
				mob:AnimationSub(4)
			end
		end
    end)
end

return g_mixins.families.growing_bomb
