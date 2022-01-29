-----------------------------------
-- Area: North Gustaberg [S]
--  Mob: Sandworm
-- Note:  Title Given if Sandworm does not Doomvoid
-----------------------------------
mixins ={require("scripts/mixins/rage")}
local ID = require("scripts/zones/Rolanberry_Fields_[S]/IDs")
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
-----------------------------------

function onMobSpawn(mob)
	mob:setDamage(250)
    mob:setMod(tpz.mod.DEF, 522)
    mob:setMod(tpz.mod.EVA, 395) 
    mob:setMod(tpz.mod.REGAIN, 0)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 2064)
	mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
    mob:setLocalVar("[rage]timer", 5400) -- 90 minutes
end

function onMobFight(mob, target)
    --Using this for testing purposes to force Doomvoid TP move.
    local forceDV = mob:getLocalVar("dv")
    
    if forceDV ~= 0 then
        mob:useMobAbility(2192) -- Doomvoid
        mob:setLocalVar("dv", 0)
    end
end
    --TODO: Currently, Doomvoid only takes the primary target and properly creates the instance, taking them inside. Second target executes
    -- the setPos command but ends up inside zone without instance set.
function onMobWeaponSkill (target, mob, skill)
    if skill:getID() == 2192 then 
        local primaryTarget = mob:getTarget()
        if primaryTarget then
            if primaryTarget:getID() == target:getID() then
                target:createInstance(88, 93)
            else
                local instance = primaryTarget:getInstance()
                if instance then
                    target:setInstance(instance)
                end
            end

            target:startEvent(202)
        end
    end
end

function onEventFinish(player, csid, option, target)
    if csid == 202 and option == 0 then
        player:setPos(0, 0, 0, 0, 93)
        player:addTempItem(5423)
    end
end
function onInstanceCreated(player, target, instance)
    if (instance) then
        player:setInstance(instance)
    else
        player:messageText(target, ID.text.CANNOT_ENTER, false)
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.SANDWORM_WRANGLER)
end
