-----------------------------------
-- Ability: Elemental Siphon
-- Drains MP from your summoned spirit.
-- Obtained: Summoner level 50
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local pet = player:getPetID()
    if (pet >= 0 and pet <= 7) then -- spirits
        return 0, 0
    else
        return tpz.msg.basic.UNABLE_TO_USE_JA, 0
    end
end

function onUseAbility(player,target,ability)
    local spiritEle = player:getPetID() + 1 -- get the spirit's ID, it is already aligned in proper element order
    -- element order: fire, ice, wind, earth, thunder, water, light, dark

    local pEquipMods = player:getMod(tpz.mod.ENHANCES_ELEMENTAL_SIPHON)
    local basePower = player:getSkillLevel(tpz.skill.SUMMONING_MAGIC) + pEquipMods - 50
    if (basePower < 0) then
        basePower = 0
    end
    local weatherDayBonus = 1
    local day = VanadielDayElement()
    local dayElement = 0
    local weather = player:getWeather()
    if day == 1 then dayElement = 0
    elseif day == 2 then dayElement = 1
    elseif day == 3 then dayElement = 2
    elseif day == 4 then dayElement = 3
    elseif day == 5 then dayElement = 4
    elseif day == 6 then dayElement = 5
    elseif day == 7 then dayElement = 6
    elseif day == 8 then dayElement = 7
    end

    -- Day bonus/penalty
    if (dayElement == tpz.magic.dayStrong[spiritEle]) then
        weatherDayBonus = weatherDayBonus + 0.1
    elseif (dayElement == tpz.magic.dayWeak[spiritEle]) then
        weatherDayBonus = weatherDayBonus - 0.1
    end
    -- Weather bonus/penalty
    if (weather == tpz.magic.singleWeatherStrong[spiritEle]) then
        weatherDayBonus = weatherDayBonus + 0.1
    elseif (weather == tpz.magic.singleWeatherWeak[spiritEle]) then
        weatherDayBonus = weatherDayBonus - 0.1
    elseif (weather == tpz.magic.doubleWeatherStrong[spiritEle]) then
        weatherDayBonus = weatherDayBonus + 0.25
    elseif (weather == tpz.magic.doubleWeatherWeak[spiritEle]) then
        weatherDayBonus = weatherDayBonus - 0.25
    end

    local power = math.floor(basePower * weatherDayBonus)
    --printf("power  %u", power)
    local spirit = player:getPet()
    power = utils.clamp(power, 0, spirit:getMP()) -- cap MP drained at spirit's MP
    power = utils.clamp(power, 0, player:getMaxMP() - player:getMP()) -- cap MP drained at the max MP - current MP

    spirit:delMP(power)
    return player:addMP(power)
end
