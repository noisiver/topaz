-----------------------------------
-- Area: Riverne - Site B01
--  Mob: Unstable Cluster
-- 
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
	mob:setMod(tpz.mod.MAIN_DMG_RATING, 25)
	mob:addMod(tpz.mod.DEFP, 25) 
	mob:addMod(tpz.mod.ACC, 25) 
	mob:setMod(tpz.mod.DRAGON_KILLER, 25)
	mob:addStatusEffectEx(tpz.effect.BLAZE_SPIKES,0,25,0,0)
	mob:AnimationSub(0)
end

function onMobFight(mob)
    local animation = mob:AnimationSub()
    if animation == 0 then
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 100)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
    elseif animation == 2 then
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 100)
    else
        mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
        mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
    end
end


function onMobDeath(mob, player, isKiller)
end
