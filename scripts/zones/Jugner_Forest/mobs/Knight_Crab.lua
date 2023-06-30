-----------------------------------
-- Area: Jugner Forest
--  Mob: Knight Crab
-----------------------------------
local ID = require("scripts/zones/Jugner_Forest/IDs")
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ALWAYS_AGGRO , 1)
end

function onMobDeath(mob, player, isKiller)
    local KingArthro = GetMobByID(ID.mob.KING_ARTHRO)
    local mobId = mob:getID()

    for v = 17203206, 17203215 do
        if GetMobByID(v) ~= GetMobByID(mobId) then
            if not GetMobByID(v):isDead() then
                return
            end
        end
    end

    SpawnMob(ID.mob.KING_ARTHRO)
end

function onMobDespawn(mob)
end
