-----------------------------------
-- Area: Mamool Ja Trianing Grounds (Imperial Agent Rescue)
--  Mob: Mamool Ja Medic
-- Job: WAR
-----------------------------------
local ID = require("scripts/zones/Mamool_Ja_Training_Grounds/IDs")
-----------------------------------
function onMobSpawn(mob)
	mob:setDamage(75)
    mob:setMod(tpz.mod.MDEF, 70)
    mob:setMod(tpz.mod.UDMGMAGIC, -25)
	mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 20)
	mob:setMobMod(tpz.mobMod.SOUND_RANGE, 20)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 2) 
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    --mob:AnimationSub(0)
end

function onMobRoam(mob)
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end
    if mob:getID(instance) == 17047944 then
        mob:setPos(-15.9929,1.6343,-417.0826,125)
    end
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
    return 2103 -- Keeps up Granite Skin
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 2103 then -- Granite Skin
         mob:useMobAbility(math.random(2099, 2100)) -- Batterhorn, Clobber
    end
end

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()
    if GetNPCByID(17047948, instance):getStatus() == (tpz.status.DISAPPEAR) then
        GetNPCByID(17047948, instance):setPos(mobX, mobY, mobZ)
        GetNPCByID(17047948, instance):setStatus(tpz.status.NORMAL)
        GetNPCByID(17047948, instance):setLocalVar("Message", 0)GetNPCByID(17047948, instance):setLocalVar("Message", 0)
    end
    SpawnMob(17047945, instance)
    local zonePlayers = mob:getZone():getPlayers()
    for _, zonePlayer in pairs(zonePlayers) do
        zonePlayer:PrintToPlayer("Who dare defiles our land?",0,"Ritter")
    end
end