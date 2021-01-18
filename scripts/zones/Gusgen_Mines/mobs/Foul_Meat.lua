-----------------------------------
-- Area: Gusgen Mines
--  Mob: Foul Meat
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local ID = zones[player:getZoneID()]
    if isKiller and math.random(1,100) <= 24 then -- 24% chance
        player:addItem(13120,1,514,4)
        player:messageSpecial( ID.text.ITEM_OBTAINED, 13120)
    end
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(64800, 86400)) -- 18 to 24 hours
end
