require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

function close_form(mob)
    mob:setMobMod(tpz.mobMod.LINK_RADIUS, 11)
    mob:setMod(tpz.mod.DMGPHYS, 0)
    mob:setMod(tpz.mod.DMGRANGE, 0)
    mob:setMod(tpz.mod.DMGMAGIC, 0)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 0)
    mob:addMobMod(tpz.mobMod.ROAM_DISTANCE, 5)
    mob:addMobMod(tpz.mobMod.ROAM_COOL, 30)
    mob:setLocalVar("damageThreshold", 0)
    mob:AnimationSub(1)
end

function open_form(mob)
    mob:AnimationSub(6)
    mob:delMobMod(tpz.mobMod.ROAM_DISTANCE, 5)
    mob:delMobMod(tpz.mobMod.ROAM_COOL, 30)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 1)
    mob:setMobMod(tpz.mobMod.LINK_RADIUS, 0)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 11)
    mob:setMod(tpz.mod.DMGPHYS, 50)
    mob:setMod(tpz.mod.DMGRANGE, 50)
    mob:setMod(tpz.mod.DMGMAGIC, 50)
    mob:setLocalVar("damageThreshold", math.random(5, 15) / 100 * mob:getMaxHP())
end

g_mixins.families.euvhi = function(mob)

    mob:addListener("AFTER_SPAWN", "EUVHI_SPAWN", function(mob)
        if mob:AnimationSub() == 4 then
            close_form(mob)    
        else
            open_form(mob)
        end
    end)

    mob:addListener("ENGAGE", "EUVHI_ENGAGE", function(mob, target)
    mob:setLocalVar("changeTime", os.time() + math.random(50, 80))
        if mob:AnimationSub() == 4 then
            mob:AnimationSub(1)
        end
    end)

    mob:addListener("DISENGAGE", "EUVHI_DISENGAGE", function(mob)
        if mob:AnimationSub() == 1 then
            mob:AnimationSub(4)
        end
    end)

    mob:addListener("CRITICAL_TAKE", "EUVHI_CRITICAL_TAKE", function(mob)
        close_form(mob)
        mob:setLocalVar("changeTime", os.time() + math.random(50, 80))
    end)


    mob:addListener("COMBAT_TICK", "EUVHI_CTICK", function(mob)
        local changeTime = mob:getLocalVar("changeTime")
        -- Open if time expired, does not go back to closed unless it is crit hit 
        if os.time() >= changeTime and mob:getCurrentAction() == tpz.act.ATTACK then
            if mob:AnimationSub() == 1 then
                open_form(mob)
            end
        end
    end)

end

return g_mixins.families.euvhi
