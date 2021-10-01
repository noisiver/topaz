-----------------------------------
-- Area: Behemoths Dominion
--   NM: Legendary Weapon
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
    mob:addMod(tpz.mod.MDEF, 300) 
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.UDMGMAGIC, -75)
    mob:setMod(tpz.mod.UDMGBREATH, -100)
    mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
    mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local ResistanceChangeTime = mob:getLocalVar("ResistanceChangeTime")
    local ResistanceMode = mob:getLocalVar("ResistanceMode")


    if ResistanceChangeTime == 0 then
        printf("Setting ResistanceChangeTime");
        mob:setLocalVar("ResistanceChangeTime", 3)
        mob:setLocalVar("ResistanceMode", math.random(1,3))
    elseif battletime >= ResistanceChangeTime and ResistanceMode == 1 then
        printf("Piercing Mode");
        mob:useMobAbility(624) -- 2 hour "cloud" animation
		mob:AnimationSub(2) -- Piercing
        mob:setMod(tpz.mod.HTHRES, 0)
        mob:setMod(tpz.mod.SLASHRES, 0)
        mob:setMod(tpz.mod.PIERCERES, 1000)
        mob:setMod(tpz.mod.IMPACTRES, 0)
        mob:setLocalVar("ResistanceChangeTime", battletime + 120)
        mob:setLocalVar("ResistanceMode", math.random(1,3))
    end

    if battletime >= ResistanceChangeTime and ResistanceMode == 2 then
        printf("Slashing Mode");
        mob:useMobAbility(624) -- 2 hour "cloud" animation
		mob:AnimationSub(1) -- Slashing
        mob:setMod(tpz.mod.HTHRES, 0)
        mob:setMod(tpz.mod.SLASHRES, 1000)
        mob:setMod(tpz.mod.PIERCERES, 0)
        mob:setMod(tpz.mod.IMPACTRES, 0)
        mob:setLocalVar("ResistanceChangeTime", battletime + 120)
        mob:setLocalVar("ResistanceMode", math.random(1,3))
    end
    
	if battletime >= ResistanceChangeTime and ResistanceMode == 3 then
        printf("Blunt Mode");
        mob:useMobAbility(624) -- 2 hour "cloud" animation
		mob:AnimationSub(3) -- Blunt+Impact
        mob:setMod(tpz.mod.HTHRES, 1000)
        mob:setMod(tpz.mod.SLASHRES, 0)
        mob:setMod(tpz.mod.PIERCERES, 0)
        mob:setMod(tpz.mod.IMPACTRES, 1000)
        mob:setLocalVar("ResistanceChangeTime", battletime + 120)
        mob:setLocalVar("ResistanceMode", math.random(1,3))
    end
    mob:setMobMod(tpz.mobMod.SHARE_TARGET, 17297449)
end


function onMobDisengage(mob)
    DespawnMob(mob:getID(), 120)
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 102, 2, tpz.regime.type.FIELDS)
    if (isKiller and GetMobByID(ID.mob.ANCIENT_WEAPON):isDead()) then
        GetNPCByID(ID.npc.CERMET_HEADSTONE):setLocalVar("cooldown", os.time() + 900)
    end
end
