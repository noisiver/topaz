-- Growing Bomb(Big Bomb etc) family mixin

require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.growing_bomb = function(mob)
    mob:addListener("SPAWN", "GROWING_BOMB_SPAWN", function(mob)
		mob:AnimationSub(0)
    end)
    mob:addListener("TAKE_DAMAGE", "GROWING_BOMB_TAKE_DAMAGE", function(mob, amount, attacker, attackType, damageType)
		local animationSub = mob:AnimationSub()
		if amount > 500 then
			if animationSub == 0 then
				mob:AnimationSub(1)
				mob:setDamage(150)
				mob:setMod(tpz.mod.UFASTCAST, 12)
				mob:setMod(tpz.mod.MATT, 60)
			elseif animationSub == 1 then
				mob:AnimationSub(2)
				mob:setDamage(250)
				mob:setMod(tpz.mod.UFASTCAST, 25)
				mob:setMod(tpz.mod.MATT, 75)
			elseif animationSub == 2 then
				mob:AnimationSub(3)
				mob:setDamage(300)
				mob:setMod(tpz.mod.UFASTCAST, 50)
				mob:setMod(tpz.mod.MATT, 100)
			end
		end
    end)
end

return g_mixins.families.growing_bomb
