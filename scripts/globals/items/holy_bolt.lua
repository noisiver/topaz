-----------------------------------------
-- ID: 18153
-- Item: Holy Bolt
-- Additional Effect: Light Damage
-- Bolt dmg is affected by light/dark staves and Chatoyant
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 105
    local SDT = target:getMod(tpz.mod.SDT_LIGHT)

    if SDT <= 5 then
        chance = 0
    end
   chance = chance * (SDT / 100)
    if (math.random(0, 99) >= chance) then
        return 0, 0, 0
    else
        local dmg = (player:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND)) + 20
        if (dmg > 120) then
            dmg = 120
        end
        local params = {}
        params.bonusmab = 0
        params.includemab = true
        dmg = addBonusesAbility(player, tpz.magic.ele.LIGHT, target, dmg, params)
        dmg = adjustForTarget(target, dmg, tpz.magic.ele.LIGHT)
        dmg = finalMagicNonSpellAdjustments(player, target, tpz.magic.ele.LIGHT, dmg)
        return tpz.subEffect.LIGHT_DAMAGE, tpz.msg.basic.ADD_EFFECT_DMG, dmg
    end
end
