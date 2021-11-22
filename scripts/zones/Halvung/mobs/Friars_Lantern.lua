------------------------------
-- Area: Halvung
--   Mob: Friar's Latern
-- Grows in sizel ike Big Bomb
------------------------------
mixins = {require("scripts/mixins/families/growing_bomb")}
------------------------------
function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 45)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobDeath(mob, player, isKiller)
end
