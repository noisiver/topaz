-----------------------------------------
-- Spell: Phalanx II
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local enhskill = caster:getSkillLevel(tpz.skill.ENHANCING_MAGIC) + caster:getMod(tpz.mod.ENHANCE)
    local power = 0
    local meritDuraBonus = (caster:getMerit(tpz.merit.PHALANX_II) * 10)
    local meritPowerBonus = caster:getMerit(tpz.merit.PHALANX_II)
    local baseDuration = 120 + (meritDuraBonus - 30)
    local finalDuration = calculateDuration(baseDuration, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    finalDuration = calculateDurationForLvl(finalDuration, 75, target:getMainLvl())

    if enhskill <= 300 then
        power = math.floor(enhskill / 25) + 1
        -- add merit bonus
        power = power + meritPowerBonus
        -- add gear mod
        power = power + caster:getMod(tpz.mod.PHALANX_POTENCY)
    else
        power = 13 + meritPowerBonus 
        -- add merit bonus
        power = power + math.floor((enhskill - 300.5) / 28.5)
        -- add gear mod
        power = power + caster:getMod(tpz.mod.PHALANX_POTENCY)
    end

    -- Cap at 35
    power = math.min(power, 35)

    if target:addStatusEffect(tpz.effect.PHALANX, power, 0, finalDuration) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return tpz.effect.PHALANX
end
