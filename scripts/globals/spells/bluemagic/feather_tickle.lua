-----------------------------------------
-- Spell: Feather Tickle
-- Reduces an enemy's TP
-- Spell cost: 48 MP
-- Monster Type: Birds
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 3
-- Stat Bonus: AGI+1
-- Level: 64
-- Casting Time: 4 seconds
-- Recast Time: 26 seconds
-- Magic Bursts on: Detonation, Fragmentation, and Light
-- Combos: Clear Mind
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    local resist = applyResistance(caster, target, spell, params)
	local cap = target:getTP() * 0.4
    local dmg = 1200 * resist

	    if ((target:getTP()) < dmg) then
            dmg = target:getTP()
        end

        if (dmg > cap) then
            dmg = cap
        end

    if (target:getTP() == 0) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    else
        target:delTP(dmg)
        spell:setMsg(tpz.msg.basic.MAGIC_TP_REDUCE)
    end

    return tp
end
