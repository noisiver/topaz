-----------------------------------
-- Area: Empyreal Paradox
--  MOB: Promathia
-----------------------------------
local ID = require("scripts/zones/Empyreal_Paradox/IDs")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.MDEF, 30)
    mob:setMod(tpz.mod.UDMGMAGIC, -20)
    mob:setMod(tpz.mod.REGAIN, 50)
    mob:setMod(tpz.mod.UFASTCAST,50)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 18)
end

function onMobInitialize(mob)
end

function onMobEngaged(mob,target)
    local bcnmAllies = mob:getBattlefield():getAllies()
    for i,v in pairs(bcnmAllies) do
        v:addEnmity(mob, 0, 1)
    end
end

function onMobFight(mob,target)
    if mob:AnimationSub() == 3 and not mob:hasStatusEffect(tpz.effect.STUN) then
        mob:AnimationSub(0)
        mob:stun(1500)
    end
end

function onSpellPrecast(mob, spell)
    if spell:getID() == 219 then
        spell:setMPCost(1)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    local battlefield = mob:getBattlefield()
    if player then
        player:startEvent(32004, battlefield:getArea())
    else
        for _, member in pairs(battlefield:getPlayers()) do
            member:startEvent(32004, battlefield:getArea())
        end
    end
end


function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option,target)
    if csid == 32004 then
        DespawnMob(target:getID())
        mob = SpawnMob(target:getID()+1)
        local bcnmAllies = mob:getBattlefield():getAllies()
        for i,v in pairs(bcnmAllies) do
            v:resetLocalVars()
            local spawn = v:getSpawnPos()
            v:setPos(spawn.x, spawn.y, spawn.z, spawn.rot)
        end
    end
end