-----------------------------------
-- Area: Fei'Yin
--  NM: Mind Hoarder
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.TRPLE_ATTACK, 10)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMod(tpz.mod.SLEEPRES, 100)
    mob:setMod(tpz.mod.LULLABYRES, 100)
     mob:setMod(tpz.mod.DELAY, -30)
   end

  function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end


function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.HP_DRAIN, {chance = 100, power = math.random(50, 70)})
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 347)

    -- Curses, Foiled A-Golem!?
    if (player:hasKeyItem(tpz.ki.SHANTOTTOS_NEW_SPELL)) then
        player:delKeyItem(tpz.ki.SHANTOTTOS_NEW_SPELL)
        player:addKeyItem(tpz.ki.SHANTOTTOS_EXSPELL)
    end

end
