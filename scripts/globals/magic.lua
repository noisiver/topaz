require("scripts/globals/spell_data")
require("scripts/globals/magicburst")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
require("scripts/globals/items")
------------------------------------

tpz = tpz or {}
tpz.magic = tpz.magic or {}

------------------------------------
-- Elements
------------------------------------

--tpz.magic.element =
--{
   -- NONE      = 0,
   -- FIRE      = 1,
   -- EARTH     = 2,
   -- WATER     = 3,
   -- WIND      = 4,
   -- ICE       = 5,
   -- LIGHTNING = 6,
   -- THUNDER   = 6,
   -- LIGHT     = 7,
  --  DARK      = 8,
--}
--tpz.magic.ele = tpz.magic.element

------------------------------------
-- Spell Groups
------------------------------------


------------------------------------
-- Resistance Building Categories
------------------------------------

tpz.magic.buildcat =
{
    SLEEP = 0,
    GRAVITY = 1,
    BIND = 2,
    SLOW = 3,
    PARALYZE = 4,
    BLIND = 5,
    SILENCE = 6,
    STUN = 7,
    LULLABY = 8,
    OFFSET = 959, -- subtract mod by 959 to get to cat
}

------------------------------------
-- Spell AOE IDs
------------------------------------

tpz.magic.aoe =
{
    NONE        = 0,
    RADIAL      = 1,
    CONAL       = 2,
    RADIAL_MANI = 3, -- AOE when under SCH stratagem Manifestation
    RADIAL_ACCE = 4, -- AOE when under SCH stratagem Accession
    PIANISSIMO  = 5, -- Single target when under BRD JA Pianissimo
    DIFFUSION   = 6, -- AOE when under Diffusion
}

------------------------------------
-- Spell flag bits
------------------------------------

tpz.magic.spellFlag =
{
    NONE           = 0x00,
    HIT_ALL        = 0x01, -- Hit all targets in range regardless of party
    WIPE_SHADOWS   = 0x02, -- Wipe shadows even if single target and miss/resist (example: "Maiden's Virelai")
    IGNORE_SHADOWS = 0x04  -- Ignore shadows and hit player anyways (example: Mobs "Death" spell)
}

------------------------------------
-- Tables by element
------------------------------------

tpz.magic.dayStrong           = {tpz.day.FIRESDAY,              tpz.day.ICEDAY,               tpz.day.WINDSDAY,               tpz.day.EARTHSDAY,              tpz.day.LIGHTNINGDAY,               tpz.day.WATERSDAY,               tpz.day.LIGHTSDAY,           tpz.day.DARKSDAY}
tpz.magic.singleWeatherStrong = {tpz.weather.HOT_SPELL,         tpz.weather.SNOW,             tpz.weather.WIND,               tpz.weather.DUST_STORM,         tpz.weather.THUNDER,                tpz.weather.RAIN,                tpz.weather.AURORAS,         tpz.weather.GLOOM}
tpz.magic.doubleWeatherStrong = {tpz.weather.HEAT_WAVE,         tpz.weather.BLIZZARDS,        tpz.weather.GALES,              tpz.weather.SAND_STORM,         tpz.weather.THUNDERSTORMS,          tpz.weather.SQUALL,              tpz.weather.STELLAR_GLARE,   tpz.weather.DARKNESS}
local elementalObi            = {tpz.mod.FORCE_FIRE_DWBONUS,    tpz.mod.FORCE_ICE_DWBONUS,    tpz.mod.FORCE_WIND_DWBONUS,     tpz.mod.FORCE_EARTH_DWBONUS,    tpz.mod.FORCE_LIGHTNING_DWBONUS,    tpz.mod.FORCE_WATER_DWBONUS,     tpz.mod.FORCE_LIGHT_DWBONUS, tpz.mod.FORCE_DARK_DWBONUS}
local spellAcc                = {tpz.mod.FIREACC,               tpz.mod.ICEACC,               tpz.mod.WINDACC,                tpz.mod.EARTHACC,               tpz.mod.THUNDERACC,                 tpz.mod.WATERACC,                tpz.mod.LIGHTACC,            tpz.mod.DARKACC}
local strongAffinityDmg       = {tpz.mod.FIRE_AFFINITY_DMG,     tpz.mod.ICE_AFFINITY_DMG,     tpz.mod.WIND_AFFINITY_DMG,      tpz.mod.EARTH_AFFINITY_DMG,     tpz.mod.THUNDER_AFFINITY_DMG,       tpz.mod.WATER_AFFINITY_DMG,      tpz.mod.LIGHT_AFFINITY_DMG,  tpz.mod.DARK_AFFINITY_DMG}
local strongAffinityAcc       = {tpz.mod.FIRE_AFFINITY_ACC,     tpz.mod.ICE_AFFINITY_ACC,     tpz.mod.WIND_AFFINITY_ACC,      tpz.mod.EARTH_AFFINITY_ACC,     tpz.mod.THUNDER_AFFINITY_ACC,       tpz.mod.WATER_AFFINITY_ACC,      tpz.mod.LIGHT_AFFINITY_ACC,  tpz.mod.DARK_AFFINITY_ACC}
tpz.magic.resistMod           = {tpz.mod.FIRERES,               tpz.mod.ICERES,               tpz.mod.WINDRES,                tpz.mod.EARTHRES,               tpz.mod.THUNDERRES,                 tpz.mod.WATERRES,                tpz.mod.LIGHTRES,            tpz.mod.DARKRES}
tpz.magic.defenseMod          = {tpz.mod.FIREDEF,               tpz.mod.ICEDEF,               tpz.mod.WINDDEF,                tpz.mod.EARTHDEF,               tpz.mod.THUNDERDEF,                 tpz.mod.WATERDEF,                tpz.mod.LIGHTDEF,            tpz.mod.DARKDEF}
tpz.magic.absorbMod           = {tpz.mod.FIRE_ABSORB,           tpz.mod.ICE_ABSORB,           tpz.mod.WIND_ABSORB,            tpz.mod.EARTH_ABSORB,           tpz.mod.LTNG_ABSORB,                tpz.mod.WATER_ABSORB,            tpz.mod.LIGHT_ABSORB,        tpz.mod.DARK_ABSORB}
tpz.magic.absorbModToMP       = {tpz.mod.FIRE_ABSORB_TO_MP,           tpz.mod.ICE_ABSORB_TO_MP,           tpz.mod.WIND_ABSORB_TO_MP,            tpz.mod.EARTH_ABSORB_TO_MP,           tpz.mod.LTNG_ABSORB_TO_MP,                tpz.mod.WATER_ABSORB_TO_MP,            tpz.mod.LIGHT_ABSORB_TO_MP,        tpz.mod.DARK_ABSORB_TO_MP}
local nullMod                 = {tpz.mod.FIRE_NULL,             tpz.mod.ICE_NULL,             tpz.mod.WIND_NULL,              tpz.mod.EARTH_NULL,             tpz.mod.LTNG_NULL,                  tpz.mod.WATER_NULL,              tpz.mod.LIGHT_NULL,          tpz.mod.DARK_NULL}
local blmMerit                = {tpz.merit.FIRE_MAGIC_POTENCY,  tpz.merit.ICE_MAGIC_POTENCY,  tpz.merit.WIND_MAGIC_POTENCY,   tpz.merit.EARTH_MAGIC_POTENCY,  tpz.merit.LIGHTNING_MAGIC_POTENCY,  tpz.merit.WATER_MAGIC_POTENCY}
local rdmMerit                = {tpz.merit.FIRE_MAGIC_ACCURACY, tpz.merit.ICE_MAGIC_ACCURACY, tpz.merit.WIND_MAGIC_ACCURACY,  tpz.merit.EARTH_MAGIC_ACCURACY, tpz.merit.LIGHTNING_MAGIC_ACCURACY, tpz.merit.WATER_MAGIC_ACCURACY}
tpz.magic.barSpell            = {tpz.effect.BARFIRE,            tpz.effect.BARBLIZZARD,       tpz.effect.BARAERO,             tpz.effect.BARSTONE,            tpz.effect.BARTHUNDER,              tpz.effect.BARWATER}

tpz.magic.dayWeak             = {tpz.day.WATERSDAY,             tpz.day.FIRESDAY,            tpz.day.ICEDAY,                  tpz.day.WINDSDAY,               tpz.day.EARTHSDAY,                  tpz.day.LIGHTNINGDAY,            tpz.day.DARKSDAY,            tpz.day.LIGHTSDAY           }
tpz.magic.singleWeatherWeak   = {tpz.weather.RAIN,              tpz.weather.HOT_SPELL,       tpz.weather.SNOW,                tpz.weather.WIND,               tpz.weather.DUST_STORM,             tpz.weather.THUNDER,             tpz.weather.GLOOM,           tpz.weather.AURORAS         }
tpz.magic.doubleWeatherWeak   = {tpz.weather.SQUALL,            tpz.weather.HEAT_WAVE,       tpz.weather.BLIZZARDS,           tpz.weather.GALES,              tpz.weather.SAND_STORM,             tpz.weather.THUNDERSTORMS,       tpz.weather.DARKNESS,        tpz.weather.STELLAR_GLARE   }

-- USED FOR DAMAGING MAGICAL SPELLS (Stages 1 and 2 in Calculating Magic Damage on wiki)
--Calculates magic damage using the standard magic damage calc.
--Does NOT handle resistance.
-- Inputs:
-- dmg - The base damage of the spell
-- multiplier - The INT multiplier of the spell
-- skilltype - The skill ID of the spell.
-- atttype - The attribute type (usually tpz.mod.INT , except for things like Banish which is tpz.mod.MND)
-- hasMultipleTargetReduction - true ifdamage is reduced on AoE. False otherwise (e.g. Charged Whisker vs -ga3 spells)
--
-- Output:
-- The total damage, before resistance and before equipment (so no HQ staff bonus worked out here).
local SOFT_CAP = 60 --guesstimated
local HARD_CAP = 120 --guesstimated

function tryBuildResistance(category, target)
    if target:isPC() then
        return 1
    end
    
    local ret = 0
    local current = 1
    local lastcast = 0
    local delta = target:getMod(category + tpz.magic.buildcat.OFFSET)
    
    -- one point falls off per 20 seconds
    
    if target:isNM() and (delta == 0 or delta == nil) then
        if category == tpz.magic.buildcat.SLEEP or category == tpz.magic.buildcat.GRAVITY or category == tpz.magic.buildcat.LULLABY or category == tpz.magic.buildcat.BIND or category == tpz.magic.buildcat.SILENCE then
            delta = 6 -- all NMs have a default delta of 6 for Sleep and Gravity resistance building
        elseif category == tpz.magic.buildcat.STUN then
            delta = 1
        else
            delta = 2 -- default 2 delta for others (40 seconds for full falloff)
        end
    end
    
    if delta == 0 or delta == nil then
        return 1
    end
    
    if category == tpz.magic.buildcat.SLEEP then
        current = target:getLocalVar("BuildSleep")
        lastcast = target:getLocalVar("BuildSleepLast")
        if lastcast ~= 0 and lastcast ~= nil then
            current = current - math.floor((os.time() - lastcast)/20)
        else
            current = 0
        end
        target:setLocalVar("BuildSleepLast",os.time())
        if current < 0 then
            current = 0
        end
        ret = current
        -- this is what we return as current resistance. now add on this spellcast to the build.
        current = current + delta
        if current > 99 then
            current = 99
        end
        target:setLocalVar("BuildSleep",current)
        --print(string.format("current sleep built res is %u",current))
    elseif category == tpz.magic.buildcat.GRAVITY then
        current = target:getLocalVar("BuildGravity")
        lastcast = target:getLocalVar("BuildGravityLast")
        if lastcast ~= 0 and lastcast ~= nil then
            current = current - math.floor((os.time() - lastcast)/20)
        else
            current = 0
        end
        target:setLocalVar("BuildGravityLast",os.time())
        if current < 0 then
            current = 0
        end
        ret = current
        -- this is what we return as current resistance. now add on this spellcast to the build.
        current = current + delta
        if current > 99 then
            current = 99
        end
        target:setLocalVar("BuildGravity",current)
    elseif category == tpz.magic.buildcat.BIND then
        current = target:getLocalVar("BuildBind")
        lastcast = target:getLocalVar("BuildBindLast")
        if lastcast ~= 0 and lastcast ~= nil then
            current = current - math.floor((os.time() - lastcast)/20)
        else
            current = 0
        end
        target:setLocalVar("BuildBindLast",os.time())
        if current < 0 then
            current = 0
        end
        ret = current
        -- this is what we return as current resistance. now add on this spellcast to the build.
        current = current + delta
        if current > 99 then
            current = 99
        end
        target:setLocalVar("BuildBind",current)
    elseif category == tpz.magic.buildcat.SLOW then
        current = target:getLocalVar("BuildSlow")
        lastcast = target:getLocalVar("BuildSlowLast")
        if lastcast ~= 0 and lastcast ~= nil then
            current = current - math.floor((os.time() - lastcast)/20)
        else
            current = 0
        end
        target:setLocalVar("BuildSlowLast",os.time())
        if current < 0 then
            current = 0
        end
        ret = current
        -- this is what we return as current resistance. now add on this spellcast to the build.
        current = current + delta
        if current > 99 then
            current = 99
        end
        target:setLocalVar("BuildSlow",current)
    elseif category == tpz.magic.buildcat.PARALYZE then
        current = target:getLocalVar("BuildParalyze")
        lastcast = target:getLocalVar("BuildParalyzeLast")
        if lastcast ~= 0 and lastcast ~= nil then
            current = current - math.floor((os.time() - lastcast)/20)
        else
            current = 0
        end
        target:setLocalVar("BuildParalyzeLast",os.time())
        if current < 0 then
            current = 0
        end
        ret = current
        -- this is what we return as current resistance. now add on this spellcast to the build.
        current = current + delta
        if current > 99 then
            current = 99
        end
        target:setLocalVar("BuildParalyze",current)
    elseif category == tpz.magic.buildcat.BLIND then
        current = target:getLocalVar("BuildBlind")
        lastcast = target:getLocalVar("BuildBlindLast")
        if lastcast ~= 0 and lastcast ~= nil then
            current = current - math.floor((os.time() - lastcast)/20)
        else
            current = 0
        end
        target:setLocalVar("BuildBlindLast",os.time())
        if current < 0 then
            current = 0
        end
        ret = current
        -- this is what we return as current resistance. now add on this spellcast to the build.
        current = current + delta
        if current > 99 then
            current = 99
        end
        target:setLocalVar("BuildBlind",current)
    elseif category == tpz.magic.buildcat.SILENCE then
        current = target:getLocalVar("BuildSilence")
        lastcast = target:getLocalVar("BuildSilenceLast")
        if lastcast ~= 0 and lastcast ~= nil then
            current = current - math.floor((os.time() - lastcast)/20)
        else
            current = 0
        end
        target:setLocalVar("BuildSilenceLast",os.time())
        if current < 0 then
            current = 0
        end
        ret = current
        -- this is what we return as current resistance. now add on this spellcast to the build.
        current = current + delta
        if current > 99 then
            current = 99
        end
        target:setLocalVar("BuildSilence",current)
    elseif category == tpz.magic.buildcat.STUN then
        current = target:getLocalVar("BuildStun")
        lastcast = target:getLocalVar("BuildStunLast")
        if lastcast ~= 0 and lastcast ~= nil then
            current = current - math.floor((os.time() - lastcast)/20)
        else
            current = 0
        end
        target:setLocalVar("BuildStunLast",os.time())
        if current < 0 then
            current = 0
        end
        ret = current
        -- this is what we return as current resistance. now add on this spellcast to the build.
        current = current + delta
        if current > 99 then
            current = 99
        end
        target:setLocalVar("BuildStun",current)
    elseif category == tpz.magic.buildcat.LULLABY then
        current = target:getLocalVar("BuildLullaby")
        lastcast = target:getLocalVar("BuildLullabyLast")
        if lastcast ~= 0 and lastcast ~= nil then
            current = current - math.floor((os.time() - lastcast)/20)
        else
            current = 0
        end
        target:setLocalVar("BuildLullabyLast",os.time())
        if current < 0 then
            current = 0
        end
        ret = current
        -- this is what we return as current resistance. now add on this spellcast to the build.
        current = current + delta
        if current > 99 then
            current = 99
        end
        target:setLocalVar("BuildLullaby",current)
    end
    
    return 1 - ret/100
