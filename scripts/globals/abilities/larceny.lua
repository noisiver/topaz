-----------------------------------
-- Ability: Larceny
-- Description: Steals one beneficial effect from the target enemy.
-- Obtained: THF Level 96
-- Recast Time: 01:00:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability, action)
    local effectStolen
    local effectID = 0
    local jpValue  = player:getJobPointLevel(tpz.jp.LARCENY_EFFECT)

    local stealableSPEffects =
{
    tpz.effect.MIGHTY_STRIKES,   tpz.effect.HUNDRED_FISTS, tpz.effect.MANAFONT,     tpz.effect.CHAINSPELL,
    tpz.effect.PERFECT_DODGE,    tpz.effect.INVINCIBLE,    tpz.effect.BLOOD_WEAPON, tpz.effect.SOUL_VOICE,
    tpz.effect.MEIKYO_SHISUI,    tpz.effect.AZURE_LORE,    tpz.effect.TRANCE,       tpz.effect.BOLSTER,
    tpz.effect.ELEMENTAL_SFORZO
}

    -- SP Abilities have priority, check if one is present first
    for i = 1, #stealableSPEffects do
        if target:hasStatusEffect(stealableSPEffects[i]) then
            effectStolen = target:getStatusEffect(stealableSPEffects[i])
            break
        end
    end

    -- Default is no SP Ability found
    if effectStolen == nil then
        effectID = player:stealStatusEffect(target)

        local newStatus = player:getStatusEffect(effectID)

        if newStatus then
            newStatus:setDuration((newStatus:getDuration() + jpValue) * 1000)
        end
    -- Copy an SP Ability if found
    else
        local newID       = effectStolen:getEffectType()
        local newIcon     = effectStolen:getIcon()
        local newPower    = effectStolen:getPower()
        local newTick     = effectStolen:getTick()
        local newDuration = effectStolen:getDuration() + jpValue

        player:addStatusEffectEx(newID, newIcon, newPower, newTick, newDuration)
        target:delStatusEffect(newID)

        effectID = newID
    end

    if effectID == 0 then
        action:setAnimation(target:getID(), 182)
        ability:setMsg(tpz.msg.basic.STEAL_FAIL)
    end

    target:updateClaim(player)

    return effectID
end
