require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}
-- opens/closed based on animation sub
-- 4 = closed(petal) 6 = open(bloomed)

function CheckForm(mob)
    if mob:AnimationSub() == 4 then
        PetalMods(mob)
    elseif mob:AnimationSub() == 6 then
        BloomedMods(mob)
    end
end

function petal_form(mob)
    PetalMods(mob)
    mob:AnimationSub(4)
end

function bloomed_form(mob)
    BloomedMods(mob)
    mob:AnimationSub(6)
end

function PetalMods(mob)
    mob:setMod(tpz.mod.DEFP, 100) 
    mob:setMod(tpz.mod.DMG, -25)
    mob:setDelay(4000)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
    mob:setMobMod(tpz.mobMod.LINK_RADIUS, 11)
    mob:addMobMod(tpz.mobMod.ROAM_DISTANCE, 3)
    mob:addMobMod(tpz.mobMod.ROAM_COOL, 30)
    mob:setAggressive(0)
end

function BloomedMods(mob)
    mob:setMod(tpz.mod.DMG, 12.5)
    mob:setDelay(3000)
    mob:setMod(tpz.mod.DEFP, 0)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:setMobMod(tpz.mobMod.LINK_RADIUS, 0)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 11)
    mob:setAggressive(1)
end


g_mixins.families.euvhi = function(mob)
    mob:addListener("SPAWN", "EUVHI_SPAWN", function(mob)
        CheckForm(mob)
    end)

    mob:addListener("ROAM_TICK", "EUVHI_ROAM", function(mob)
        CheckForm(mob)
    end)

    mob:addListener("ENGAGE", "EUVHI_ENGAGE", function(mob, target)
        CheckForm(mob)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
        mob:setLocalVar("changeTime", os.time() + math.random(20, 30))
    end)

    mob:addListener("COMBAT_TICK", "EUVHI_COMBAT_TICK", function(mob)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
    end)

    mob:addListener("DISENGAGE", "EUVHI_DISENGAGE", function(mob)
        CheckForm(mob)
    end)


    mob:addListener("COMBAT_TICK", "EUVHI_CTICK", function(mob)
        -- Ensure the Euvhi won't stop moving mid fight
        mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
        local changeTime = mob:getLocalVar("changeTime")
        -- Open if time expired
        if os.time() >= changeTime then
            if mob:AnimationSub() == 4 then
                 petal_form(mob)
                mob:setLocalVar("changeTime", os.time() + math.random(30, 45))
            elseif mob:AnimationSub() == 6 then
                bloomed_form(mob)
                mob:setLocalVar("changeTime", os.time() + math.random(30, 45))
            end
        end
        CheckForm(mob)
    end)

end

return g_mixins.families.euvhi
