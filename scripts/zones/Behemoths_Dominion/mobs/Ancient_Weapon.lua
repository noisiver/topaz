-----------------------------------
-- Area: Behemoths Dominion
--   NM: Ancient Weapon
-----------------------------------
local ID = require("scripts/zones/Behemoths_Dominion/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/regimes")
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 35)
    mob:addMod(tpz.mod.DEFP, 35) 
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 20)
    mob:setMod(tpz.mod.UDMGMAGIC, -75)
    mob:addMod(tpz.mod.MDEF, 300) 
    mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local twohourTime = mob:getLocalVar("twohourTime")
    local STANCEdps = mob:getLocalVar("STANCEdps")
    local STANCEtank = mob:getLocalVar("STANCEtank")
    local STANCEthird = mob:getLocalVar("STANCEthird")
    local STANCEwat = mob:getLocalVar("STANCEwat")

    if twohourTime == 0 then
        printf("Setting two hour time");
        mob:setLocalVar("twohourTime", math.random(10, 15))
    elseif battletime >= twohourTime and STANCEtank == 0 then
        printf("Piercing Mode");
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        mob:setMod(tpz.mod.HTHRES, 1000)
        mob:setMod(tpz.mod.SLASHRES, 0)
        mob:setMod(tpz.mod.PIERCERES, 0)
        mob:setMod(tpz.mod.IMPACTRES, 1000)
        mob:setLocalVar("STANCEdps", battletime + math.random(120, 180))
        mob:setLocalVar("STANCEtank", 1)
    end

    if battletime >= STANCEdps and STANCEtank == 1 then
        printf("Slashing Mode");
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        mob:setMod(tpz.mod.HTHRES, 0)
        mob:setMod(tpz.mod.SLASHRES, 0)
        mob:setMod(tpz.mod.PIERCERES, 1000)
        mob:setMod(tpz.mod.IMPACTRES, 0)
        mob:setLocalVar("STANCEthird", battletime + math.random(120, 180))
        mob:setLocalVar("STANCEdps", 0)
        mob:setLocalVar("STANCEtank", 0)
        mob:setLocalVar("STANCEwat", 1)
    end
    if battletime >= STANCEthird and STANCEwat == 1 then
        printf("Slashing Mode");
        mob:useMobAbility(624) -- 2 hour "cloud" animation
        mob:setMod(tpz.mod.HTHRES, 0)
        mob:setMod(tpz.mod.SLASHRES, 1000)
        mob:setMod(tpz.mod.PIERCERES, 0)
        mob:setMod(tpz.mod.IMPACTRES, 0)
        mob:setLocalVar("twohourTime", battletime + math.random(120, 180))
        mob:setLocalVar("STANCEdps", 0)
        mob:setLocalVar("STANCEtank", 0)
        mob:setLocalVar("STANCEwat", 0)
    end
    mob:setMobMod(tpz.mobMod.SHARE_TARGET, 17297450)
end

function onMobDisengage(mob)
    DespawnMob(mob:getID(), 120)
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 102, 2, tpz.regime.type.FIELDS)
    if (isKiller and GetMobByID(ID.mob.LEGENDARY_WEAPON):isDead()) then
        GetNPCByID(ID.npc.CERMET_HEADSTONE):setLocalVar("cooldown", os.time() + 900)
    end
end
