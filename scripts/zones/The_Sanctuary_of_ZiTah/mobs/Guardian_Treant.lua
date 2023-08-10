-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--   NM: Guardian Treant
-- Involved in Quest: Forge Your Destiny
-----------------------------------

function onMobDeath(mob, player, isKiller, noKiller)
    player:setCharVar("ForgeYourDestiny_killed", 1)
end
