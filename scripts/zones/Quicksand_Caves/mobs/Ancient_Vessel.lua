-----------------------------------
-- Area: Quicksand Caves
--  Mob: Ancient Vessel
-- Mithra and the Crystal (Zilart 12) Fight
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.UDMGMAGIC, 0)
    mob:setMod(tpz.mod.DMGMAGIC, 0)
    mob:setMod(tpz.mod.UDMGBREATH, -100)
    mob:setMod(tpz.mod.MDEF, 0)
    mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 60)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local twohourTime = mob:getLocalVar("twohourTime")
    local STANCEdps = mob:getLocalVar("STANCEdps")
    local STANCEtank = mob:getLocalVar("STANCEtank")

    if twohourTime == 0 then
        printf("Setting two hour time");
        mob:setLocalVar("twohourTime", math.random(10, 15))
    elseif battletime >= twohourTime and STANCEtank == 0 then
        printf("Magic Immune Mode");
        mob:useMobAbility(522) -- Spectral Barrier
		mob:setMod(tpz.mod.UDMGMAGIC, -100)
        mob:setMod(tpz.mod.UDMGPHYS, 0)
        mob:setLocalVar("STANCEdps", battletime + math.random(120, 180))
        mob:setLocalVar("STANCEtank", 1)
    end

    if battletime >= STANCEdps and STANCEtank == 1 then
        printf("Phys Immune Mode");
        mob:useMobAbility(1522) -- Energy Screen
        mob:setMod(tpz.mod.UDMGPHYS, -100)
		mob:setMod(tpz.mod.UDMGMAGIC, 0)
        mob:setLocalVar("twohourTime", battletime + math.random(120, 180))
        mob:setLocalVar("STANCEdps", 0)
        mob:setLocalVar("STANCEtank", 0)
    end
end


function onMobDeath(mob, player, isKiller)

    if (player:getCurrentMission(ZILART) == tpz.mission.id.zilart.THE_MITHRA_AND_THE_CRYSTAL and player:getCharVar("ZilartStatus") == 1) then
        player:needToZone(true)
        player:setCharVar("AncientVesselKilled", 1)
    end

end
