-----------------------------------------
-- Spell: Blade Madrigal
-- Gives party members accuracy
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local sLvl = caster:getSkillLevel(tpz.skill.SINGING) -- Gets skill level of Singing
    local iLvl = caster:getWeaponSkillLevel(tpz.slot.RANGED)

    --local power = 9
    local power = 11 + math.floor((sLvl+iLvl) / 40)

    -- if (power >= 60) then
     --   power = 60
          if (power >= 25) then
        power = 25
    end

    local iBoost = caster:getMod(tpz.mod.MADRIGAL_EFFECT) + caster:getMod(tpz.mod.ALL_SONGS_EFFECT)
    if (iBoost > 0) then
        --power = power + iBoost*6
    power = power + iBoost*2.5 --30
    end

    power =  power + caster:getMerit(tpz.merit.MADRIGAL_EFFECT)

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

    if not (target:addBardSong(caster, tpz.effect.MADRIGAL, power, 0, duration, caster:getID(), 0, 2)) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return tpz.effect.MADRIGAL
end