end

function calculateMagicDamage(caster, target, spell, params)

    local dINT = caster:getStat(params.attribute) - target:getStat(params.attribute)
    local dmg = params.dmg

    if (dINT <= 0) then --if dINT penalises, it's always M=1
        dmg = dmg + dINT
        if (dmg <= 0) then --dINT penalty cannot result in negative damage (target absorption)
             DMG = math.random(5, 20)
        end
    elseif (dINT > 0 and dINT <= SOFT_CAP) then --The standard calc, most spells hit this
        dmg = dmg + (dINT * params.multiplier)
    elseif (dINT > 0 and dINT > SOFT_CAP and dINT < HARD_CAP) then --After SOFT_CAP, INT is only half effective
        dmg = dmg + SOFT_CAP * params.multiplier + ((dINT - SOFT_CAP) * params.multiplier) / 2
    elseif (dINT > 0 and dINT > SOFT_CAP and dINT >= HARD_CAP) then --After HARD_CAP, INT has no tpz.effect.
        dmg = dmg + HARD_CAP * params.multiplier
    end


    if (params.skillType == tpz.skill.DIVINE_MAGIC and target:isUndead()) then
        -- 150% bonus damage
        dmg = dmg * 1.5
    end

    -- printf("dmg: %d dINT: %d\n", dmg, dINT)

    return dmg

end

