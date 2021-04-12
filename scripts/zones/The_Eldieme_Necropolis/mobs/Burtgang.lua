------------------------------
-- Area: The Eldieme Necropolis
--   Burtgang
--  !additem 480 
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.UFASTCAST, 50)
    mob:setMod(tpz.mod.UDMGMAGIC, -50)
    mob:setMod(tpz.mod.SILENCERES, 95)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 0)
    mob:SetMagicCastingEnabled(false)
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local twohourTime = mob:getLocalVar("twohourTime")
    local STANCEdps = mob:getLocalVar("STANCEdps")
    local STANCEtank = mob:getLocalVar("STANCEtank")
    local DMGtaken = mob:getLocalVar("DMGtaken")

    if twohourTime == 0 then
        printf("Setting two hour time");
        mob:setLocalVar("twohourTime", math.random(45, 60))
    elseif battletime >= twohourTime and STANCEtank == 0 then
        printf("Invincible");
        mob:useMobAbility(1053) -- Invincible
        mob:SetMagicCastingEnabled(true)
        mob:setLocalVar("STANCEdps", battletime + 30)
        mob:setLocalVar("STANCEtank", 1)
    end

    if battletime >= STANCEdps and STANCEtank == 1 then
        printf("Tank Stance");
        mob:SetMagicCastingEnabled(false)
        mob:setLocalVar("twohourTime", battletime + math.random(45, 60))
        mob:setLocalVar("STANCEdps", 0)
        mob:setLocalVar("STANCEtank", 0)
        mob:setLocalVar("DMGtaken", 0)
    end

    if (mob:hasStatusEffect(tpz.effect.INVINCIBLE) and mob:hasStatusEffect(tpz.effect.SILENCE) == true) then
        mob:setMod(tpz.mod.SILENCERES, 0)
        mob:setMod(tpz.mod.UDMGMAGIC, 200)
    else
        mob:setMod(tpz.mod.SILENCERES, 95)
        mob:setMod(tpz.mod.UDMGMAGIC, -50)
    end
end


function onMagicHit(caster, target, spell)
end

function onMobDeath(mob, player, isKiller)
player:PrintToPlayer("Maybe...you...are...worthy...of...my...power...",0,"Burtgang")
end


