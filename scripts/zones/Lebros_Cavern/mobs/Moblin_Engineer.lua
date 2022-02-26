-----------------------------------
-- Area: Lebros Cavern (Excavation Duty)
--  Mob: Red Pineapple
-- 
-----------------------------------
local ID = require("scripts/zones/Lebros_Cavern/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.MDEF, 70)
    mob:setMod(tpz.mod.UDMGMAGIC, 25)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:setMobMod(tpz.mobMod.LINK_RADIUS, 30)
    --mob:AnimationSub(0)
end

function onMobRoam(mob)
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end
    --if mob:getID(instance) == 17035566 then
        --mob:setPos(165.0970,-29.961,55.8284,120)
    --end
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobFight(mob, target)
    local nearbyPlayers = mob:getPlayersInRange(30)
    if nearbyPlayers == nil then return end
    for _,v in ipairs(nearbyPlayers) do
        v:delStatusEffectSilent(tpz.effect.MUTE)
        v:addStatusEffectEx(tpz.effect.MUTE, tpz.effect.MUTE, 1, 0, 5)
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller)
end