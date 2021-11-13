-----------------------------------
-- Area: The Garden of Ru'Hmet
--  MOB: Ix'Zdei (BLM)
-- Animation Sub 0 Pot Form
-- Animation Sub 1 Pot Form (reverse eye position)
-- Animation Sub 2 Bar Form
-- Animation Sub 3 Ring Form
-----------------------------------
require("scripts/globals/status")
mixins = {require("scripts/mixins/families/zdei")}
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 12)
end

function onMobEngaged(mob)
    mob:SetAutoAttackEnabled(true)
    mob:setLocalVar("recover", math.random(20, 50))
end

function onMobFight(mob)
    local recover = mob:getLocalVar("recover")
    if mob:getHPP() <= recover then
        local pos = mob:getSpawnPos()
        mob:pathThrough({pos.x, pos.y, pos.z}, tpz.path.flag.SCRIPT)
        mob:SetAutoAttackEnabled(false)

        if mob:atPoint({pos.x, pos.y, pos.z}) then
            local time = mob:getLocalVar("time")
            local now = os.time()
            if time ~= 0 and now > time then
                mob:SetAutoAttackEnabled(true)
                mob:setHP(mob:getMaxHP())
                mob:setLocalVar("recover", 0)
            elseif time == 0 then
                mob:setLocalVar("time", os.time() + 3)
            end
        end
    end
end

function onMobDeath(mob, player, isKiller)
end
