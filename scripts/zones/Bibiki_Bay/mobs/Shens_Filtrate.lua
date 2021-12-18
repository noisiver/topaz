-----------------------------------
-- Area: Bibiki Bay
--  MOB: Shen's Filtrate
-----------------------------------
local ID = require("scripts/zones/Bibiki_Bay/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    local targid = GetMobByID(ID.mob.SHEN):getTargID()
    mob:setMobMod(tpz.mobMod.SHARE_TARGET, targid)
end

function onMobSpawn(mob)
    local targid = GetMobByID(ID.mob.SHEN):getTargID()
    mob:setMobMod(tpz.mobMod.SHARE_TARGET, targid)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setLocalVar('respawnTime', os.time()+15)
end

function onMonsterMagicPrepare(mob,target)
    -- casts Water IV, Waterga III, Flood, Drown
    local rnd = math.random();

    if (rnd < 0.5) then
        return 201; -- waterga 3
    elseif (rnd < 0.7) then
        return 172; -- water 4
    elseif (rnd < 0.9) then
        return 214; -- flood
    else
        return 240; -- drown
    end

end;
