-----------------------------------
--  PET: Jugs
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/ability")
require("scripts/globals/msg")
require("scripts/globals/monstertpmoves")
-----------------------------------

function onMobSpawn(mob)
    if mob:getPool() == 4638 then -- Dapper Mac (Apkallu)
        local power = 45 + mob:getMod(tpz.mod.COUNTERSTANCE_EFFECT)
        mob:addStatusEffect(tpz.effect.COUNTERSTANCE, power, 0, 0)
    end
end

function onMobDeath(mob, player)
end