-----------------------------------
-- Area: Valley of Sorrows
--  Mob: Valley Manticore
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

--function onMobDeath(mob, player, isKiller)
  --  tpz.regime.checkRegime(player, mob, 140, 2, tpz.regime.type.FIELDS)
   -- tpz.regime.checkRegime(player, mob, 141, 2, tpz.regime.type.FIELDS)
   -- player:addItem(13120,1,514,0)
   -- player:messageSpecial( ID.text.ITEM_OBTAINED, 13120)
--end


function onMobDeath(mob, player, isKiller)
    local ID = zones[player:getZoneID()]
    tpz.regime.checkRegime(player, mob, 140, 2, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 141, 2, tpz.regime.type.FIELDS)
    if math.random(1,100) <= 24 then -- 24% chance
        player:addTreasure(13120,1,514,0)
        player:messageSpecial( ID.text.ITEM_OBTAINED, 13120)
    end
end