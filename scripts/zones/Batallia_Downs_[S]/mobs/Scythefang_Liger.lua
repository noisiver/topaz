-----------------------------------
--   Area: Batallia Downs [S]
--   ANNM
--   NM: Scythefang Liger
--  !addkeyitem RED_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
-----------------------------------
local tpMoves = {271, 273, 1680, 1681, 2207}

function onMobSpawn(mob)
    tpz.annm.NMMods(mob) 
end

function onMobFight(mob, target)
    tpz.annm.PetShield(mob, 17121699, 17121704)
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 270 then -- Uses Roar 10 times in a row then a random TP move
        local tpMove = mob:getLocalVar("tpMove")

        tpMove = tpMove +1 -- Count number of times TP move was used
        mob:setLocalVar("tpMove", tpMove)

        if (tpMove > 9) then -- Number of times using Roar
            mob:useMobAbility(tpMoves[math.random(#tpMoves)])
            mob:setLocalVar("tpMove", 0)
        else
            mob:useMobAbility(270) -- Re-use same TP move
        end
    end
end


function onMobDeath(mob, player, isKiller)
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
