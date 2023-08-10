-----------------------------------
-- Area: Riverne - Site B01
--  Mob: Unstable Cluster
-- 
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setDamage(70)
	mob:addMod(tpz.mod.ACC, 25) 
	mob:setMod(tpz.mod.DRAGON_KILLER, 25)
	mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 15, 0, 7200)
	mob:AnimationSub(0)
end

function onMobFight(mob)
    local animation = mob:AnimationSub()
    if animation == 0 then
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 50)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
    elseif animation == 2 then
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 50)
    else
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
    end

	if not mob:hasStatusEffect(tpz.effect.BLAZE_SPIKES) then
		mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 15, 0, 7200)
	end
end


function onMobDeath(mob, player, isKiller, noKiller)
end
