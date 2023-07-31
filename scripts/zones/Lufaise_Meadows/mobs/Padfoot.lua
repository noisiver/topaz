-----------------------------------
-- Area: Lufaise Meadows
--   NM: Padfoot
-- !pos -43.689 0.487 -328.028 24
-- !pos 260.445 -1.761 -27.862 24
-- !pos 412.447 -0.057 -200.161 24
-- !pos -378.950 -15.742 144.215 24
-- !pos -141.523 -15.529 91.709 24
-----------------------------------
local ID = require("scripts/zones/Lufaise_Meadows/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    if mob:getID() == ID.mob.PADFOOT[GetServerVariable("realPadfoot")] then
        mob:setDropID(2911)
    else
        mob:setDropID(1972)
    end
	mob:setMod(tpz.mod.MAIN_DMG_RATING, 15)
	mob:setMod(tpz.mod.DEFP, 25) 
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
end

function onMobDeath(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    local mobId = mob:getID()

    if mobId == ID.mob.PADFOOT[GetServerVariable("realPadfoot")] then
        local respawn = math.random(36000, 43200) -- 21-24 hours

        for _, v in pairs(ID.mob.PADFOOT) do
            if v ~= mobId and GetMobByID(v):isSpawned() then
                DespawnMob(v)
            end
            GetMobByID(v):setRespawnTime(respawn)
        end

        SetServerVariable("realPadfoot", math.random(1, 5))
    end
end
