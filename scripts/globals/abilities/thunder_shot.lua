-----------------------------------
-- Ability: Thunder Shot
-- Consumes a Thunder Card to enhance lightning-based debuffs. Deals lightning-based magic damage
-- Shock Effect: Enhanced DoT and MND-
-----------------------------------
require("scripts/globals/ability")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/job_util")
-----------------------------------

function onAbilityCheck(player, target, ability)
    --ranged weapon/ammo: You do not have an appropriate ranged weapon equipped.
    --no card: <name> cannot perform that action.
    if player:getWeaponSkillType(tpz.slot.RANGED) ~= tpz.skill.MARKSMANSHIP or player:getWeaponSkillType(tpz.slot.AMMO) ~= tpz.skill.MARKSMANSHIP then
        return 216, 0
    end
    if player:hasItem(2180, 0) or player:hasItem(2974, 0) then
        return 0, 0
    else
        return 71, 0
    end
end

function onUseAbility(player, target, ability, action)
    local params = {}
    params.includemab = true
    local dmg = (2 * (player:getRangedDmg() + player:getAmmoDmg()) + player:getMod(tpz.mod.QUICK_DRAW_DMG)) * (1 + player:getMod(tpz.mod.QUICK_DRAW_DMG_PERCENT) / 100)
    local bonusAcc = player:getStat(tpz.mod.AGI) / 2 + player:getMerit(tpz.merit.QUICK_DRAW_ACCURACY) + player:getMod(tpz.mod.QUICK_DRAW_MACC)

    dmg = dmg + (2 * player:getJobPointLevel(tpz.jp.QUICK_DRAW_EFFECT))
    dmg = math.floor(dmg * applyResistanceAbility(player, target, tpz.magic.ele.LIGHTNING, tpz.skill.MARKSMANSHIP, bonusAcc))
    dmg = addBonusesAbility(player, tpz.magic.ele.LIGHTNING, target, dmg, params)
    dmg = adjustForTarget(target, dmg, tpz.magic.ele.LIGHTNING)

    params.targetTPMult = 0 -- Quick Draw does not feed TP
    dmg = takeAbilityDamage(target, player, params, true, dmg, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING, tpz.slot.RANGED, 1, 0, 0, 0, action, nil)

    if dmg > 0 then
        local effects = {}
        local shock = target:getStatusEffect(tpz.effect.SHOCK)
        if shock ~= nil then
            table.insert(effects, shock)
        end

        local threnody = target:getStatusEffect(tpz.effect.THRENODY)
        if threnody ~= nil and threnody:getSubPower() == tpz.mod.WATERRES then
            table.insert(effects, threnody)
        end

        if #effects > 0 then
            local effect = effects[math.random(#effects)]
            local duration = effect:getDuration()
            local startTime = effect:getStartTime()
            local tick = effect:getTick()
            local power = effect:getPower()
            local subpower = effect:getSubPower()
            local tier = effect:getTier()
            local effectId = effect:getType()
            local subId = effect:getSubType()
            -- https://www.bg-wiki.com/ffxi/Quick_Draw
            power = power + 4
            target:delStatusEffectSilent(effectId)
            target:addStatusEffect(effectId, power, tick, duration, subId, subpower, tier)
            local newEffect = target:getStatusEffect(effectId)
            newEffect:setStartTime(startTime)
        end
        local tp = utils.CalcualteTPGiven(player, target, true)
        jobUtil.HandleCorsairShoTP(player, target, dmg, tp)
    end

    local del = player:delItem(2180, 1) or player:delItem(2974, 1)
    target:updateClaim(player)
    return dmg
end
