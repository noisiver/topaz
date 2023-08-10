-----------------------------------
-- Area: Lebros Cavern (Excavation Duty)
--  Mob: Viashap
-- 
-----------------------------------
local ID = require("scripts/zones/Lebros_Cavern/IDs")
mixins = {require("scripts/mixins/families/dahak")}
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.MDEF, 40)
    mob:setMod(tpz.mod.UDMGMAGIC, 13)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 2) 
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
	mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 20)
    --mob:AnimationSub(0)
end

function onMobRoam(mob)
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end
    --if mob:getID(instance) == 17035613 then
        --mob:setPos(178.7798,-39.9750,421.3668,60)
    --end
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
    return 647 -- Only uses Chaos Blade
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 647 then
        mob:useMobAbility(math.random(642, 644)) -- Always uses a random breath after cChaos Blade
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    local instance = mob:getInstance()
    if isKiller or noKiller then
        SpawnMob(17035614, instance)
        local zonePlayers = mob:getZone():getPlayers()
        for _, zonePlayer in pairs(zonePlayers) do
            zonePlayer:PrintToPlayer("Looks like I'll have to clean up this mess myself.",0,"Troll Destroyer")
        end
    end
end