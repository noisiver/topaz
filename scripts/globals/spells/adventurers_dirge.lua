-----------------------------------------
-- Spell: Mage's DIRGE
-- Lower's target's enmity.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
	local meritBonus = caster:getMerit(tpz.merit.ADVENTURERS_DIRGE)
    local power = 10 + meritBonus

    local iBoost = caster:getMod(tpz.mod.DIRGE_EFFECT) + caster:getMod(tpz.mod.ALL_SONGS_EFFECT)
    power = power + iBoost

    if (caster:hasStatusEffect(tpz.effect.SOUL_VOICE)) then
        power = power * 2
    elseif (caster:hasStatusEffect(tpz.effect.MARCATO)) then
        power = power * 1.5
    end
    caster:delStatusEffect(tpz.effect.MARCATO)

    local duration = 1800
    duration = duration * ((iBoost * 0.1) + (caster:getMod(tpz.mod.SONG_DURATION_BONUS)/100) + 1)

    if (caster:hasStatusEffect(tpz.effect.TROUBADOUR)) then
        duration = duration * 2
    end

    if not (target:addBardSong(caster, tpz.effect.DIRGE, power, 0, duration, caster:getID(), 0, 1)) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return tpz.effect.DIRGE
end
