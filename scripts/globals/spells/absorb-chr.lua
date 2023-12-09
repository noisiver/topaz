--------------------------------------
-- Spell: Absorb-CHR
-- Steals an enemy's Charism.
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

    local dINT = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    local params = {}
    params.diff = dINT
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.DARK_MAGIC
    params.bonus = 0
    params.effect = nil
    local power = getAbsorbSpellPower(caster)
    local tick = 0
    local duration = 90
    local resist = applyResistanceEffect(caster, target, spell, params)

    duraion = duration * resist

    if (resist >= 0.5) then
        spell:setMsg(tpz.msg.basic.MAGIC_ABSORB_CHR)
        HandleDrkRelicHelm(caster)
        caster:delStatusEffectSilent(tpz.effect.CHR_BOOST)
        target:delStatusEffectSilent(tpz.effect.CHR_DOWN)
	    caster:addStatusEffect(tpz.effect.CHR_BOOST, power, tick, duration) -- caster gains ACC
	    target:addStatusEffect(tpz.effect.CHR_DOWN, power, tick, duration)   -- target loses ACC
        caster:delStatusEffectSilent(tpz.effect.NETHER_VOID)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end
    return tpz.effect.CHR_BOOST
end
