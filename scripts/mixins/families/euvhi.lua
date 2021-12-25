require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

function close_form(mob)
    mob:setMobMod(tpz.mobMod.LINK_RADIUS, 11)
    mob:setMod(tpz.mod.DMG, -25) 
    mob:setMobMod(tpz.mobMod.NO_ROAM, 0)
    mob:addMobMod(tpz.mobMod.ROAM_DISTANCE, 5)
    mob:addMobMod(tpz.mobMod.ROAM_COOL, 30)
    mob:setLocalVar("damageThreshold", 0)
    mob:AnimationSub(0)
end

function open_form(mob)
    mob:delMobMod(tpz.mobMod.ROAM_DISTANCE, 5)
    mob:delMobMod(tpz.mobMod.ROAM_COOL, 30)
    mob:setMobMod(tpz.mobMod.NO_ROAM, 1)
    mob:setMobMod(tpz.mobMod.LINK_RADIUS, 0)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 11)
    mob:setMod(tpz.mod.DMG, 12.5) 
    mob:setLocalVar("damageThreshold", math.random(5, 15) / 100 * mob:getMaxHP())
    mob:AnimationSub(6)
end

g_mixins.families.euvhi = function(mob)

    mob:addListener("SPAWN", "EUVHI_SPAWN", function(mob)
        mob:AnimationSub(0)
    end)

    mob:addListener("ENGAGE", "EUVHI_ENGAGE", function(mob, target)
    mob:setLocalVar("changeTime", os.time() + math.random(50, 80))
        if mob:AnimationSub() == 6 then
            mob:AnimationSub(0)
        end
    end)

    mob:addListener("DISENGAGE", "EUVHI_DISENGAGE", function(mob)
        if mob:AnimationSub() == 0 then
            mob:AnimationSub(6)
        end
    end)


    mob:addListener("COMBAT_TICK", "EUVHI_CTICK", function(mob)
        local changeTime = mob:getLocalVar("changeTime")
        -- Open if time expired, does not go back to closed unless it is crit hit 
        if os.time() >= changeTime and mob:getCurrentAction() == tpz.act.ATTACK then
            if mob:AnimationSub() == 0 then
                open_form(mob)
            end
        end
    end)

end

return g_mixins.families.euvhi
