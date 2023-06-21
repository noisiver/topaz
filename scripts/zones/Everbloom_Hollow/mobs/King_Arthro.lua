-----------------------------------
-- Area: Everbloom Hollow
--  Mob: King Arthro
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/mobs")
local ID = require("scripts/zones/Everbloom_Hollow/IDs")
-----------------------------------
function onMobSpawn(mob)
    mob:setDamage(120)
    mob:setMod(tpz.mod.DEF, 10000)
    mob:setMod(tpz.mod.EVA, 340)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:setMod(tpz.mod.UDMGMAGIC, -99)
    mob:setMod(tpz.mod.UDMGBREATH, -99)
    mob:setMod(tpz.mod.WATER_ABSORB, 100)
    mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 25)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 2064)
end

function onMobRoam(mob)
    mob:setMod(tpz.mod.UDMGMAGIC, -99)
    mob:setMod(tpz.mod.UDMGBREATH, -99)
end

function onMobFight(mob, target)
     mob:addListener("SKILLCHAIN_TAKE", "MANTICORE_TAKE_DAMAGE", function(mob)
        mob:timer(10000, function(mob) -- lower resistance to magic for 10 seconds(Magic burst window)
            mob:setMod(tpz.mod.UDMGMAGIC, 0)
            mob:setMod(tpz.mod.UDMGBREATH, 0)
        end)
        mob:setMod(tpz.mod.UDMGMAGIC, -99)
        mob:setMod(tpz.mod.UDMGBREATH, -99)
    end)
end

function onMobWeaponSkill(target, mob, skill)
	local Crab = GetMobByID(mob:getID()+1)

    if skill:getID() == 442 and not Crab:isSpawned() then -- Bubble shower
		Crab:setPos(mob:getPos())
		Crab:spawn()
		Crab:updateEnmity(target)
    end
end

function onMonsterMagicPrepare(mob, target)
    return 202 -- Waterga IV
end

function onMobDisengage(mob)
    mob:setMod(tpz.mod.UDMGMAGIC, -99)
    mob:setMod(tpz.mod.UDMGBREATH, -99)
end

function onMobDeath(mob, player, isKiller)
    DespawnMob(mob:getID()+1)
end
