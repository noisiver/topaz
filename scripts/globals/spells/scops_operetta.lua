-----------------------------------------
-- Spell: Scop's Operetta
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

    local power = 10

    if (sLvl+iLvl > 200) then
         power = power + math.floor((sLvl + iLvl)/15)
    end

    -- if (power >= 80) then
    --   power = 80
    if (power >= 40) then
        power = 40
    end

   local iBoost = caster:getMod(tpz.mod.OPERETTA_EFFECT) + caster:getMod(tpz.mod.ALL_SONGS_EFFECT)
   if (iBoost > 0) then
        power = power + iBoost*4
   end

    power =  power + caster:getMerit(tpz.merit.OPERETTA_EFFECT)

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

    if not (target:addBardSong(caster, tpz.effect.OPERETTA, power, 0, duration, caster:getID(), 0, 1)) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return tpz.effect.OPERETTA
end
