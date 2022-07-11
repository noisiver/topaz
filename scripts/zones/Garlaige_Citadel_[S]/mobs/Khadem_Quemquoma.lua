-----------------------------------
-- Area: Garlaige Citadel [S]
--   ANNM
--   NM: Khadem Quemquoma
--  !addkeyitem GREEN_LABELED_CRATE
-----------------------------------
require("scripts/globals/annm")
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    tpz.annm.NMMods(mob) 
end

function onMobFight(mob, target)
    -- After using Poisonga II, he will use Hell Scissors 3 times in a row
    mob:addListener("MAGIC_STATE_EXIT", "KHADEM_MAGIC_STATE_EXIT", function(mob, spell)
        mob:useMobAbility(2221) -- Hell Scissors
    end)
    tpz.annm.PetShield(mob, 17449033, 17449038)
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 2221 then -- Uses hell Scissors 3 times in a row
        local tpMove = mob:getLocalVar("tpMove")

        tpMove = tpMove +1 -- Count number of times TP move was used
        mob:setLocalVar("tpMove", tpMove)

        if (tpMove > 1) then -- Use 3 times
            mob:setLocalVar("tpMove", 0)
        else
            mob:useMobAbility(2221) -- Re-use same TP move
        end
    end
end

function onMobDeath(mob, player, isKiller)
    tpz.annm.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
