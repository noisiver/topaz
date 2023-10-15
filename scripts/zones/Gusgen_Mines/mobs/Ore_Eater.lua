-----------------------------------
-- Area: Gusgen Mines
--  Mob: Ore Eater
-----------------------------------
require("scripts/globals/regimes")
mixins = {require("scripts/mixins/families/worm")}
-----------------------------------

function onMobSpawn(mob)
    mob:addListener("COMBAT_TICK", "WORM_CTICK", function(mob)
        local targ = mob:getTarget()
        if targ then
            if mob:checkDistance(targ) <= 5 then
               mob:SetMagicCastingEnabled(false)
            else 
                mob:SetMagicCastingEnabled(true)                        
            end
         end 
    end)
end


function onMobEngaged(mob, target)
    mob:addListener("COMBAT_TICK", "WORM_CTICK", function(mob)
        local targ = mob:getTarget()
        if targ then
            if mob:checkDistance(targ) <= 5 then
               mob:SetMagicCastingEnabled(false)
            else 
                mob:SetMagicCastingEnabled(true)                        
            end
         end 
    end)
end

function onMobRoam(mob)
    mob:addListener("COMBAT_TICK", "WORM_CTICK", function(mob)
        local targ = mob:getTarget()
        if targ then
            if mob:checkDistance(targ) <= 5 then
               mob:SetMagicCastingEnabled(false)
            else 
                mob:SetMagicCastingEnabled(true)                        
            end
         end 
    end)
end

function onMobFight(mob, target, pet)
    mob:addListener("COMBAT_TICK", "WORM_CTICK", function(mob)
        local targ = mob:getTarget()
        if targ then
            if mob:checkDistance(targ) <= 5 then
               mob:SetMagicCastingEnabled(false)
            else 
                mob:SetMagicCastingEnabled(true)                        
            end
         end 
    end)
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.regime.checkRegime(player, mob, 681, 1, tpz.regime.type.GROUNDS)
end