function doBoostGain(caster, target, spell, effect)
    local duration = calculateDuration(300, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    --calculate potency
    local magicskill = caster:getSkillLevel(spell:getSkillType())

    local potency = math.floor((magicskill - 300) / 10) + 5

    if potency > 25 then
        potency = 25
    elseif potency < 5 then
        potency = 5
    end

    --printf("BOOST-GAIN: POTENCY = %d", potency)

    --Only one Boost Effect can be active at once, so if the player has any we have to cancel & overwrite
    local effectOverwrite =
    {
        tpz.effect.STR_BOOST,
        tpz.effect.DEX_BOOST,
        tpz.effect.VIT_BOOST,
        tpz.effect.AGI_BOOST,
        tpz.effect.INT_BOOST,
        tpz.effect.MND_BOOST,
        tpz.effect.CHR_BOOST
    }

    for i, effect in ipairs(effectOverwrite) do
            --printf("BOOST-GAIN: CHECKING FOR EFFECT %d...", effect)
            if caster:hasStatusEffect(effect) then
                --printf("BOOST-GAIN: HAS EFFECT %d, DELETING...", effect)
                caster:delStatusEffectSilent(effect)
            end
    end

    if target:addStatusEffect(effect, potency, 0, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end
end

function doEnspell(caster, target, spell, effect)
    local duration = calculateDuration(180, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    --calculate potency
    local magicskill = target:getSkillLevel(tpz.skill.ENHANCING_MAGIC)
	local level = target:getMainLvl()

    local potency = 3 + math.floor(6 * magicskill / 100)
    if magicskill > 200 then
        potency = 5 + math.floor(5 * magicskill / 100)
    end
	if magicskill == 0 then
		potency = 3 + math.floor(level / 10)
	end

    -- Composure doubles Enspell damage and increases Enspell duration to 1 hour
    if caster:hasStatusEffect(tpz.effect.COMPOSURE) then
        potency = potency * 2
        duration = 3600
    end

    if target:addStatusEffect(effect, potency, 0, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end
end

---------------------------------
--   getCurePower returns the caster's cure power
--   getCureFinal returns the final cure amount
--   Source: http://members.shaw.ca/pizza_steve/cure/Cure_Calculator.html
---------------------------------
function getCurePower(caster, isBlueMagic)
    local MND = caster:getStat(tpz.mod.MND)
    local VIT = caster:getStat(tpz.mod.VIT)
    local skill = caster:getSkillLevel(tpz.skill.HEALING_MAGIC)
    local power = math.floor(MND/2) + math.floor(VIT/4) + skill
    return power
end
function getCurePowerOld(caster)
    local MND = caster:getStat(tpz.mod.MND)
    local VIT = caster:getStat(tpz.mod.VIT)
    local skill = caster:getSkillLevel(tpz.skill.HEALING_MAGIC) -- it's healing magic skill for the BLU cures as well
    local power = ((3 * MND) + VIT + (3 * math.floor(skill/5)))
    return power
end
function getBaseCure(power, divisor, constant, basepower)
    return ((power - basepower) / divisor) + constant
end
function getBaseCureOld(power, divisor, constant)
    return (power / 2) / divisor + constant
end

function getCureFinal(caster, spell, basecure, minCure, isBlueMagic)
    if basecure < minCure then
        basecure = minCure
    end

    local curePot = math.min(caster:getMod(tpz.mod.CURE_POTENCY), 50) / 100 -- caps at 50%
    local curePotII = math.min(caster:getMod(tpz.mod.CURE_POTENCY_II), 30) / 100 -- caps at 30%
    local potency = 1 + curePot + curePotII

    local dSeal = 1
    if (caster:hasStatusEffect(tpz.effect.DIVINE_SEAL)) then
        dSeal = 2
    end

    local rapture = 1
    local dayWeatherBonus = 1
    local ele = spell:getElement()

    local castersWeather = caster:getWeather()
    --rapture doesn't affect BLU cures as they're not white magic
    -- weather also doesn't
    if (isBlueMagic == false) then 
        if (caster:hasStatusEffect(tpz.effect.RAPTURE)) then
            rapture = 1.5 + caster:getMod(tpz.mod.RAPTURE_AMOUNT)/100
            caster:delStatusEffectSilent(tpz.effect.RAPTURE)
        end

        if (castersWeather == tpz.magic.singleWeatherStrong[ele]) then
            if (caster:getMod(tpz.mod.IRIDESCENCE) >= 1) then
                if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
                    dayWeatherBonus = dayWeatherBonus + 0.10
                end
            end
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.10
            end
        elseif (castersWeather == tpz.magic.singleWeatherWeak[ele]) then
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus - 0.10
            end
        elseif (castersWeather == tpz.magic.doubleWeatherStrong[ele]) then
            if (caster:getMod(tpz.mod.IRIDESCENCE) >= 1) then
                if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
                    dayWeatherBonus = dayWeatherBonus + 0.10
                end
            end
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.25
            end
        elseif (castersWeather == tpz.magic.doubleWeatherWeak[ele]) then
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus - 0.25
            end
        end

        local dayElement = VanadielDayElement()
        if (dayElement == ele) then
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.10
            end
        elseif (dayElement == tpz.magic.elementDescendant[ele]) then
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus - 0.10
            end
        end

        if (dayWeatherBonus > 1.4) then
            dayWeatherBonus = 1.4
        end
    end

    local final = math.floor(math.floor(math.floor(math.floor(basecure) * potency) * dayWeatherBonus) * rapture) * dSeal
	caster:delStatusEffectSilent(tpz.effect.DIVINE_EMBLEM)
    caster:delStatusEffectSilent(tpz.effect.DIVINE_SEAL)
    return final
end

function getCureAsNukeFinal(caster, spell, power, divisor, constant, basepower)
    return getCureFinal(caster, spell, power, divisor, constant, basepower)
end

function isValidHealTarget(caster, target)
    return target:getAllegiance() == caster:getAllegiance() and
            (target:getObjType() == tpz.objType.PC or
            target:getObjType() == tpz.objType.MOB or
            target:getObjType() == tpz.objType.TRUST or
            target:getObjType() == tpz.objType.FELLOW)
end

-----------------------------------
-- Returns the staff bonus for the caster and spell.
-----------------------------------

-- affinities that strengthen/weaken the index element


function AffinityBonusDmg(caster, ele)

    local affinity = caster:getMod(strongAffinityDmg[ele])
    local bonus = 1.00 + affinity * 0.05 -- 5% per level of affinity
    -- print(bonus)
    return bonus
end

function AffinityBonusAcc(caster, ele)

    local affinity = caster:getMod(strongAffinityAcc[ele])
    local bonus = 0 + affinity * 10 -- 10 acc per level of affinity
    -- print(bonus)
    return bonus
end

-- USED FOR DAMAGING MAGICAL SPELLS. Stage 3 of Calculating Magic Damage on wiki
-- Reduces damage ifit resists.
--
-- Output:
-- The factor to multiply down damage (1/2 1/4 1/8 1/16) - In this format so this func can be used for enfeebs on duration.

function applyResistance(caster, target, spell, params)

  	local diff = params.diff or (caster:getStat(params.attribute) - target:getStat(params.attribute))
    local skill = params.skillType
    local bonus = params.bonus
    -- https://www.bluegartr.com/threads/134257-Status-resistance-and-other-miscellaneous-JP-insights

    local element = spell:getElement()
    local SDT = getElementalSDT(element, target)
    local percentBonus = 0
    local magicaccbonus = getSpellBonusAcc(caster, target, spell, params)
    
    local softcap = params.dStatAccSoftCap -- 10 is set on all nukes. everything else is nil
    if softcap == nil then
        softcap = 10
    end

    if (params.bonus == nil) then
        params.bonus = 0
    end

    -- Apply dStat Macc bonus
    magicaccbonus = magicaccbonus + getDstatBonus(softcap, diff)

    if (bonus ~= nil) then -- seems like this only exists if the spell is threnody. bonus macc when using right ele staff.
        magicaccbonus = magicaccbonus + bonus -- this now also exists for tier 3 "San" Ninjutsu with the appropriate merits
    end

    if (effect ~= nil) then
        percentBonus = percentBonus - getEffectResistance(target, effect) -- this is a HITRATE penalty not a MEVA BOOST (but they are the same thing if macc > meva)
    end -- traits are handled later
    
    if (params.skillBonus ~= nil) then -- bard only it seems like. takes into account signing+instrument skill. i'll need to verify those formulas later
        magicaccbonus = magicaccbonus + params.skillBonus

        -- Add JP Song MACC Bonus
        if caster:isPC() then
            magicaccbonus = magicaccbonus + caster:getJobPointLevel(tpz.jp.SONG_ACC_BONUS)
        end
    end

    local p = getMagicHitRate(caster, target, skill, element, SDT, percentBonus, magicaccbonus, params)
    local res = getMagicResist(p)


    if SDT >= 150 then -- 1.5 guarantees at least half value, no quarter or full resists.
        res = utils.clamp(res, 0.5, 1.0)
    end
	

    if SDT <= 50 then -- .5 or below SDT drops a resist tier
        res = res / 2
    end

    if SDT <= 5 then -- SDT tier .05 makes you lose ALL coin flips
        res = 1/8
    end


    if target:isPC() and element ~= nil and element > 0 and element < 9 then
        -- shiyo's research https://discord.com/channels/799050462539284533/799051759544434698/827052905151332354 (Project Wings Discord)
        local eleres = target:getMod(element+53)
        if     eleres < params.bonus  and res < 0.5  then res = 0.5
        elseif eleres < (params.bonus + 1) and res < 0.25 then res = 0.25 end
    end
    -- print(string.format("res was %f",res))
    
    return res
end

-- USED FOR Status Effect Enfeebs (blind, slow, para, etc.)
-- Output:
-- The factor to multiply down duration (1/2 1/4 1/8 1/16)
--[[
local params = {}
params.attribute = $2
params.skillType = $3
params.bonus = $4
params.effect = $5
]]
function applyResistanceEffect(caster, target, spell, params) -- says "effect" but this is the global resistance fetching formula, even for damage spells

    local effect = params.effect
    if effect ~= nil and math.random() < getEffectResistanceTraitChance(caster, target, effect) then
        if not IgnoreResTraitCheck(caster) then -- Elemental Seal and Stymie bypasses resist traits
            -- print("restrait proc!")
            return 0 -- this will make any status effect fail. this takes into account trait+food+gear
        end
    end

    if effect ~= nil then
        if target:hasStatusEffect(tpz.effect.FEALTY) then -- Fealty forces full resist on enfeebles
            return 1/16
         end
    end
    
	local diff = params.diff or (caster:getStat(params.attribute) - target:getStat(params.attribute))
    local skill = params.skillType
    local bonus = params.bonus
    -- https://www.bluegartr.com/threads/134257-Status-resistance-and-other-miscellaneous-JP-insights

    local element = spell:getElement()
    local SDT = getEnfeeblelSDT(effect, element, target)
    local percentBonus = 0
    local magicaccbonus = getSpellBonusAcc(caster, target, spell, params)
    
    local softcap = params.dStatAccSoftCap -- 10 is set on all nukes. everything else is nil
    if softcap == nil then
        softcap = 10
    end

    if (params.bonus == nil) then
        params.bonus = 0
    end

    -- Apply dStat Macc bonus
    magicaccbonus = magicaccbonus + getDstatBonus(softcap, diff)

    if (bonus ~= nil) then -- seems like this only exists if the spell is threnody. bonus macc when using right ele staff.
        magicaccbonus = magicaccbonus + bonus -- this now also exists for tier 3 "San" Ninjutsu with the appropriate merits
    end

    if (effect ~= nil) then
        percentBonus = percentBonus - getEffectResistance(target, effect) -- this is a HITRATE penalty not a MEVA BOOST (but they are the same thing if macc > meva)
    end -- traits are handled later
    
    if params.skillBonus ~= nil then -- bard only it seems like. takes into account signing+instrument skill. i'll need to verify those formulas later
        magicaccbonus = magicaccbonus + params.skillBonus

        -- Add JP Song MACC Bonus
        if caster:isPC() then
            magicaccbonus = magicaccbonus + caster:getJobPointLevel(tpz.jp.SONG_ACC_BONUS)
        end
    end

    -- Apply "Status EfFect" Magic Accuracy Mod
    magicaccbonus = magicaccbonus + caster:getMod(tpz.mod.STATUS_EFFECT_MACC)

    local p = getMagicHitRate(caster, target, skill, element, SDT, percentBonus, magicaccbonus, params)
    local res = getMagicResist(p)

    if SDT <= 5 then -- SDT tier .05 makes you lose ALL coin flips
        res = 1/8
    end

    -- Check for guaranteed landing mod (tpz.mod.DIVINE_NEVER_MISS etc) or Stymie
    if CheckForGuaranteedLandRate(caster, params) or caster:hasStatusEffect(tpz.effect.STYMIE) and (SDT > 10) then
        -- printf("Spell is guaranteed to land!")
        res = 1
    end

    if target:isPC() and element ~= nil and element > 0 and element < 9 then
        -- shiyo's research https://discord.com/channels/799050462539284533/799051759544434698/827052905151332354 (Project Wings Discord)
        local eleres = target:getMod(element+53)
        if     eleres < params.bonus  and res < 0.5  then res = 0.5
        elseif eleres < (params.bonus + 1) and res < 0.25 then res = 0.25 end
    end

    -- print(string.format("enfeeble res was %f", res))
    
    return res
end

-- Applies resistance for things that may not be spells - ie. Quick Draw
function applyResistanceAbility(player, target, element, skill, bonus)

    local params = {}
    local SDT = getElementalSDT(element, target)
    local p = getMagicHitRate(player, target, skill, element, SDT, 0, bonus, params)
    local res = getMagicResist(p)

    if target:hasStatusEffect(tpz.effect.FEALTY) then
        return 1/16
    end

    if SDT <= 5 then -- SDT tier .05 makes you lose ALL coin flips
        res = 1/8
    end

    return res
end

-- Applies resistance for additional effects
function applyResistanceAddEffect(player, target, element, bonus, effect)

    local SDT = getElementalSDT(element, target)

    if target:hasStatusEffect(tpz.effect.FEALTY) then
        return 1/16
    end

    if (effect ~= nil) then
        SDT = getEnfeeblelSDT(effect, element, target)
    end

    if (bonus == nil) then
        bonus = 0
    end

    local params = {}
    params.effect = effect

    local p = getMagicHitRate(player, target, 0, element, SDT, 0, bonus, params)
	local res = getMagicResist(p)

    if (effect == nil) then
        if SDT >= 150 then -- 1.5 guarantees at least half value, no quarter or full resists.
            res = utils.clamp(res, 0.5, 1.0)
        end

        --printf("res before SDT %d", res * 100)
        if SDT <= 50 then -- .5 or below SDT drops a resist tier
            res = res / 2
        end
    end

    if SDT <= 5 then -- SDT tier .05 makes you lose ALL coin flips
        res = 1/8
    end

    if target:isPC() and element ~= nil and element > 0 and element < 9 then
        -- shiyo's research https://discord.com/channels/799050462539284533/799051759544434698/827052905151332354 (Project Wings Discord)
        local eleres = target:getMod(element+53)
        if     eleres < bonus  and res < 0.5  then res = 0.5
        elseif eleres < (bonus + 1) and res < 0.25 then res = 0.25 end
    end
    -- printf("res was %f", res)
    return res
end

function getMagicHitRate(caster, target, skillType, element, SDT, percentBonus, bonusAcc, params) -- TODO: add SDT arg to calls

    -- Resist everything if magic shield is active
    -- BLU spells ignore this
    if (skillType ~= tpz.skill.BLUE_MAGIC) then
        if target:isMob() and (target:hasStatusEffect(tpz.effect.MAGIC_SHIELD, 0)) then
            if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() < 2 then
                return 0
            end
        end
    end

    local magiceva = 0
    local effect = params.effect

    if (bonusAcc == nil) then
        bonusAcc = 0
    end

    local magicacc = caster:getMod(tpz.mod.MACC) + caster:getILvlMacc()
	
    -- Get the base acc (just skill + skill mod (79 + skillID = ModID) + magic acc mod)
    if skillType ~= 0 then
        local skillBonus = 0
        local skillAmount = caster:getSkillLevel(skillType)
        skillBonus = skillAmount
        magicacc = magicacc + skillBonus
    else
        -- for mob skills / additional effects which don't have a skill
        magicacc = magicacc + utils.getSkillLvl(1, caster:getMainLvl())
    end

    local resMod = 0 -- Some spells may possibly be non elemental, but have status effects.

    if (element > 0) and (effect == nil) then -- Element resist does not work on status effects with an EEM(Like para)
        resMod = target:getMod(tpz.magic.resistMod[element])
        -- Add acc for elemental affinity accuracy and element specific accuracy
        local affinityBonus = AffinityBonusAcc(caster, element)
        local elementBonus = caster:getMod(spellAcc[element])
        -- print(elementBonus)
        bonusAcc = bonusAcc + affinityBonus + elementBonus
        -- Apply resistance mods
        bonusAcc = bonusAcc - resMod
    end

    magicacc = magicacc + caster:getMerit(tpz.merit.MAGIC_ACCURACY)

    magicacc = magicacc + caster:getMerit(tpz.merit.NIN_MAGIC_ACCURACY)

    -- Base magic evasion (base magic evasion plus resistances(players), plus elemental defense(mobs)
    -- target:getMod(MEVA) is set to a capped skill of rank C when the mob spawns
    -- formula = Rank C skill @ level * EEM tier multi
    -- where 100% is t = 0, 115% is t = -1, and 85% is t = 1
    -- 10% tier auto floors your hit rate, 5% auto fails

    -- Callculate base magic evasion. F for players C for everything else
    local baseMagiceva

    if target:isPC() then
        baseMagiceva = math.floor(utils.getSkillLvl(12, target:getMainLvl())) -- 171 for a level 75 player
    else
        baseMagiceva = math.floor(utils.getMobSkillLvl(3, target:getMainLvl()))
    end
    -- printf("Base MEVA: %s", baseMagiceva)
    -- get +MEVA mod
    local mevaMod = target:getMod(tpz.mod.MEVA) - baseMagiceva
    -- printf("mevaMod: %s", mevaMod)
    -- apply SDT
    local tier = getSDTTier(SDT)
    local multiplier = getSDTMultiplier(tier)
    -- print(string.format('SDT: %s, Tier: %s, Multiplier: %s', SDT, tier, multiplier))
    baseMagiceva = math.floor(baseMagiceva * multiplier)
    -- printf("Base MEVA after multiplier: %s", baseMagiceva)
    -- add +MEVA mod
    local magiceva = baseMagiceva + mevaMod
    -- printf("MEVA after +MEVA mod: %s", magiceva)
    -- add resist gear/mods(barspells etc)
    magiceva = magiceva + resMod
    -- printf("MEVA after gear/barspells: %s", magiceva)
    magicacc = math.floor(magicacc + bonusAcc)

    -- Add macc% from food
    local maccFood = magicacc * (caster:getMod(tpz.mod.FOOD_MACCP)/100)
    magicacc = math.floor(magicacc + utils.clamp(maccFood, 0, caster:getMod(tpz.mod.FOOD_MACC_CAP)))
    -- printf("MACC: %s", magicacc)
    
    return calculateMagicHitRate(magicacc, magiceva, element, percentBonus, caster:getMainLvl(), target:getMainLvl(), SDT)
end

function calculateMagicHitRate(magicacc, magiceva, element, percentBonus, casterLvl, targetLvl, SDT)
    local p = 0
    
    -- percentBonus is a bit deceiving of a name. it's either 0 or a negative number. its only application is specific effect resistance (i.e. +5 resist to paralyze = -5% hitrate on incoming paras)
    -- note that this has nothing to do with the resist TRAIT which is handled BEFORE rate calculations. gear bonuses (i.e. "Enhances Resist Paralyze Effect") count as traits.
    -- If dMAcc < 0, Magic Hit Rate = 55% + floor( dMAcc÷2 ) = magic hit rate
    -- If dMAcc ≥ 0, Magic Hit Rate = 55% + dMAcc = magic hit rate
    
    magicacc = magicacc + (casterLvl - targetLvl)*4
    local dMAcc = magicacc - magiceva
    -- printf("dMAcc %s", dMAcc)
    -- FOR TESTING MACC AND MEVA!
    -- print(string.format("magicacc = %u, magiceva = %u",magicacc,magiceva))
    --GetPlayerByID(2):PrintToPlayer(string.format("magicacc = %u, magiceva = %u",magicacc,magiceva))
    if dMAcc < 0 then -- when penalty, half effective
        p = 50 + math.floor(dMAcc/2)
    else
        p = 50 + dMAcc
    end
    p = utils.clamp(p, 5, 95)
    
    p = p + percentBonus

    -- Check SDT tiers
    local tier = getSDTTier(SDT)
    -- print(string.format('calculateMagicHitRate SDT: %s, Tier: %s,', SDT, tier))
    -- T10 sets your hit rate to 5% max
    if (tier >= 10) then
        p = 5
    end
    p = utils.clamp(p, 5, 95)
    -- print(string.format("Magic Hit Rate(p): %u",p))

    return utils.clamp(p, 5, 95)
end

-- Returns resistance value from given magic hit rate (p)
function getMagicResist(magicHitRate)

    local p = magicHitRate / 100
    local resist = 1

    -- Resistance thresholds based on p.  A higher p leads to lower resist rates, and a lower p leads to higher resist rates.
    local half = (1 - p)
    local quart = ((1 - p)^2)
    local eighth = ((1 - p)^3)
    -- local sixteenth = ((1 - p)^4)
    -- print("HALF: "..half)
    -- print("QUART: "..quart)
    -- print("EIGHTH: "..eighth)
    -- print("SIXTEENTH: "..sixteenth)

    local resvar = math.random()

    -- sixteenth section removed as it is not obtainable under normal circumstances... requires getting a 1/8th roll reduced by half via a 50% or lower SDT tier
    if (resvar <= eighth) then
        resist = 0.125
        --printf("Spell resisted to 1/8!  Threshold = %u",eighth)
    elseif (resvar <= quart) then
        resist = 0.25
        --printf("Spell resisted to 1/4.  Threshold = %u",quart)
    elseif (resvar <= half) then
        resist = 0.5
        --printf("Spell resisted to 1/2.  Threshold = %u",half)
    else
        resist = 1.0
        --printf("1.0")
    end
    -- printf("Resist: %s", resist)

    return resist
end

function getEffectResistanceTraitChance(caster, target, effect)
    local effectres = 0
    if (effect == tpz.effect.SLEEP_I or effect == tpz.effect.SLEEP_II or effect == tpz.effect.LULLABY) then
        effectres = tpz.mod.SLEEPRESTRAIT
    elseif (effect == tpz.effect.POISON) then
        effectres = tpz.mod.POISONRESTRAIT
    elseif (effect == tpz.effect.PARALYSIS) then
        effectres = tpz.mod.PARALYZERESTRAIT
    elseif (effect == tpz.effect.BLINDNESS) then
        effectres = tpz.mod.BLINDRESTRAIT
    elseif (effect == tpz.effect.SILENCE) then
        effectres = tpz.mod.SILENCERESTRAIT
    elseif (effect == tpz.effect.PLAGUE or effect == tpz.effect.DISEASE) then
        effectres = tpz.mod.VIRUSRESTRAIT
    elseif (effect == tpz.effect.PETRIFICATION) then
        effectres = tpz.mod.PETRIFYRESTRAIT
    elseif (effect == tpz.effect.BIND) then
        effectres = tpz.mod.BINDRESTRAIT
    elseif (effect == tpz.effect.CURSE_I or effect == tpz.effect.CURSE_II or effect == tpz.effect.BANE) then
        effectres = tpz.mod.CURSERESTRAIT
    elseif (effect == tpz.effect.WEIGHT) then
        effectres = tpz.mod.GRAVITYRESTRAIT
    elseif (effect == tpz.effect.SLOW or effect == tpz.effect.ADDLE) then
        effectres = tpz.mod.SLOWRESTRAIT
    elseif (effect == tpz.effect.STUN) then
        effectres = tpz.mod.STUNRESTRAIT
    elseif (effect == tpz.effect.CHARM) then
        effectres = tpz.mod.CHARMRESTRAIT
    elseif (effect == tpz.effect.AMNESIA) then
        effectres = tpz.mod.AMNESIARESTRAIT
    elseif (effect == tpz.effect.KO) then
        effectres = tpz.mod.DEATHRESTRAIT
    end
    
    if (effectres ~= 0) then
        local ret = target:getMod(effectres) + target:getMod(tpz.mod.STATUSRESTRAIT) -- TODO: Test
        if (not caster:isPC()) and caster:isNM() then
            ret = math.floor(ret/2)
        end

        return ret/100
    end

    return 0
end

-- Returns the amount of resistance the
-- target has to the given effect (stun, sleep, etc..)
function getEffectResistance(target, effect)
    local effectres = 0
    local statusres = target:getMod(tpz.mod.STATUSRES)
    if (effect == tpz.effect.SLEEP_I or effect == tpz.effect.SLEEP_II) then
        effectres = tpz.mod.SLEEPRES
    elseif (effect == tpz.effect.LULLABY) then
        effectres = tpz.mod.LULLABYRES
    elseif (effect == tpz.effect.POISON) then
        effectres = tpz.mod.POISONRES
    elseif (effect == tpz.effect.PARALYSIS) then
        effectres = tpz.mod.PARALYZERES
    elseif (effect == tpz.effect.BLINDNESS) then
        effectres = tpz.mod.BLINDRES
    elseif (effect == tpz.effect.SILENCE) then
        effectres = tpz.mod.SILENCERES
    elseif (effect == tpz.effect.PLAGUE or effect == tpz.effect.DISEASE) then
        effectres = tpz.mod.VIRUSRES
    elseif (effect == tpz.effect.PETRIFICATION) then
        effectres = tpz.mod.PETRIFYRES
    elseif (effect == tpz.effect.BIND) then
        effectres = tpz.mod.BINDRES
    elseif (effect == tpz.effect.CURSE_I or effect == tpz.effect.CURSE_II or effect == tpz.effect.BANE) then
        effectres = tpz.mod.CURSERES
    elseif (effect == tpz.effect.WEIGHT) then
        effectres = tpz.mod.GRAVITYRES
    elseif (effect == tpz.effect.SLOW or effect == tpz.effect.ELEGY) then
        effectres = tpz.mod.SLOWRES
    elseif (effect == tpz.effect.STUN) then
        effectres = tpz.mod.STUNRES
    elseif (effect == tpz.effect.CHARM) then
        effectres = tpz.mod.CHARMRES
    elseif (effect == tpz.effect.AMNESIA) then
        effectres = tpz.mod.AMNESIARES
    elseif (effect == tpz.effect.KO) then
        effectres = tpz.mod.DEATHRES
    end

    if (effectres ~= 0) then
        return target:getMod(effectres) + statusres
    end

    return statusres
end

-- Returns the bonus magic accuracy for any spell
function getSpellBonusAcc(caster, target, spell, params)
    local magicAccBonus = 0
    local castersWeather = caster:getWeather()
    local skill = spell:getSkillType()
    local spellGroup = spell:getSpellGroup()
    local element = spell:getElement()

    if caster:hasStatusEffect(tpz.effect.ALTRUISM) and spellGroup == tpz.magic.spellGroup.WHITE then
        magicAccBonus = magicAccBonus + caster:getStatusEffect(tpz.effect.ALTRUISM):getPower()
    end

    if caster:hasStatusEffect(tpz.effect.FOCALIZATION) and spellGroup == tpz.magic.spellGroup.BLACK then
        magicAccBonus = magicAccBonus + caster:getStatusEffect(tpz.effect.FOCALIZATION):getPower()
    end

    local skillchainTier, skillchainCount = FormMagicBurst(element, target)

    --add macc for skillchains
    if (skillchainTier > 0) then
        magicAccBonus = magicAccBonus + 50 -- 30 in retail
    end

    --Add acc for klimaform
    if element > 0 then
        if caster:hasStatusEffect(tpz.effect.KLIMAFORM) and (castersWeather == tpz.magic.singleWeatherStrong[element] or castersWeather == tpz.magic.doubleWeatherStrong[element]) then
            magicAccBonus = magicAccBonus + 15
        end
    end

    --add for blm elemental magic merits
    --if skill == tpz.skill.ELEMENTAL_MAGIC then
        --magicAccBonus = magicAccBonus + caster:getMerit(tpz.merit.ELEMENTAL_MAGIC_ACCURACY)
    --end

    -- Add acc for dark seal
    if (skill == tpz.skill.DARK_MAGIC and caster:hasStatusEffect(tpz.effect.DARK_SEAL)) then
        magicAccBonus = magicAccBonus + 256
    end

    -- Add acc for RDM group 1 merits
    if (element >= tpz.magic.element.FIRE and element <= tpz.magic.element.WATER) then
        magicAccBonus = magicAccBonus + caster:getMerit(rdmMerit[element])
    end

    -- BLU mag acc merits - nuke acc is handled in bluemagic.lua
    if (skill == tpz.skill.BLUE_MAGIC) then
        magicAccBonus = magicAccBonus + caster:getMerit(tpz.merit.MAGICAL_ACCURACY)
    end

    -- Add Job points magic accuracy Bonus
    magicAccBonus = magicAccBonus + JobPointsMacc(caster, target, spell)

    -- Add weather bonus
    magicAccBonus = magicAccBonus + addWeatherMaccBonus(caster, spell, target, params)

    return magicAccBonus
end

function handleAfflatusMisery(caster, spell, dmg)
    if (caster:hasStatusEffect(tpz.effect.AFFLATUS_MISERY)) then
        local misery = caster:getMod(tpz.mod.AFFLATUS_MISERY)
        -- According to BGWiki Caps at 300 magic damage.
        local miseryMax = 300

        --miseryMax = miseryMax * (1 - caster:getMerit(tpz.merit.ANIMUS_MISERY)/100)

        -- BGwiki puts the boost capping at 200% bonus at 1/4th max HP.
        if (misery > miseryMax) then
            misery = miseryMax
        end

        -- Damage is 2x at boost cap.
        local boost = 1 + (misery / miseryMax)

        dmg = math.floor(dmg * boost)

        -- printf("AFFLATUS MISERY: Damage boosted by %f to %d", boost, dmg)

        --Afflatus Mod is Used Up...
        caster:setMod(tpz.mod.AFFLATUS_MISERY, 0)
    end
    return dmg
end

function finalMagicAdjustments(caster, target, spell, dmg)
    --Handles target's HP adjustment and returns UNSIGNED dmg (absorb message is set in this function)

    local skill = spell:getSkillType()
    if (skill == tpz.skill.ELEMENTAL_MAGIC) then
        dmg = dmg * ELEMENTAL_POWER
    elseif (skill == tpz.skill.DARK_MAGIC) then
        dmg = dmg * DARK_POWER
        local id = spell:getID()
    elseif (skill == tpz.skill.NINJUTSU) then
        dmg = dmg * NINJUTSU_POWER
    elseif (skill == tpz.skill.DIVINE_MAGIC) then
        dmg = dmg * DIVINE_POWER
    end
    
    -- Circle Effects
    if target:isMob() and dmg > 0 then
        local eco = target:getSystem()
        local circlemult = 100
        local mod = 0
        
        if     eco == 1  then mod = 1226
        elseif eco == 2  then mod = 1228
        elseif eco == 3  then mod = 1232
        elseif eco == 6  then mod = 1230
        elseif eco == 8  then mod = 1225
        elseif eco == 9  then mod = 1234
        elseif eco == 10 then mod = 1233
        elseif eco == 14 then mod = 1227
        elseif eco == 16 then mod = 1238
        elseif eco == 15 then mod = 1237
        elseif eco == 17 then mod = 1229
        elseif eco == 19 then mod = 1231
        elseif eco == 20 then mod = 1224
        end
        
        if mod > 0 then
            circlemult = circlemult + caster:getMod(mod)
        end
        
        dmg = math.floor(dmg * circlemult / 100)
    end

    -- Handle Scarlet Delirium
    dmg = utils.ScarletDeliriumBonus(caster, dmg)

    -- Handle Positional MDT
    if caster:isInfront(target, 90) and target:hasStatusEffect(tpz.effect.MAGIC_SHIELD) then -- Front
        if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() == 3 then
            dmg = 0
        end
        if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() == 5 then
            dmg = math.floor(dmg * 0.25) -- 75% DR
        end
        if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() == 6 then
            dmg = math.floor(dmg * 0.50) -- 50% DR
        end
    end
    if caster:isBehind(target, 90) and target:hasStatusEffect(tpz.effect.MAGIC_SHIELD) then -- Behind
        if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() == 4 then
            dmg = 0
        end
        if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() == 7 then
            dmg = math.floor(dmg * 0.25) -- 75% DR
        end
        if target:getStatusEffect(tpz.effect.MAGIC_SHIELD):getPower() == 8 then
            dmg = math.floor(dmg * 0.50) -- 50% DR
        end
    end

    -- add on ice maker bonus(if automaton)
    if caster:isPet() then
        local iceMakerBonus = 1 + (caster:getLocalVar("ice_maker_bonus") / 100)
        dmg = math.floor(dmg * iceMakerBonus)
    end

    local element = spell:getElement()
    dmg = target:magicDmgTaken(dmg, element)

    if (dmg > 0) then
        if not (spell:getID() == 247) and not (spell:getID() == 248) then -- Aspir isn't reduced by Phalanx
            dmg = dmg - target:getMod(tpz.mod.PHALANX)
        end
        dmg = utils.clamp(dmg, 0, 99999)
    end

    --handling rampart stoneskin
    dmg = utils.rampartstoneskin(target, dmg)
    
    --handling stoneskin
    dmg = utils.stoneskin(target, dmg)
    dmg = utils.clamp(dmg, -99999, 99999)

    if (dmg < 0) then
        dmg = target:addHP(-dmg)
        spell:setMsg(tpz.msg.basic.MAGIC_RECOVERS_HP)
    else
        target:takeSpellDamage(caster, spell, dmg, tpz.attackType.MAGICAL, tpz.damageType.ELEMENTAL + spell:getElement())
        target:handleAfflatusMiseryDamage(dmg)
        target:updateEnmityFromDamage(caster, dmg)
        -- Only add TP if the target is a mob
        if (dmg > 0) then
            if (target:getObjType() ~= tpz.objType.PC) then
                local tpGiven = utils.CalculateSpellTPGiven(caster, target)
                -- printf("TP given: %d", tpGiven)
                target:addTP(tpGiven)
            end
        end
    end
	caster:delStatusEffectSilent(tpz.effect.DIVINE_EMBLEM)
    caster:delStatusEffectSilent(tpz.effect.CASCADE)

    return dmg
 end

 -- Used only for weapon additional effects that haven't been converted to the new functions
function finalMagicNonSpellAdjustments(caster, target, ele, dmg)
    --Handles target's HP adjustment and returns SIGNED dmg (negative values on absorb)

    dmg = target:magicDmgTaken(dmg, ele)

    if (dmg > 0) then
        dmg = dmg - target:getMod(tpz.mod.PHALANX)
        dmg = utils.clamp(dmg, 0, 99999)
    end

    --handling rampart stoneskin
    dmg = utils.rampartstoneskin(target, dmg)

    --handling stoneskin
    dmg = utils.stoneskin(target, dmg)

    dmg = utils.clamp(dmg, -99999, 99999)

    if (dmg < 0) then
        dmg = -(target:addHP(-dmg))
    else
        target:takeDamage(dmg, caster, tpz.attackType.MAGICAL, tpz.damageType.ELEMENTAL + ele)
    end
    --Not updating enmity from damage, as this is primarily used for additional effects (which don't generate emnity)
    -- in the case that updating enmity is needed, do it manually after calling this
    --target:updateEnmityFromDamage(caster, dmg)

    return dmg
end

-- No longer needed, added to core
function adjustForTarget(target, dmg, ele)
    return dmg
end

function calculateMagicBurst(caster, spell, target, params)

    local burst = 1.0
    local skillchainburst = 1.0
    local modburst = 1.0

    if (spell:getSpellGroup() == 3 and not caster:hasStatusEffect(tpz.effect.BURST_AFFINITY)) then
        return burst
    end

    -- Obtain first multiplier from gear, atma and job traits
    modburst = modburst + (caster:getMod(tpz.mod.MAG_BURST_BONUS) / 100) + params.AMIIburstBonus

    -- BLM Job Point: Magic Burst Damage
    modburst = modburst + (caster:getJobPointLevel(tpz.jp.MAGIC_BURST_DMG_BONUS) / 100)

    -- Cap bonuses from first multiplier at 40% or 1.4
    if (modburst > 1.4) then
        modburst = 1.4
    end

    -- Innin adds +30 Magic Burst bonus that bypasses the 40 cap
    if caster:isBehind(target, 90) and caster:hasStatusEffect(tpz.effect.INNIN) then 
        modburst = modburst + 0.30 + (caster:getMerit(tpz.merit.INNIN_EFFECT)/100)
    end

    -- Obtain second multiplier from skillchain
    -- Starts at 35% damage bonus, increases by 10% for every additional weaponskill in the chain
    local skillchainTier, skillchainCount = FormMagicBurst(spell:getElement(), target)

    if (skillchainTier > 0) then
        if (skillchainCount == 1) then -- two weaponskills
            skillchainburst = 1.5 -- was 1.35
        elseif (skillchainCount == 2) then -- three weaponskills
            skillchainburst = 1.6 -- was 1.45
        elseif (skillchainCount == 3) then -- four weaponskills
             skillchainburst = 1.7 -- was 1.55
        elseif (skillchainCount == 4) then -- five weaponskills
            skillchainburst = 1.8 -- was 1.65
        elseif (skillchainCount == 5) then -- six weaponskills
            skillchainburst = 2.0 -- was 1.75
        else
            -- Something strange is going on if this occurs.
            skillchainburst = 1.0
        end
    end

    -- Apply DMGMB Mod
    local burstdmgtaken = 1
    local dmgmb = 1 + (utils.clamp(target:getMod(tpz.mod.DMGMB), -100, 100) / 100)

    burstdmgtaken = burstdmgtaken * dmgmb

    -- Multiply
    if (skillchainburst > 1) then
        burst = burst * modburst * skillchainburst * burstdmgtaken
    end

    return burst
end

function addBonuses(caster, spell, target, dmg, params)
    params = params or {}

    local ele = spell:getElement()

    local affinityBonus = AffinityBonusDmg(caster, ele)
    dmg = math.floor(dmg * affinityBonus)

    params.bonusmab = params.bonusmab or 0
    params.AMIIburstBonus = params.AMIIburstBonus or 0

    local magicDefense = getElementalDamageReduction(target, ele) -- special defense
    dmg = math.floor(dmg * magicDefense)

    local dayWeatherBonus = 1.00
    local weather = caster:getWeather()
    local casterJob = caster:getMainJob()

    if (weather == tpz.magic.singleWeatherStrong[ele]) then
        if (caster:getMod(tpz.mod.IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
                dayWeatherBonus = dayWeatherBonus + 0.10
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus + 0.10
        end
    elseif (caster:getWeather() == tpz.magic.singleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus - 0.10
        end
    elseif (weather == tpz.magic.doubleWeatherStrong[ele]) then
        if (caster:getMod(tpz.mod.IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
                dayWeatherBonus = dayWeatherBonus + 0.10
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus + 0.25
        end
    elseif (weather == tpz.magic.doubleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus - 0.25
        end
    end

    local dayElement = VanadielDayElement()
    if (dayElement == ele) then
        dayWeatherBonus = dayWeatherBonus + caster:getMod(tpz.mod.DAY_NUKE_BONUS)/100 -- sorc. tonban(+1)/zodiac ring
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus + 0.10
        end
    elseif (dayElement == tpz.magic.elementDescendant[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus - 0.10
        end
    end

    if dayWeatherBonus > 1.4 then
        dayWeatherBonus = 1.4
    end

    dmg = math.floor(dmg * dayWeatherBonus)

    local burst = calculateMagicBurst(caster, spell, target, params)

    if (burst > 1.0) then
        spell:setMsg(spell:getMagicBurstMessage()) -- "Magic Burst!"
        spell:setMPCost(0) -- Remove the MP cost on bursted spells
    end

    dmg = math.floor(dmg * burst)
    local mabbonus = 0
    local spellId = spell:getID()

    if (spellId >= 245 and spellId <= 248) then -- Drain/Aspir (II)
        mabbonus = 1 + caster:getMod(tpz.mod.ENH_DRAIN_ASPIR)/100
        --if spellId == 247 or spellId == 248 then
            --mabbonus = mabbonus + caster:getMerit(tpz.merit.ASPIR_ABSORPTION_AMOUNT)/100
        --end
    else
        local mab = caster:getMod(tpz.mod.MATT) + params.bonusmab

        if spell:getSkillType() == tpz.skill.NINJUTSU then
            mab = mab + caster:getMerit(tpz.merit.NIN_MAGIC_BONUS)
        end

        local mab_crit = caster:getMod(tpz.mod.MAGIC_CRITHITRATE)
        if ( math.random(1, 100) < mab_crit ) then
           mab = mab + ( 10 + caster:getMod(tpz.mod.MAGIC_CRIT_DMG_INCREASE ) )
        end

        local mdefBarBonus = 0
        if (ele >= tpz.magic.element.FIRE and ele <= tpz.magic.element.WATER) then
            mab = mab + caster:getMerit(blmMerit[ele])
            if (target:hasStatusEffect(tpz.magic.barSpell[ele])) then -- bar- spell magic defense bonus
                mdefBarBonus = target:getStatusEffect(tpz.magic.barSpell[ele]):getSubPower()
            end
        end

        if caster:isPC() then
            if (casterJob == tpz.job.RDM) then
                mab = mab + caster:getJobPointLevel(tpz.jp.RDM_MAGIC_ATK_BONUS)
            elseif (casterJob == tpz.job.GEO) then
                mab = mab + caster:getJobPointLevel(tpz.jp.GEO_MAGIC_ATK_BONUS)
            end
        end

        mabbonus = (100 + mab) / (100 + target:getMod(tpz.mod.MDEF) + mdefBarBonus)
    end

    if (mabbonus < 0) then
        mabbonus = 0
    end

    dmg = math.floor(dmg * mabbonus)

    if (caster:hasStatusEffect(tpz.effect.EBULLIENCE)) then
        dmg = dmg * (1.2 + caster:getMod(tpz.mod.EBULLIENCE_AMOUNT)/100)
        caster:delStatusEffectSilent(tpz.effect.EBULLIENCE)
    end

    dmg = math.floor(dmg)

    -- print(affinityBonus)
    -- print(speciesReduction)
    -- print(dayWeatherBonus)
    -- print(burst)
    -- print(mab)
    -- print(magicDmgMod)

    return dmg
end

function addWeatherMaccBonus(caster, spell, target, params)
    local ele = spell:getElement()
    local dayWeatherBonus = 0
    local weather = caster:getWeather()

    if (weather == tpz.magic.singleWeatherStrong[ele]) then
        if (caster:getMod(tpz.mod.IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
                dayWeatherBonus = dayWeatherBonus + 5
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus + 5
        end
    elseif (caster:getWeather() == tpz.magic.singleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus - 5
        end
    elseif (weather == tpz.magic.doubleWeatherStrong[ele]) then
        if (caster:getMod(tpz.mod.IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
                dayWeatherBonus = dayWeatherBonus + 5
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus + 15
        end
    elseif (weather == tpz.magic.doubleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus - 15
        end
    end

    local dayElement = VanadielDayElement()
    if (dayElement == ele) then
        dayWeatherBonus = dayWeatherBonus + caster:getMod(tpz.mod.DAY_NUKE_BONUS)/100 -- sorc. tonban(+1)/zodiac ring
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus + 5
        end
    elseif (dayElement == tpz.magic.elementDescendant[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus - 5
        end
    end

    if dayWeatherBonus > 15 then
        dayWeatherBonus = 15
    end

    return dayWeatherBonus
end

function addBonusesAbility(caster, ele, target, dmg, params)

    local affinityBonus = AffinityBonusDmg(caster, ele)
    dmg = math.floor(dmg * affinityBonus)

    local magicDefense = getElementalDamageReduction(target, ele)
    dmg = math.floor(dmg * magicDefense)

    local dayWeatherBonus = 1.00
    local weather = caster:getWeather()

    if (weather == tpz.magic.singleWeatherStrong[ele]) then
        if (caster:getMod(tpz.mod.IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.10
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.10
        end
    elseif (caster:getWeather() == tpz.magic.singleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.10
        end
    elseif (weather == tpz.magic.doubleWeatherStrong[ele]) then
        if (caster:getMod(tpz.mod.IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.10
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.25
        end
    elseif (weather == tpz.magic.doubleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.25
        end
    end

    local dayElement = VanadielDayElement()
    if (dayElement == ele) then
        dayWeatherBonus = dayWeatherBonus + caster:getMod(tpz.mod.DAY_NUKE_BONUS)/100 -- sorc. tonban(+1)/zodiac ring
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.10
        end
    elseif (dayElement == tpz.magic.elementDescendant[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.10
        end
    end

    if dayWeatherBonus > 1.4 then
        dayWeatherBonus = 1.4
    end

    dmg = math.floor(dmg * dayWeatherBonus)

    local mab = 1
    local mdefBarBonus = 0
    if
        ele >= tpz.magic.element.FIRE and
        ele <= tpz.magic.element.WATER and
        target:hasStatusEffect(tpz.magic.barSpell[ele])
    then -- bar- spell magic defense bonus
        mdefBarBonus = target:getStatusEffect(tpz.magic.barSpell[ele]):getSubPower()
    end

    if (params ~= nil and params.bonusmab ~= nil and params.includemab == true) then
        mab = (100 + caster:getMod(tpz.mod.MATT) + params.bonusmab) / (100 + target:getMod(tpz.mod.MDEF) + mdefBarBonus)
    elseif (params == nil or (params ~= nil and params.includemab == true)) then
        mab = (100 + caster:getMod(tpz.mod.MATT)) / (100 + target:getMod(tpz.mod.MDEF) + mdefBarBonus)
    end

    if (mab < 0) then
        mab = 0
    end

    dmg = math.floor(dmg * mab)

    -- print(affinityBonus)
    -- print(speciesReduction)
    -- print(dayWeatherBonus)
    -- print(burst)
    -- print(mab)
    -- print(magicDmgMod)

    return dmg
end

-- get elemental damage reduction
function getElementalDamageReduction(target, element)
    local defense = 1
    if (element > 0) then
        defense = 1 - (target:getMod(tpz.magic.defenseMod[element]) / 256)

        return utils.clamp(defense, 0.0, 2.0)
    end

    return defense
end

---------------------------------------------
--  Elemental Debuff Potency functions
---------------------------------------------

function getElementalDebuffDOT(INT)
    local DOT = 0
    if (INT<= 39) then
        DOT = 5
    elseif (INT <= 69) then
        DOT = 7
    elseif (INT <= 99) then
        DOT = 9
    elseif (INT <= 149) then
        DOT = 11
    else
        DOT = 13
    end
    return DOT
end

function getElementalDebuffStatDownFromDOT(dot)
    local stat_down = 0
    stat_down = dot + 10
    if dot > 30 then
        stat_down = 39 -- BLU"s cold wave is -39 stat down
    end
    return stat_down
end

function getHelixDuration(caster)
    --Dark Arts will further increase Helix duration, but testing is ongoing.

    local casterLevel = caster:getMainLvl()
    local duration = 30 --fallthrough
    if (casterLevel <= 39) then
        duration = 30
    elseif (casterLevel <= 59) then
        duration = 60
    elseif (casterLevel <= 99) then
        duration = 90
    end

    if caster:hasStatusEffect(tpz.effect.DARK_ARTS) then
        local jpValue = caster:getJobPointLevel(tpz.jp.DARK_ARTS_EFFECT)

        duration = duration + (3 * jpValue)
    end

    return duration
end

function isHelixSpell(spell)
    --Dark Arts will further increase Helix duration, but testing is ongoing.

    local id = spell:getID()
    if id >= 278 and id <= 285 then
        return true
    end
    return false
end

function handleThrenody(caster, target, spell, basePower, baseDuration, modifier)
    -- Process resitances
    local staff = AffinityBonusAcc(caster, spell:getElement())
    -- print("staff=" .. staff)
    local dCHR = (caster:getStat(tpz.mod.CHR) - target:getStat(tpz.mod.CHR))
    -- print("dCHR=" .. dCHR)
    local params = {}
    params.attribute = tpz.mod.CHR
    params.skillType = tpz.skill.SINGING
    params.bonus = staff
    params.skillBonus = 0
    if caster:isPC() then
        local sLvl = caster:getSkillLevel(tpz.skill.SINGING) -- Gets skill level of Singing
        local iLvl = caster:getWeaponSkillLevel(tpz.slot.RANGED)
        local skillcap = caster:getMaxSkillLevel(caster:getMainLvl(), tpz.job.BRD, tpz.skill.STRING_INSTRUMENT) -- will return the same whether string or wind, both are C for bard
        
        local rangedType = caster:getWeaponSkillType(tpz.slot.RANGED)
        if rangedType ~= tpz.skill.STRING_INSTRUMENT and rangedType ~= tpz.skill.WIND_INSTRUMENT then iLvl = sLvl end
        
        if sLvl + iLvl > skillcap*2 then
            params.skillBonus = sLvl + iLvl - skillcap*2 -- every point over the skillcap (only attainable from gear/merits) is an extra +1 magic accuracy
        end
    end

    local resm = applyResistanceEffect(caster, target, spell, params)
    -- print("rsem=" .. resm)

    if resm < 0.5 then
        -- print("resm resist")
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
        return tpz.effect.THRENODY
    end

    -- Remove previous Threnody
    target:delStatusEffectSilent(tpz.effect.THRENODY)

    local iBoost = caster:getMod(tpz.mod.THRENODY_EFFECT) + caster:getMod(tpz.mod.ALL_SONGS_EFFECT)
    local power = basePower + iBoost*5
    local duration = baseDuration * ((iBoost * 0.1) + (caster:getMod(tpz.mod.SONG_DURATION_BONUS)/100) + 1)

    if caster:hasStatusEffect(tpz.effect.SOUL_VOICE) then
        power = power * 2
    elseif caster:hasStatusEffect(tpz.effect.MARCATO) then
        power = power * 1.5
    end

    if caster:hasStatusEffect(tpz.effect.TROUBADOUR) then
        duration = duration * 2
    end

    -- Check for magic burst
    if GetEnfeebleMagicBurstMessage(caster, spell, target) then
        spell:setMsg(spell:getMagicBurstMessage()) 
    end

    -- Set spell message and apply status effect
    target:addStatusEffect(tpz.effect.THRENODY, -power, 0, duration, 0, modifier, 0)

    return tpz.effect.THRENODY
end


function handleNinjutsuDebuff(caster, target, spell, basePower, baseDuration, modifier)
    -- Add new
	local resist = applyResistanceAbility(caster, target, tpz.magic.ele.NONE, tpz.skill.NINJUTSU, caster:getMod(tpz.mod.MACC) +53)
    target:addStatusEffectEx(tpz.effect.NINJUTSU_ELE_DEBUFF, 0, basePower, 0, baseDuration * resist, 0, modifier, 0)
    return tpz.effect.NINJUTSU_ELE_DEBUFF
end

-- Returns true if you can overwrite the effect
-- Example: canOverwrite(target, tpz.effect.SLOW, 25)
function canOverwrite(target, effect, power, mod)
    mod = mod or 1

    local statusEffect = target:getStatusEffect(effect)

    -- effect not found so overwrite
    if (statusEffect == nil) then
        return true
    end

    -- overwrite if its weaker
    if (statusEffect:getPower()*mod > power) then
        return false
    end

    return true
end

function getElementalSDT(element, target) -- takes into account if magic burst window is open -> increase tier by 1
    if target:isPC() then
        return 100
    end

    local SDT = 100
    local SDTmod = 0
    if     element == 1 then SDTmod = tpz.mod.SDT_FIRE
    elseif element == 2 then SDTmod = tpz.mod.SDT_ICE
    elseif element == 3 then SDTmod = tpz.mod.SDT_WIND
    elseif element == 4 then SDTmod = tpz.mod.SDT_EARTH
    elseif element == 5 then SDTmod = tpz.mod.SDT_THUNDER
    elseif element == 6 then SDTmod = tpz.mod.SDT_WATER
    elseif element == 7 then SDTmod = tpz.mod.SDT_LIGHT
    elseif element == 8 then SDTmod = tpz.mod.SDT_DARK
    end
    if SDTmod > 0 then SDT = target:getMod(SDTmod) end
    
    if SDT == 0 or SDT == nil then -- invalid SDT, it was never set on this target... just default it.
        SDT = 100
		--print("invalid SDT detected")
    end

    -- Handle Magic Bursts
    local MB1 = 0
    local MB2 = 0
    MB1, MB2 = FormMagicBurst(element, target)
    
    if MB1 > 0 then -- window is open for this element
        if SDT == 5 then
            SDT = 10
        elseif SDT == 10 then
            SDT = 15
        elseif SDT == 15 then
            SDT = 20
        elseif SDT == 20 then
            SDT = 25
        elseif SDT == 25 then
            SDT = 30
        elseif SDT == 30 then
            SDT = 40
        elseif SDT == 40 then
            SDT = 50
        elseif SDT == 50 then
            SDT = 60
        elseif SDT == 60 then
            SDT = 70
        elseif SDT == 70 then
            SDT = 85
        elseif SDT == 85 then
            SDT = 100
        elseif SDT == 100 then
            SDT = 115
        elseif SDT == 115 then
            SDT = 130
        elseif SDT == 130 then
            SDT = 150
        elseif SDT == 150 then
            SDT = 150
        else
            print(string.format("non-standard SDT tier on target %u valve pls fix",target:getID()))
            SDT = SDT + 10
        end
    end

    -- Handle Sengikori
    if target:isMob() and target:hasStatusEffect(tpz.effect.SENGIKORI) then
        if SDT == 5 then
            SDT = 10
        elseif SDT == 10 then
            SDT = 15
        elseif SDT == 15 then
            SDT = 20
        elseif SDT == 20 then
            SDT = 25
        elseif SDT == 25 then
            SDT = 30
        elseif SDT == 30 then
            SDT = 40
        elseif SDT == 40 then
            SDT = 50
        elseif SDT == 50 then
            SDT = 60
        elseif SDT == 60 then
            SDT = 70
        elseif SDT == 70 then
            SDT = 85
        elseif SDT == 85 then
            SDT = 100
        elseif SDT == 100 then
            SDT = 115
        elseif SDT == 115 then
            SDT = 130
        elseif SDT == 130 then
            SDT = 150
        elseif SDT == 150 then
            SDT = 150
        else
            print(string.format("non-standard SDT tier on target %u valve pls fix",target:getID()))
            SDT = SDT + 10
        end
    end

    -- Add banish on undead / tomahawk effect
    local SDTResistanceReduction = target:getMod(tpz.mod.SPDEF_DOWN) / 100
    SDT = utils.clamp(math.max(100 - SDT, 0) * (SDTResistanceReduction) + SDT, 5, 150)

    --print(string.format(SDT))
    return SDT
end

function getEnfeeblelSDT(status, element, target) -- takes into account if magic burst window is open -> increase tier by 1
    if target:isPC() then
        return 100
    end

    local SDT = 100
    local SDTmod = 0
    -- printf("status: %s", status)
    if  status == tpz.effect.AMNESIA then
        SDTmod = tpz.mod.EEM_AMNESIA
        SDT = target:getMod(SDTmod)
    elseif status == tpz.effect.BANE or status == tpz.effect.PLAGUE then
        SDTmod = tpz.mod.EEM_VIRUS
        SDT = target:getMod(SDTmod)
    elseif status == tpz.effect.SILENCE or status == tpz.effect.MUTE then
        SDTmod = tpz.mod.EEM_SILENCE
        SDT = target:getMod(SDTmod)
    elseif status == tpz.effect.WEIGHT then
        SDTmod = tpz.mod.EEM_GRAVITY
        SDT = target:getMod(SDTmod)
    elseif status == tpz.effect.STUN then
        SDTmod = tpz.mod.EEM_STUN
        SDT = target:getMod(SDTmod)
    elseif status == tpz.effect.LULLABY then
        SDTmod = tpz.mod.EEM_LIGHT_SLEEP
        SDT = target:getMod(SDTmod)
    elseif status == tpz.effect.CHARM_I or status == tpz.effect.CHARM_II then
        SDTmod = tpz.mod.EEM_CHARM
        SDT = target:getMod(SDTmod)
    elseif status == tpz.effect.PARALYSIS then
        SDTmod = tpz.mod.EEM_PARALYZE
        SDT = target:getMod(SDTmod)
    elseif status == tpz.effect.BIND then
        SDTmod = tpz.mod.EEM_BIND
        SDT = target:getMod(SDTmod)
    elseif status == tpz.effect.SLOW then
        SDTmod = tpz.mod.EEM_SLOW
        SDT = target:getMod(SDTmod)
    elseif status == tpz.effect.PETRIFICATION then
        SDTmod = tpz.mod.EEM_PETRIFY
        SDT = target:getMod(SDTmod)
    elseif status == tpz.effect.TERROR then
        SDTmod = tpz.mod.EEM_TERROR
        SDT = target:getMod(SDTmod)
    elseif status == tpz.effect.POISON then
        SDTmod = tpz.mod.EEM_POISON
        SDT = target:getMod(SDTmod)
    elseif status == tpz.effect.SLEEP_I or status == tpz.effect.SLEEP_II then
        SDTmod = tpz.mod.EEM_DARK_SLEEP
        SDT = target:getMod(SDTmod)
    elseif status == tpz.effect.BLINDNESS then
        SDTmod = tpz.mod.EEM_BLIND
        SDT = target:getMod(SDTmod)
    else -- No status effect mod exists, default to the element of it's status effect
        SDTmod = getElementalSDT(element, target)
        SDT = SDTmod
    end

    -- printf("SDTmod: %s", SDTmod)
    -- printf("SDT %s", SDT)
    
    if SDT == 0 or SDT == nil then -- invalid SDT, it was never set on this target... just default it.
        SDT = 100
		--print("invalid SDT detected")
    end

    -- Handle Magic Bursts
    local MB1 = 0
    local MB2 = 0
    MB1, MB2 = FormMagicBurst(element, target)
    
    if MB1 > 0 then -- window is open for this element
        if SDT == 5 then
            SDT = 10
        elseif SDT == 10 then
            SDT = 15
        elseif SDT == 15 then
            SDT = 20
        elseif SDT == 20 then
            SDT = 25
        elseif SDT == 25 then
            SDT = 30
        elseif SDT == 30 then
            SDT = 40
        elseif SDT == 40 then
            SDT = 50
        elseif SDT == 50 then
            SDT = 60
        elseif SDT == 60 then
            SDT = 70
        elseif SDT == 70 then
            SDT = 85
        elseif SDT == 85 then
            SDT = 100
        elseif SDT == 100 then
            SDT = 115
        elseif SDT == 115 then
            SDT = 130
        elseif SDT == 130 then
            SDT = 150
        elseif SDT == 150 then
            SDT = 150
        else
            print(string.format("non-standard SDT tier on target %u valve pls fix",target:getID()))
            SDT = SDT + 10
        end
    end

    -- Handle Sengikori
    if target:isMob() and target:hasStatusEffect(tpz.effect.SENGIKORI) then
        if SDT == 5 then
            SDT = 10
        elseif SDT == 10 then
            SDT = 15
        elseif SDT == 15 then
            SDT = 20
        elseif SDT == 20 then
            SDT = 25
        elseif SDT == 25 then
            SDT = 30
        elseif SDT == 30 then
            SDT = 40
        elseif SDT == 40 then
            SDT = 50
        elseif SDT == 50 then
            SDT = 60
        elseif SDT == 60 then
            SDT = 70
        elseif SDT == 70 then
            SDT = 85
        elseif SDT == 85 then
            SDT = 100
        elseif SDT == 100 then
            SDT = 115
        elseif SDT == 115 then
            SDT = 130
        elseif SDT == 130 then
            SDT = 150
        elseif SDT == 150 then
            SDT = 150
        else
            print(string.format("non-standard SDT tier on target %u valve pls fix",target:getID()))
            SDT = SDT + 10
        end
    end

    -- print(string.format("Enfeeble SDT: %s", SDT))
    return SDT
end

function getSDTTier(SDT)
    local tier = 0

    if (SDT == 150) then
        tier = -3
    elseif (SDT == 130) then
        tier = -2
    elseif (SDT == 115) then
        tier = -1
    elseif (SDT == 100) then
        tier = 0
    elseif (SDT == 85) then
        tier = 1
    elseif (SDT == 70) then
        tier = 2
    elseif (SDT == 60) then
        tier = 3
    elseif (SDT == 50) then
        tier = 4
    elseif (SDT == 40) then
        tier = 5
    elseif (SDT == 30) then
        tier = 6
    elseif (SDT == 25) then
        tier = 7
    elseif (SDT == 20) then
        tier = 8
    elseif (SDT == 15) then
        tier = 9
    elseif (SDT == 10) then -- because 10% (T10) tier forcibly sets your hit rate to 5%
        tier = 10
    elseif (SDT == 5) then -- 5% (T11) causes you to auto fail all the coin flips
        tier = 11
    end

    return tier
end

function getSDTMultiplier(tier)

    local multiplier = 1

    if (tier == -3) then
        multiplier = 0.95
    elseif (tier == -2) then
        multiplier = 0.96019
    elseif (tier == -1) then
        multiplier = 0.98
    elseif (tier == 0) then
        multiplier = 1
    elseif (tier == 1) then
        multiplier = 1.023 
    elseif (tier == 2) then
        multiplier = 1.049
    elseif (tier == 3) then
        multiplier = 1.0905
    elseif (tier == 4) then
        multiplier = 1.126
    elseif (tier == 5) then
        multiplier = 1.2075
    elseif (tier == 6) then
        multiplier = 1.3475
    elseif (tier == 7) then
        multiplier = 1.70065
    elseif (tier == 8) then
        multiplier = 2.141
    elseif (tier == 9) then
        multiplier = 2.65
    elseif (tier == 10) then
        multiplier = 5
    elseif (tier == 11) then
        multiplier = 10
    end

    return multiplier
end

function getDstatBonus(softcap, diff)
    -- https://www.bluegartr.com/threads/108196-Random-Facts-Thread-Magic?p=6818652&viewfull=1#post6818652
    -- +/- 10 dStat >>> 1 INT = 1 MACC
    -- +/- 11 dStat to 30 INT >>> 2 INT = 1 MACC
    -- +/- 31-70 dStat >>> 4 INT = 1 MACC
    -- Caps at 70 dStat
    local dstatMaccBonus = 0

    if (diff - softcap) >= 0 or (diff - softcap) <= 0 then
        dstatMaccBonus = diff
    end

    if diff >= 11 then
        dstatMaccBonus = softcap + math.floor((diff - softcap)/2)
    end

    if diff <= -11 then
        softcap = -10
        dstatMaccBonus = softcap + math.ceil((diff - softcap)/2)
    end

    if diff >= 31 then
        dstatMaccBonus = 20 + math.floor((diff - 30)/4)
    end

    if diff <= -31 then
        dstatMaccBonus = -20 + math.ceil((diff - -30)/4)
    end

    dstatMaccBonus = utils.clamp(dstatMaccBonus, -70, 70)

    return dstatMaccBonus
end

-- Magic Accuracy from Job Points.
function JobPointsMacc(caster, target, spell)
    local skill = spell:getSkillType()
    local spellGroup = spell:getSpellGroup()
    local element = spell:getElement()
    local jpMaccBonus = 0
    local casterJob = caster:getMainJob()
    if caster:isPC() then
        switch(casterJob): caseof
        {
            [tpz.job.WHM] = function()
                jpMaccBonus = caster:getJobPointLevel(tpz.jp.WHM_MAGIC_ACC_BONUS)
            end,

            [tpz.job.BLM] = function()
                -- BLM Job Point: MACC Bonus +1
                jpMaccBonus = caster:getJobPointLevel(tpz.jp.BLM_MAGIC_ACC_BONUS)
            end,

            [tpz.job.RDM] = function()
                -- Add MACC for RDM group 1 merits
                if element >= tpz.magic.element.FIRE and element <= tpz.magic.element.WATER then
                    jpMaccBonus = caster:getMerit(rdmMerit[element])
                    -- printf("Merits MACC %d", jpMaccBonus)
                end

                -- RDM Job Point: During saboteur, Enfeebling MACC +2
                if
                    skill == tpz.skill.ENFEEBLING_MAGIC and
                    caster:hasStatusEffect(tpz.effect.SABOTEUR)
                then
                    local jpValue = caster:getJobPointLevel(tpz.jp.SABOTEUR_EFFECT)

                    jpMaccBonus = jpValue * 2
                end

                -- RDM Job Point: Magic Accuracy Bonus, All MACC + 1
                local jobPoints = caster:getJobPointLevel(tpz.jp.RDM_MAGIC_ACC_BONUS)
                -- printf("Job Points MACC %d", jobPoints)
                jpMaccBonus = caster:getJobPointLevel(tpz.jp.RDM_MAGIC_ACC_BONUS)
            end,

            [tpz.job.NIN] = function()
                -- NIN Job Point: Ninjitsu Accuracy Bonus
                if skill == tpz.skill.NINJUTSU then
                    jpMaccBonus = caster:getJobPointLevel(tpz.jp.NINJITSU_ACC_BONUS)
                end
            end,

            [tpz.job.BLU] = function()
                -- BLU MACC merits - nuke acc is handled in bluemagic.lua
                if skill == tpz.skill.BLUE_MAGIC then
                    jpMaccBonus = caster:getMerit(tpz.merit.MAGICAL_ACCURACY)
                end
            end,

            [tpz.job.SCH] = function()
                if
                    (spellGroup == tpz.magic.spellGroup.WHITE and caster:hasStatusEffect(tpz.effect.PARSIMONY)) or
                    (spellGroup == tpz.magic.spellGroup.BLACK and caster:hasStatusEffect(tpz.effect.PENURY))
                then
                    local jpValue = caster:getJobPointLevel(tpz.jp.STRATEGEM_EFFECT_I)

                    jpMaccBonus = jpValue
                end
            end,
        }
    end

    return jpMaccBonus
end

function GetCharmHitRate(player, target)
    -- Immune to charm
    if target:getMobMod(tpz.mobMod.CHARMABLE) == 0 then
        return 0
    end

    -- formula is 50% - family reduct - dLvl (3/lvl until 50, 5/lvl 51+, 10/lvl at some level)) * charm multiplier + dCHR + Light Staff bonus (10/15)
    -- dLVL can never go above 0, and dCHR goes below 0
    local chance = 50
    local familyReduction = GetCharmFamilyReduction(player, target)
    local element = tpz.magic.ele.LIGHT
    local diff = player:getStat(tpz.mod.CHR) - target:getStat(tpz.mod.CHR)
    local dCHR = getDstatBonus(10, diff)
    local playerLvl = player:getMainLvl()
    local bstMainLvl = player:getJobLevel(tpz.job.BST)

    -- If BST main level is below current job level, use BST Level for player level in formula
    if (playerLvl > bstMainLvl) then
        playerLvl = bstMainLvl
    end

    local dLvl = playerLvl - target:getMainLvl()
    local SDT = getEnfeeblelSDT(tpz.effect.CHARM, element, target)
    local charmMultiplier = GetCharmMultiplier(SDT)
    local charmMod = (1 + player:getMod(tpz.mod.CHARM_CHANCE) / 100) -- Correct mod?
    local affinityBonus = AffinityBonusAcc(player, element)
    local tameBonus = 0
    local jpValue = player:getJobPointLevel(tpz.jp.CHARM_SUCCESS_RATE)

    if player:getLocalVar("Tamed_Mob") == target:getID() then
        tameBonus = 10
    end

    if (target:getMainLvl() > 70) then
        dLvl = dLvl * 10
    elseif (target:getMainLvl() > 50) then
        dLvl = dLvl * 5
    else
        dLvl = dLvl * 3
    end

    dLvl = utils.clamp(chance, -99999, 0)

    chance = chance - familyReduction
    --print(string.format("chance - family reduction: %i", chance))
    chance = chance + dLvl
    --print(string.format("chance - dLvl reduction: %i", chance))
    chance = chance * charmMultiplier
    --print(string.format("chance * charm multiplier: %i", chance))
    chance = chance + dCHR
    --print(string.format("chance + dCHR: %i", chance))
    chance = chance + affinityBonus
    --print(string.format("chance + affinity bonus: %i", chance))
    chance = chance + jpValue
    --print(string.format("chance + jpValue: %i", chance))
    chance = chance + tameBonus
    --print(string.format("chance + tame bonus: %i", chance))

    chance = utils.clamp(chance, 5, 95)
    --print(string.format("chance final %i", chance))
    --player:PrintToPlayer(string.format( "Your charm hit rate is %i.", chance))

    return chance
end

function GetCharmMultiplier(SDT)
    -- Light SDT/EEM	Charm Multi
    -- 150%	            1.5
    -- 130%	            1.4
    -- 115%         	1.2
    -- 100%	            1
    -- SUB 100%	        0.5
    if (SDT >= 150) then
        return 1.5
    elseif (SDT >= 130) then
        return 1.4
    elseif (SDT >= 150) then
        return 1.2
    elseif (SDT >= 100) then
        return 1
    else
        return 0.5
    end

    return 1
end

function GetCharmFamilyReduction(player, target)
    -- Slime, Puk -35%
    -- Old Opo-Opo -40%
    -- Ifrit's Raptor -75%
    local family = target:getFamily()

    if (family == 198 or family == 526 or family == 228 or family == 229 or family == 230 or family == 66 or family == 67) then
        return 35
    elseif (family == 188) then -- Should be old Opo-opo only
        return 40
    elseif (family == 376 or family == 377 or family == 210) then -- Should be ifrits raptor only
        return 75
    end

    return 0
end

function doElementalNuke(caster, spell, target, spellParams)
    local DMG = 0
    local DMGMod = caster:getMod(tpz.mod.MAGIC_DAMAGE)
    local skillType = spellParams.skillType
    local dINT = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    local V = 0
    local M = 0
    local hasMultipleTargetReduction = spellParams.hasMultipleTargetReduction
    local resistBonus = spellParams.resistBonus
    -- https://www.bluegartr.com/threads/134257-Status-resistance-and-other-miscellaneous-JP-insights

    -- BLM Job Point: Magic Damage Bonus
    if (caster:getMainJob() == tpz.job.BLM) and caster:isPC() then
        DMGMod = DMGMod + caster:getJobPointLevel(tpz.jp.MAGIC_DMG_BONUS)
    end

    if USE_OLD_MAGIC_DAMAGE and spellParams.V ~= nil and spellParams.M ~= nil then
        V = spellParams.V -- Base value
        M = spellParams.M -- Tier multiplier
        local I = spellParams.I -- Inflection point
        local cap = DMGMod + I * 2 + V -- Base damage soft cap

        if dINT < 0 then
            -- If dINT is a negative value the tier multiplier is always 1
            DMG = DMGMod + V + dINT

            -- Check/ set lower limit of 0 damage for negative dINT
            if DMG <= 1 then
                DMG = math.random(5, 7)
            end

        elseif dINT < I then
             -- If dINT > 0 but below inflection point I
            DMG = DMGMod + V + dINT * M

        else
             -- Above inflection point I additional dINT is only half as effective
            DMG = DMGMod + V + I + ((dINT - I) * (M / 2))

        end

        -- Check/ set damage soft cap
        if DMG > cap then
            DMG = cap
        end

    else
        local mDMG = caster:getMod(tpz.mod.MAGIC_DAMAGE)
        --[[
                Calculate base damage:
                D = mDMG + V + (dINT × M)
                D is then floored
                For dINT reduce by amount factored into the V value (example: at 134 INT, when using V100 in the calculation, use dINT = 134-100 = 34)
        ]]

        if (dINT <= 49) then
            V = spellParams.V0
            M = spellParams.M0
            DMG = math.floor(DMG + mDMG + V + (dINT * M))

            if (DMG <= 0) then
                DMG = math.random(5, 7)
            end

        elseif (dINT >= 50 and dINT <= 99) then
            V = spellParams.V50
            M = spellParams.M50
            DMG = math.floor(DMG + mDMG + V + ((dINT - 50) * M))

        elseif (dINT >= 100 and dINT <= 199) then
            V = spellParams.V100
            M = spellParams.M100
            DMG = math.floor(DMG + mDMG + V + ((dINT - 100) * M))

        elseif (dINT > 199) then
            V = spellParams.V200
            M = spellParams.M200
            DMG = math.floor(DMG + mDMG + V + ((dINT - 200) * M))
        end
    end

    --get resist multiplier (1x if no resist)
    local params = {}
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.ELEMENTAL_MAGIC
    params.bonus = resistBonus
    params.dStatAccSoftCap = 10

    local resist = applyResistance(caster, target, spell, params)
    
    local element = spell:getElement()
    
    local MTDR = 1.0
	

    if hasMultipleTargetReduction == true then
        MTDR = 0.90 - spell:getTotalTargets() * 0.05
        if MTDR == 0.85 then -- 1 target, stay at 1.0
            MTDR = 1.0
        elseif MTDR < 0.4 then
            MTDR = 0.4
        end
        --print(string.format("MTDR was %.2f for numtargets %u",MTDR,spell:getTotalTargets()))
    end
    
   -- if target:getMod(tpz.mod.MAGIC_STACKING_MDT) == 0 then
   --     target:setMod(tpz.mod.MAGIC_STACKING_MDT,40)
   --     target:queue(1100, function(target)
   --         target:setMod(tpz.mod.MAGIC_STACKING_MDT,0)
   --     end) 
   -- else
   --     DMG = DMG * target:getMod(tpz.mod.MAGIC_STACKING_MDT) / 100
   -- end
    
    --get the resisted damage
    DMG = DMG * resist * MTDR

    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    DMG = addBonuses(caster, spell, target, DMG, spellParams)

    --add in target adjustment
    DMG = adjustForTarget(target, DMG, element)

    --add in final adjustments
    DMG = finalMagicAdjustments(caster, target, spell, DMG)

    return DMG
end

function doDivineNuke(caster, target, spell, params)
    params.skillType = tpz.skill.DIVINE_MAGIC
    params.attribute = tpz.mod.MND
    params.dStatAccSoftCap = 10

    return doNuke(caster, target, spell, params)
end

function doNinjutsuNuke(caster, target, spell, params)
    local mabBonus = params.mabBonus

    mabBonus = mabBonus or 0

    mabBonus = mabBonus + caster:getMod(tpz.mod.NIN_NUKE_BONUS) -- "enhances ninjutsu damage" bonus
    if (caster:hasStatusEffect(tpz.effect.INNIN) and caster:isBehind(target, 90)) then -- Innin mag atk bonus from behind
        mabBonus = mabBonus + 50
    end
    params.skillType = tpz.skill.NINJUTSU
    params.attribute = tpz.mod.INT
    params.bonusmab = mabBonus
    params.dStatAccSoftCap = 10

    return doNuke(caster, target, spell, params)
end

function doNuke(caster, target, spell, params)
    --calculate raw damage
    params.dStatAccSoftCap = 10
    local dmg = calculateMagicDamage(caster, target, spell, params)
    --get resist multiplier (1x if no resist)
    local resist = applyResistance(caster, target, spell, params)
	
    if (spell:getSkillType() == tpz.skill.NINJUTSU) then
        if (caster:getMainJob() == tpz.job.NIN) then -- NIN main gets a bonus to their ninjutsu nukes
            local ninSkillBonus = 100
            local DMGMod = caster:getMod(tpz.mod.MAGIC_DAMAGE)

            -- NIN Job Point: Elemental Ninjutsu Effect
            if caster:isPC() then
                DMGMod = DMGMod + caster:getJobPointLevel(tpz.jp.ELEM_NINJITSU_EFFECT) * 2
            end
            -- Add magic damage mod and NIN JP to based damage
            dmg = dmg + DMGMod

            if (spell:getID() % 3 == 2) then -- ichi nuke spell ids are 320, 323, 326, 329, 332, and 335
                ninSkillBonus = 100 + math.floor((caster:getSkillLevel(tpz.skill.NINJUTSU) - 50) / 4) -- getSkillLevel includes bonuses from merits and modifiers (ie. gear)
            elseif (spell:getID() % 3 == 0) then -- ni nuke spell ids are 1 more than their corresponding ichi spell
                ninSkillBonus = 100 + math.floor((caster:getSkillLevel(tpz.skill.NINJUTSU) - 125) / 2)
            else -- san nuke spell, also has ids 1 more than their corresponding ni spell
                ninSkillBonus = 100 + math.floor((caster:getSkillLevel(tpz.skill.NINJUTSU) - 276))
            end

            ninSkillBonus = utils.clamp(ninSkillBonus, 100, 1000) -- bonus caps at +1000%, and does not go negative

            dmg = dmg * ninSkillBonus/100
        end
        -- boost with Futae
        if (caster:hasStatusEffect(tpz.effect.FUTAE)) then
            dmg = math.floor(dmg * 1.50)
            caster:delStatusEffectSilent(tpz.effect.FUTAE)
        end
    end

    --get the resisted damage
    dmg = dmg * resist
    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster, spell, target, dmg, params)
    --add in target adjustment
    dmg = adjustForTarget(target, dmg, spell:getElement())
    --add in final adjustments
    dmg = finalMagicAdjustments(caster, target, spell, dmg)
    return dmg
end

function doDivineBanishNuke(caster, target, spell, params)
    params.skillType = tpz.skill.DIVINE_MAGIC
    params.attribute = tpz.mod.MND
    params.dStatAccSoftCap = 10
    
    if caster:isPC() then
        params.dmg = params.dmg + caster:getMerit(tpz.merit.BANISH_EFFECT)
    end

    --calculate raw damage
    local dmg = calculateMagicDamage(caster, target, spell, params)

    -- Add magic damage mod 
    local DMGMod = caster:getMod(tpz.mod.MAGIC_DAMAGE)
    dmg = dmg + DMGMod

    --get resist multiplier (1x if no resist)
    local resist = applyResistance(caster, target, spell, params)
	 
    --get the resisted damage
    dmg = dmg * resist
    

    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster, spell, target, dmg, params)
    --add in target adjustment
    dmg = adjustForTarget(target, dmg, spell:getElement())
    --handling afflatus misery
    dmg = handleAfflatusMisery(caster, spell, dmg)
    --add in final adjustments
    dmg = finalMagicAdjustments(caster, target, spell, dmg)
    return dmg
end

function doAdditionalEffectDamage(player, target, chance, dmg, dStat, incudeMAB, bonusMAB, element, maccBonus)
    local resist = applyResistanceAddEffect(player, target, element, maccBonus, nil)
    local params = {}
    params.bonusmab = bonusMAB
    params.includemab = incudeMAB
    if math.random(100) <= chance then
        if dStat ~= nil then
            dmg = dmg + (player:getStat(dStat) - target:getStat(dStat))
        end
        dmg = addBonusesAbility(player, element, target, dmg, params)
        dmg = math.floor(dmg * resist)
        dmg = adjustForTarget(target, dmg, element)
        dmg = finalMagicNonSpellAdjustments(player, target, element, dmg)
    else
         return 0
    end
    --printf("chance %i", chance)
    --printf("resist %i", resist * 100)
    --printf("bonusMAB %i", bonusMAB)
    --printf("element %i", element)
    --printf("maccBonus %i", maccBonus)
    --printf("dmg %i", dmg)
    return dmg
end

function CheckAdditionalEffeectAmmo(player, requiredAmmo, chance)
    local ammo = player:getEquipID(tpz.slot.AMMO)
	if (ammo == requiredAmmo) then
		chance = chance
    else
        chance = 0
	end
    return chance
end

function DeleteAmmoAdditionalEffect(player, dmg, ammo)
    if (dmg > 0) then
        player:removeAmmo()
    end
end

function getAdditionalEffectStatusResist(player, target, effect, element, bonus)
    local immunities =
    {
        { tpz.effect.SLEEP_I, 1 },
        { tpz.effect.SLEEP_II, 1 },
        { tpz.effect.SLEEP_I, 4096 },
        { tpz.effect.SLEEP_II, 4096 },
        { tpz.effect.POISON, 256 },
        { tpz.effect.PARALYSIS, 32 },
        { tpz.effect.BLINDNESS, 64 },
        { tpz.effect.SILENCE, 16 },
        { tpz.effect.STUN, 8 },
        { tpz.effect.BIND, 4 },
        { tpz.effect.WEIGHT, 2 },
        { tpz.effect.SLOW, 128 },
        { tpz.effect.ELEGY, 512 },
        { tpz.effect.REQUIEM, 1024 },
        { tpz.effect.LULLABY, 2048 },
        { tpz.effect.LULLABY, 1 },
        { tpz.effect.PETRIFICATION, 8192 },
        { tpz.effect.PETRIFICATION, 1 },
    }

    local resist = applyResistanceAddEffect(player, target, element, bonus, effect)

    --Check for resistance traits 
    if effect ~= nil and math.random() < getEffectResistanceTraitChance(player, target, effect) then
        return 1/16 -- this will make any status effect fail. this takes into account trait+food+gear
    end

    -- Check for immunity
    for i,statusEffect in pairs(immunities) do
        local immunity = 0
        if effect == statusEffect[1] then
            immunity = statusEffect[2]
        end
        if target:hasImmunity(immunity) then
            resist = 0
        end
    end

    return resist
end

function TryApplyAdditionalEffect(player, target, effect, element, power, tick, duration, subpower, tier, chance, bonus)
    local effects =
    {
        { tpz.effect.SLEEP_I, tpz.subEffect.SLEEP },
        { tpz.effect.POISON, tpz.subEffect.POISON },
        { tpz.effect.PARALYSIS, tpz.subEffect.PARALYSIS },
        { tpz.effect.BLINDNESS, tpz.subEffect.BLINDNESS },
        { tpz.effect.SILENCE, tpz.subEffect.SILENCE },
        { tpz.effect.PETRIFICATION, tpz.subEffect.PETRIFICATION },
        { tpz.effect.DISEASE, tpz.subEffect.PLAGUE },
        { tpz.effect.CURSE_I, tpz.subEffect.CURSE },
        { tpz.effect.STUN, tpz.subEffect.STUN },
        { tpz.effect.BIND, tpz.subEffect.BIND },
        { tpz.effect.WEIGHT, tpz.subEffect.WEIGHT },
        { tpz.effect.SLOW, tpz.subEffect.SLOW },
        { tpz.effect.CHARM_I, tpz.subEffect.CHARM },
        { tpz.effect.DOOM, tpz.subEffect.DOOM },
        { tpz.effect.AMNESIA, tpz.subEffect.AMNESIA },
        { tpz.effect.CHARM_II, tpz.subEffect.CHARM },
        { tpz.effect.GRADUAL_PETRIFICATION, tpz.subEffect.PETRIFICATION },
        { tpz.effect.SLEEP_II, tpz.subEffect.SLEEP },
        { tpz.effect.CURSE_II, tpz.subEffect.CURSE },
        { tpz.effect.ADDLE, tpz.subEffect.ADDLE },
        { tpz.effect.TERROR, tpz.subEffect.TERROR },
        { tpz.effect.MUTE, tpz.subEffect.MUTE },
        { tpz.effect.BANE, tpz.subEffect.BANE },
        { tpz.effect.GRAVITY, tpz.subEffect.GRAVITY },
        { tpz.effect.HASTE, tpz.subEffect.HASTE },
        { tpz.effect.FLASH, tpz.subEffect.FLASH },
        { tpz.effect.NONE, tpz.subEffect.DISPEL },
        { tpz.effect.DEFENSE_DOWN, tpz.subEffect.DEFENSE_DOWN },
        { tpz.effect.EVASION_DOWN, tpz.subEffect.EVASION_DOWN },
        { tpz.effect.ATTACK_DOWN, tpz.subEffect.ATTACK_DOWN },
        { tpz.effect.KO, tpz.subEffect.DEATH },
    }

    local resist = getAdditionalEffectStatusResist(player, target, effect, element, bonus)
    duration = math.floor(duration * resist)

    -- Check for subpower
    if (subpower == nil) then
        subpower = 0
    end

    -- Check for tier
    if (tier == nil) then
        tier = 1
    end

    -- Check if tick should be applied
    if (effect == tpz.effect.POISON) or (effect == tpz.effect.DIA) or (effect == tpz.effect.BIO) or
        (effect == tpz.effect.FLASH) or utils.IsElementalDOT(effect) then
        tick = 3
    else
        tick = 0
    end



    -- Get sub effect from status effect ID
    for i, statusEffects in pairs(effects) do
        if (effect == statusEffects[1]) then
            subeffect = statusEffects[2]
        end
    end

    if math.random(1, 100) >= chance or (resist < 0.5) or target:hasStatusEffect(effect) then
        return 0, 0, 0
    else

        -- Attack, defense and evaison down also dispels attack defense and evasion boost effects
        if (effect == tpz.effect.ATTACK_DOWN) then
            target:delStatusEffectSilent(tpz.effect.ATTACK_BOOST)
        elseif (effect == tpz.effect.DEFENSE_DOWN) then
            target:delStatusEffectSilent(tpz.effect.DEFENSE_BOOST)
        elseif (effect == tpz.effect.EVASION_DOWN) then
            target:delStatusEffectSilent(tpz.effect.EVASION_BOOST)
        end

        target:addStatusEffect(effect, power, tick, duration, 0, subpower, tier)

        return subeffect, tpz.msg.basic.ADD_EFFECT_STATUS, effect
    end
end

function TryApplyEffect(caster, target, spell, effect, power, tick, duration, resist, resistthreshold, subpower, tier)
    local immunities =
    {
        { tpz.effect.SLEEP_I, 1 },
        { tpz.effect.SLEEP_II, 1 },
        { tpz.effect.SLEEP_I, 4096 },
        { tpz.effect.SLEEP_II, 4096 },
        { tpz.effect.POISON, 256 },
        { tpz.effect.PARALYSIS, 32 },
        { tpz.effect.BLINDNESS, 64 },
        { tpz.effect.SILENCE, 16 },
        { tpz.effect.STUN, 8 },
        { tpz.effect.BIND, 4 },
        { tpz.effect.WEIGHT, 2 },
        { tpz.effect.SLOW, 128 },
        { tpz.effect.ELEGY, 512 },
        { tpz.effect.REQUIEM, 1024 },
        { tpz.effect.LULLABY, 2048 },
        { tpz.effect.LULLABY, 1 },
        { tpz.effect.PETRIFICATION, 8192 },
        { tpz.effect.PETRIFICATION, 1 },
    }

    local skill = spell:getSkillType()
    local spellGroup = spell:getSpellGroup()

    -- Check for subpower
    if (subpower == nil) then
        subpower = 0
    end

    -- Check for tier
    if (tier == nil) then
        tier = 1
    end

    -- Check for immunity
    for i,statusEffect in pairs(immunities) do
        local immunity = 0
        if effect == statusEffect[1] then
            immunity = statusEffect[2]
        end
        if target:hasImmunity(immunity) then
            return spell:setMsg(tpz.msg.basic.MAGIC_IMMUNE)
        end
    end

    -- Check for resist trait proc
    if (resist == 0) then
        if not target:hasStatusEffect(effect) then
            return spell:setMsg(tpz.msg.basic.MAGIC_RESIST_2) -- Resist trait proc!
        else
            return spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    end

    -- Add Enfeebling Potency gear mod
    local enfeeblingPotency = 1 + (caster:getMod(tpz.mod.ENF_MAG_POTENCY) / 100)
    power = math.floor(power * enfeeblingPotency)

    -- Calculate duration bonuses
    local finalDuration = calculateDuration(duration, skill, spellGroup, caster, target, false)
    -- printf("Final Duration %d", finalDuration)

    -- Reduce duration by resist state
    finalDuration = finalDuration * resist
    -- printf("Final Duration %d", finalDuration)

    -- Check if resist is greater than the minimum resisit state(1/2, 1/4, etc)
    if (resist >= resistthreshold) then
        if target:getStatusEffect(effect) then
            if (target:getStatusEffect(effect):getPower() < power) then
                target:delStatusEffectSilent(effect)
            end
        end
        if target:addStatusEffect(effect, power, tick, finalDuration, 0, subpower, tier) then
            -- Check for magic burst
            if GetEnfeebleMagicBurstMessage(caster, spell, target) then
                return spell:setMsg(spell:getMagicBurstMessage()) 
            end
            -- Check for songs enfeebles
            if spell:getSkillType() == tpz.skill.SINGING then
                return spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB)
            end
            caster:delStatusEffectSilent(tpz.effect.STYMIE)
            return spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
        else
            return spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        return spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end
end

function ShouldOverwriteDiaBio(caster, target, effect, tier)
    -- Check effect trying to be applied
    if (effect == tpz.effect.BIO) then
        -- Check if target has Dia
        if target:hasStatusEffect(tpz.effect.DIA) then
            -- If targets current Dia effect is a higher tier than casted Bio, don't do anything
            if (target:getStatusEffect(tpz.effect.DIA):getTier() > tier) then
                return false
            else -- If Dia tier is lower or equal, delete Dia and apply Bio
                target:delStatusEffectSilent(tpz.effect.DIA)
                return true
            end
        end
        -- No Dia on target, apply Bio
        return true
    end

    -- Check effect trying to be applied
    if (effect == tpz.effect.DIA) then
        -- Check if target has Dia
        if target:hasStatusEffect(tpz.effect.BIO) then
            -- If targets current Bio effect is an equal tier or higher tier than casted Bio, don't do anything
            if (target:getStatusEffect(tpz.effect.BIO):getTier() >= tier) then
                return false
            else -- if Bio tier is lower, then delete Bio and apply Dia
                target:delStatusEffectSilent(tpz.effect.BIO)
                return true
            end
        end
        -- No Bio on target, apply Dia
        return true
    end

    return false
end


function ApplyProtectShell(caster, target, effect, power, duration)
    local protShellMod = target:getMod(tpz.mod.PROTECT_SHELL_EFFECT)

    if (effect == tpz.effect.PROTECT) then
        power = math.floor(power * (1 + (protShellMod / 10))) -- Percent
    elseif (effect == tpz.effect.SHELL) then
        power = power + protShellMod -- Flat
    end

    return target:addStatusEffect(effect, power, 0, duration) 
end

function CalculateAdditionalEffectChance(player, chance)
    -- THF has double the chance to apply additional effects
    if (player:getMainJob() == tpz.job.THF) then
        chance = chance * 2
    end

    return chance
end

function GetEnfeebleMagicBurstMessage(caster, spell, target)
    -- Check for magic burst message
    local params = {}
    params.AMIIburstBonus = 0
    local burst = calculateMagicBurst(caster, spell, target, params)

    if (burst > 1.0) then
        return true
    end

    return false
end

function CheckForMagicBurst(caster, spell, target)
    -- Check for magic burst then set message if true
    if GetEnfeebleMagicBurstMessage(caster, spell, target) then
        spell:setMsg(spell:getMagicBurstMessage()) 
    end
end

function CheckForGuaranteedLandRate(caster, params)
    local skills =
    {
        { tpz.mod.DIVINE_NEVER_MISS, tpz.skill.DIVINE_MAGIC },
        { tpz.mod.ENFEEBLE_NEVER_MISS, tpz.skill.ENFEEBLING_MAGIC },
        { tpz.mod.ELEM_NEVER_MISS, tpz.skill.ELEMENTAL_MAGIC },
        { tpz.mod.DARK_NEVER_MISS, tpz.skill.DARK_MAGIC },
        { tpz.mod.SUMMONING_NEVER_MISS, tpz.skill.SUMMONING_MAGIC },
        { tpz.mod.NINJUTSU_NEVER_MISS, tpz.skill.NINJUTSU },
        { tpz.mod.SINGING_NEVER_MISS, tpz.skill.SINGING },
        { tpz.mod.BLUE_NEVER_MISS, tpz.skill.BLUE_MAGIC },
    }
    for _, mod in pairs(skills) do
        local skillType
        if caster:getMod(mod[1]) > 0 then
            skillType = mod[2]
        end
        if (skillType == params.skillType) then
            return true
        end
    end

    return false
end

function getAbsorbSpellPower(caster)
    -- https://www.bg-wiki.com/ffxi/Category:Absorb_Spell
    local mJobLvl = caster:getMainLvl()
    local basePower = math.floor(3 + (mJobLvl / 5))
    local gearBonus = 1 + (caster:getMod(tpz.mod.AUGMENTS_ABSORB) / 100)
    local liberatorBonus = 1 + (caster:getMod(tpz.mod.AUGMENTS_ABSORB_II) / 100)
    local netherVoidBonus = 1

    if caster:hasStatusEffect(tpz.effect.NETHER_VOID) then
        netherVoidBonus = 1.5
    end

    local totalPower = math.floor(math.floor(basePower * (gearBonus) * liberatorBonus) * netherVoidBonus)
    return totalPower
end

function calculateDurationForLvl(duration, spellLvl, targetLvl)
    if (targetLvl < spellLvl) then
        return duration * targetLvl / spellLvl
    end

    return duration
end

function calculateDuration(duration, magicSkill, spellGroup, caster, target, useComposure)
    local casterJob = caster:getMainJob()

    if caster:isPC() then
        if magicSkill == tpz.skill.ENHANCING_MAGIC then -- Enhancing Magic
            -- Gear mods
            duration = duration + duration * caster:getMod(tpz.mod.ENH_MAGIC_DURATION) / 100

            -- prior according to bg-wiki
            if casterJob == tpz.job.RDM then
                duration = duration + caster:getMerit(tpz.merit.ENHANCING_MAGIC_DURATION) + caster:getJobPointLevel(tpz.jp.ENHANCING_DURATION)
            end

            -- Default is true
            useComposure = useComposure or (useComposure == nil and true)

            -- Composure
            if useComposure and caster:hasStatusEffect(tpz.effect.COMPOSURE) and caster:getID() == target:getID() then
                duration = duration * 3
            end

            -- Perpetuance
            if caster:hasStatusEffect(tpz.effect.PERPETUANCE) and spellGroup == tpz.magic.spellGroup.WHITE then
                duration  = duration * 2
            end
        elseif magicSkill == tpz.skill.ENFEEBLING_MAGIC then -- Enfeebling Magic
            -- Gear mods
            duration = duration + duration * caster:getMod(tpz.mod.ENFEEB_MAGIC_DURATION) / 100

            if caster:hasStatusEffect(tpz.effect.SABOTEUR) then
                if target:isNM() then
                    duration = duration * 1.25
                else
                    duration = duration * 2
                end
            end
            -- After Saboteur according to bg-wiki
            if casterJob == tpz.job.RDM then
                -- RDM Merit: Enfeebling Magic Duration
                duration = duration + caster:getMerit(tpz.merit.ENFEEBLING_MAGIC_DURATION)

                -- RDM Job Point: Enfeebling Magic Duration
                duration = duration + caster:getJobPointLevel(tpz.jp.ENFEEBLE_DURATION)

                -- RDM Job Point: Stymie effect
                if caster:hasStatusEffect(tpz.effect.STYMIE) then
                    local stymieJpBonus = (1 + caster:getJobPointLevel(tpz.jp.STYMIE_EFFECT) / 100)
                    duration = duration * 3
                    duration = duration * stymieJpBonus
                end
            end
        elseif magicSkill == tpz.skill.DARK_MAGIC then
            duration = duration * (1 + (caster:getMod(tpz.mod.DARK_MAGIC_DURATION) / 100))
        end
    end

    return math.floor(duration)
end

function calculatePotency(basePotency, magicSkill, caster, target)
    if (magicSkill ~= tpz.skill.ENFEEBLING_MAGIC) then
        return basePotency
    end

    if caster:hasStatusEffect(tpz.effect.SABOTEUR) then
        if target:isNM() then
            basePotency = math.floor(basePotency * (1.3 + caster:getMod(tpz.mod.ENHANCES_SABOTEUR)))
        else
            basePotency = math.floor(basePotency * (2 + caster:getMod(tpz.mod.ENHANCES_SABOTEUR)))
        end
    end

    return math.floor(basePotency * (1 + caster:getMod(tpz.mod.ENF_MAG_POTENCY) / 100))
end

function IgnoreResTraitCheck(caster)
    if caster:hasStatusEffect(tpz.effect.ELEMENTAL_SEAL) then
        return true
    end
    if caster:hasStatusEffect(tpz.effect.STYMIE) then
        return true
    end
    return false
end

function CalculateEmbolden(caster, target, enhPower)
    --------------------
    -- Enboden effect.
    --------------------
    --  Applied before other bonuses, pet buffs seem to not work.
    if
        not caster:isPet() and
        target:hasStatusEffect(tpz.effect.EMBOLDEN) and
        spellGroup == tpz.magic.spellGroup.WHITE
    then

        local emboldenPower = 1.5 + target:getJobPointLevel(tpz.jp.EMBOLDEN_EFFECT) / 100 -- 1 point in job point category = 1%

        enhPower = math.floor(enhPower * emboldenPower)
    end

    return enhPower
end

-- Output magic hit rate for all levels
function outputMagicHitRateInfo()
    for casterLvl = 1, 75 do

        printf("")
        printf("-------- CasterLvl: %d", casterLvl)

        for lvlMod = -5, 20 do

            local targetLvl = casterLvl + lvlMod

            if (targetLvl >= 0) then
                -- assume BLM spell, A+
                local magicAcc = utils.getSkillLvl(6, casterLvl)
                -- assume default monster magic eva, C
                local magicEvaRank = 3
                local rate = 0

                local magicEva = utils.getMobSkillLvl(magicEvaRank, targetLvl)

                local dINT = (lvlMod + 1) * -1

                if (dINT > 10) then
                    magicAcc = magicAcc + 10 + (dINT - 10)/2
                else
                    magicAcc = magicAcc + dINT
                end

                local magicHitRate = calculateMagicHitRate(magicAcc, magicEva, element, 0, casterLvl, targetLvl, 100, SDT)

                printf("Lvl: %d vs %d, %d%%, MA: %d, ME: %d", casterLvl, targetLvl, magicHitRate, magicAcc, magicEva)
            end

        end
    end
end

tpz.ma = tpz.magic
