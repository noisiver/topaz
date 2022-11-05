require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

function close_form(mob)
    mob:setMod(tpz.mod.DEFP, 100) 
    mob:setMod(tpz.mod.DMG, -25)
    mob:setDelay(4000)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
    mob:setMobMod(tpz.mobMod.LINK_RADIUS, 11)
    mob:addMobMod(tpz.mobMod.ROAM_DISTANCE, 5)
    mob:addMobMod(tpz.mobMod.ROAM_COOL, 30)
    mob:setAggressive(0)
    mob:AnimationSub(4)
end

function open_form(mob)
    mob:setMod(tpz.mod.DMG, 12.5)
    mob:setDelay(3000)
    mob:setMod(tpz.mod.DEFP, 0)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:setMobMod(tpz.mobMod.LINK_RADIUS, 0)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 11)
    mob:setAggressive(1)
    mob:AnimationSub(6)
end

g_mixins.families.euvhi = function(mob)
    mob:addListener("SPAWN", "EUVHI_SPAWN", function(mob)
        mob:setLocalVar("changeTime", os.time() + math.random(5, 10))
    end)

    mob:addListener("ROAM_TICK", "EUVHI_ROAM", function(mob)
        local changeTime = mob:getLocalVar("changeTime")
        -- Open if time expired
        if os.time() >= changeTime then
            if mob:AnimationSub() == 4 then
                open_form(mob)
                mob:setLocalVar("changeTime", os.time() + math.random(60, 90))
            elseif mob:AnimationSub() == 6 then
                close_form(mob) 
                mob:setLocalVar("changeTime", os.time() + math.random(60, 90))
            end
        end
    end)

    mob:addListener("ENGAGE", "EUVHI_ENGAGE", function(mob, target)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
    end)

    mob:addListener("DISENGAGE", "EUVHI_DISENGAGE", function(mob)
    end)


    mob:addListener("COMBAT_TICK", "EUVHI_CTICK", function(mob)
        -- Ensure the Euvhi won't stop moving mid fight
        mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
        local changeTime = mob:getLocalVar("changeTime")
        -- Open if time expired
        if os.time() >= changeTime then
            if mob:AnimationSub() == 4 then
                open_form(mob)
                mob:setLocalVar("changeTime", os.time() + math.random(30, 40))
            elseif mob:AnimationSub() == 6 then
                close_form(mob) 
                mob:setLocalVar("changeTime", os.time() + math.random(30, 40))
            end
        end
    end)

end

return g_mixins.families.euvhi
