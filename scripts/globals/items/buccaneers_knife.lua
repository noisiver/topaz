-----------------------------------------
-- ID: 17622
-- Item: Buccaneer's Knife
-- Additional Effect: Water damage when facing brigandish blade.
-----------------------------------------
require("scripts/globals/msg")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    if target:getID() == 17502568 and (player:getEquipID(tpz.slot.MAIN) == 17622) then
        local chance = 90

    if (math.random(0, 99) >= chance) then
        return 0, 0, 0
    else
        local dmg = 15
        local params = {}
        params.bonusmab = 0
        params.includemab = false
        dmg = addBonusesAbility(player, tpz.magic.ele.WATER, target, dmg, params)
        dmg = dmg * applyResistanceAddEffect(player, target, tpz.magic.ele.WATER, 0)
        dmg = adjustForTarget(target, dmg, tpz.magic.ele.WATER)
        dmg = finalMagicNonSpellAdjustments(player, target, tpz.magic.ele.WATER, dmg)
		target:setUnkillable(false)

		local message = tpz.msg.basic.ADD_EFFECT_DMG
		if (dmg < 0) then
			message = tpz.msg.basic.ADD_EFFECT_HEAL
		end
			return tpz.subEffect.WATER_DAMAGE, message, dmg
        end
    end
end
