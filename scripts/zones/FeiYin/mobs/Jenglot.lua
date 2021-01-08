-----------------------------------
-- Area: Fei'Yin
--   NM: Jenglot
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.SILENCERES, 75)
    mob:setMod(tpz.mod.SLEEPRES, 75)
    mob:setMod(tpz.mod.GRAVITYRES, 75)
    end
function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 348)
    -- Curses, Foiled A-Golem!?
    if (player:hasKeyItem(tpz.ki.SHANTOTTOS_NEW_SPELL)) then
        player:delKeyItem(tpz.ki.SHANTOTTOS_NEW_SPELL)
        player:addKeyItem(tpz.ki.SHANTOTTOS_EXSPELL)
    end
end
