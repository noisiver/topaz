-----------------------------------------
-- Spell: Valor Minuet IV
-- Grants Attack bonus to all allies.
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

    --local power = 31
     local power = 26 + math.floor((sLvl+iLvl) / 15)
    --if (sLvl+iLvl > 300) then
     --   power = power + math.floor((sLvl+iLvl-300) / 6)
   -- end

    --if (power >= 112) then
        --power = 112
         if (power >= 56) then
        power = 56
    end

    local iBoost = caster:getMod(tpz.mod.MINUET_EFFECT) + caster:getMod(tpz.mod.ALL_SONGS_EFFECT)
    if (iBoost > 0) then
       -- power = power + iBoost*11
     power = power + iBoost*5.5 -- 67
    end

    power =  power + caster:getMerit(tpz.merit.MINUET_EFFECT)

    if (caster:hasStatusEffect(tpz.effect.SOUL_VOICE)) then
        power = power * 2
    elseif (caster:hasStatusEffect(tpz.effect.MARCATO)) then
        power = power * 1.5
    end
    caster:delStatusEffectSilent(tpz.effect.MARCATO)

    local duration = 1800
    duration = duration * ((iBoost * 0.1) + (caster:getMod(tpz.mod.SONG_DURATION_BONUS)/100) + 1)

    if (caster:hasStatusEffect(tpz.effect.TROUBADOUR)) then
        duration = duration * 2
    end

    if not (target:addBardSong(caster, tpz.effect.MINUET, power, 0, duration, caster:getID(), 0, 4)) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return tpz.effect.MINUET
end
