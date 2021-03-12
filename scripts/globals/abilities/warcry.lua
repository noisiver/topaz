-----------------------------------
-- Ability: Warcry
-- Enhances attacks of party members within area of effect.
-- Obtained: Warrior Level 35
-- Recast Time: 5:00
-- Duration: 0:30
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local merit = player:getMerit(tpz.merit.SAVAGERY)
    local power = 0
    local duration = 30

    if player:getMainJob() == tpz.job.WAR then
        power = math.floor((player:getMainLvl()/4)+4.75)/256
    else
        power = math.floor((player:getSubLvl()/4)+4.75)/256
    end
    player:updateEnmity(target, 7800, 7800)
    local PT = getPartySize()

   --[[[ 
    if PT  == 2 then
         player:updateEnmity(target, 1, 600)
    elseif PT  == 3 then
         player:updateEnmity(target, 1, 900)
    elseif PT  == 4 then
         player:updateEnmity(target, 1, 1200)
    elseif PT  == 5 then
         player:updateEnmity(target, 1, 1500)
    elseif PT  == 6 then
         player:updateEnmity(target, 1, 1800)
    else
         player:updateEnmity(target, 1, 300)
    end
    --]]


    power = power * 100
    duration = duration + player:getMod(tpz.mod.WARCRY_DURATION)


    target:addStatusEffect(tpz.effect.WARCRY, power, 0, duration, 0, merit)
end
