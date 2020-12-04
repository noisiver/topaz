-----------------------------------------
-- Spell: Paralyze
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and MND.
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local dMND = caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND)
    local MND = caster:getStat(tpz.mod.MND) -- added

    -- Calculate potency.
    --local potency = utils.clamp(math.floor(dMND / 4) + 15, 5, 25)
    local potency = utils.clamp(math.floor(2*(MND+dMND) / .10, 5, 25)
    potency = calculatePotency(potency, spell:getSkillType(), caster, target)

    -- Calculate duration.
    local duration = calculateDuration(120, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    -- printf("Duration : %u", duration)
    -- printf("Potency : %u", potency)
    local params = {}
    params.diff = dMND
    params.skillType = tpz.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = tpz.effect.PARALYSIS
    local resist = applyResistanceEffect(caster, target, spell, params)

    if resist >= 0.25 then -- effect taken  changed from 0.5
        if target:addStatusEffect(params.effect, power, 3, duration * resist) then
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else -- resist entirely.
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end
