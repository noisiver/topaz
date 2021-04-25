-----------------------------------------
-- ID: 18153
-- Item: Lightning Arrow
-- Additional Effect: Lightning Damage
-- Bolt dmg is affected by lightning/earth staves and Chatoyant
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 105
    local SDT = target:getMod(tpz.mod.SDT_LIGHTNING)

    if SDT <= 5 then
        chance = 0
    end
    if (math.random(0, 99) >= chance) then
        return 0, 0, 0
    else
        local dmg = (player:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)) + 20
        dmg = dmg * (SDT / 100)
        if (dmg > 120) then
            dmg = 120
        end
        local params = {}
        params.bonusmab = 0
        params.includemab = true
        dmg = addBonusesAbility(player, tpz.magic.ele.LIGHTNING, target, dmg, params)
        dmg = adjustForTarget(target, dmg, tpz.magic.ele.LIGHTNING)
        dmg = finalMagicNonSpellAdjustments(player, target, tpz.magic.ele.LIGHTNING, dmg)
        return tpz.subEffect.LIGHTNING_DAMAGE, tpz.msg.basic.ADD_EFFECT_DMG, dmg
    end
end
