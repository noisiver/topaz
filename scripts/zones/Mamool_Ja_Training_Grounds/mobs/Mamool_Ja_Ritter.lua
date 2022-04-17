-----------------------------------
-- Area: Mamool Ja Trianing Grounds (Imperial Agent Rescue)
--  Mob: Mamool Ja Medic
-- Job: RNG/WAR
-----------------------------------
local ID = require("scripts/zones/Mamool_Ja_Training_Grounds/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMod(tpz.mod.MDEF, 70)
    mob:setMod(tpz.mod.UDMGMAGIC, -25)
	mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 20)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 2) 
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    --mob:AnimationSub(0)
end

function onMobRoam(mob)
    if mob:getTP() > 1000 then
        mob:setTP(1000)
    end
    --if mob:getID(instance) == 17047945 then
      --mob:setPos(-48.5366,11.9258,-480.2752,140)
    --end
end

function onMobEngaged(mob)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobFight(mob, target)
    local instance = mob:getInstance()
	local Dragoon = GetMobByID(mob:getID(instance) +1, instance)
    local zonePlayers = mob:getZone():getPlayers()
	if mob:getHPP() <= 50 then
    for _, zonePlayer in pairs(zonePlayers) do
        zonePlayer:PrintToPlayer("The Wivre wails in pain as it falls over dead!",0,"???")
    end
        DespawnMob(mob:getID(instance), instance)
        Dragoon:spawn()
        Dragoon:updateEnmity(target)
	end
end

function onMobWeaponSkillPrepare(mob, target)
    return 2103 -- Keeps up Granite Skin
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end