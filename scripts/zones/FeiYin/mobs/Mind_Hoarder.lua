-----------------------------------
-- Area: Fei'Yin
--  NM: Mind Hoarder
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.TRPLE_ATTACK, 10)
   end

  function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end


function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENDRAIN)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 347)

    -- Curses, Foiled A-Golem!?
    if (player:hasKeyItem(tpz.ki.SHANTOTTOS_NEW_SPELL)) then
        player:delKeyItem(tpz.ki.SHANTOTTOS_NEW_SPELL)
        player:addKeyItem(tpz.ki.SHANTOTTOS_EXSPELL)
    end

end
