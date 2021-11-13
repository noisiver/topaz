--------------------------------------
-- Spell: Absorb-VIT
-- Steals an enemy's vitality.
--------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)

    if (target:hasStatusEffect(tpz.effect.VIT_DOWN) or caster:hasStatusEffect(tpz.effect.VIT_BOOST)) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    else
        local dINT = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
        local params = {}
        params.diff = nil
        params.attribute = tpz.mod.INT
        params.skillType = 37
        params.bonus = 0
        params.effect = nil
        local resist = applyResistance(caster, target, spell, params)
		local NetherVoidBonus = 1.5
        if (resist < 0.5) then
            spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_ABSORB_VIT)
			if caster:hasStatusEffect(tpz.effect.NETHER_VOID) then
				caster:addStatusEffect(tpz.effect.VIT_BOOST, ABSORB_SPELL_AMOUNT*resist*((100+(caster:getMod(tpz.mod.AUGMENTS_ABSORB)))/100) * NetherVoidBonus, ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK) -- caster gains VIT
				target:addStatusEffect(tpz.effect.VIT_DOWN, ABSORB_SPELL_AMOUNT*resist*((100+(caster:getMod(tpz.mod.AUGMENTS_ABSORB)))/100) * NetherVoidBonus, ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK)    -- target loses VIT
			else
				caster:addStatusEffect(tpz.effect.VIT_BOOST, ABSORB_SPELL_AMOUNT*resist*((100+(caster:getMod(tpz.mod.AUGMENTS_ABSORB)))/100), ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK) -- caster gains VIT
				target:addStatusEffect(tpz.effect.VIT_DOWN, ABSORB_SPELL_AMOUNT*resist*((100+(caster:getMod(tpz.mod.AUGMENTS_ABSORB)))/100), ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK)    -- target loses VIT
			end
        end
    end
	caster:delStatusEffectSilent(tpz.effect.NETHER_VOID)
    return tpz.effect.VIT_DOWN
end
