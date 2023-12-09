-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Colkhab
-- WKR NM
-----------------------------------
local ID = require("scripts/zones/Crawlers_Nest/IDs")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------
function onMobInitialize(mob)
end

function onMobSpawn(mob)
    mob:setDamage(90)
    mob:SetMobSkillAttack(6143)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 6000)
end

function onMobEngaged(mob, target)
     mob:setWeather(tpz.weather.GALES)
     mob:setLocalVar("msgTimer", os.time() + 45)
end

function onMobFight(mob, target)
    -- Can be procced White !! (Terror) by magic bursting ice damage for 1k+ or SCing for 500+
    mob:addListener("SPELL_DMG_TAKEN", "COLKHAB_SPELL_DMG_TAKEN", function(mob, caster, spell, amount, msg)
        local element = spell:getElement()
        local duration = 60

        if (element == tpz.magic.ele.ICE) and (amount >= 1000) then
            if (msg == tpz.msg.basic.MAGIC_BURST_BLACK) or (msg == tpz.msg.MAGIC_BURST_BREATH) then
                BreakMob(mob, caster, tpz.procEffect.ALL_NORMAL, duration, tpz.procType.TERROR)
            end
        end
    end)

    mob:addListener("SKILLCHAIN_TAKE", "COLKHAB_SC_TAKE", function(mob, target, skillchain, dmg)
        if skillchain == tpz.skillchainEle.INDURATION or skillchain == tpz.skillchainEle.DISTORTION or skillchain == tpz.skillchainEle.DARKNESS
        or skillchain == tpz.skillchainEle.DARKNESS_II then
            local duration = 60
            if (dmg > 500) then
                BreakMob(mob, target, tpz.procEffect.ALL_NORMAL, duration, tpz.procType.TERROR)
            end
        end
    end)

    if not mob:hasStatusEffect(tpz.effect.TERROR) then
        mob:setWeather(tpz.weather.GALES)
        PeriodicMessage(mob, target, "The " .. MobName(mob) .. " seems vulnerable to ice damage...", 0xD, none, 30)
    else
        mob:setWeather(tpz.weather.NONE)
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDeath(mob, player, isKiller, noKiller)
    player:addTitle(tpz.title.COLKHAB_DETHRONER)
end

function onMobDespawn(mob)
end