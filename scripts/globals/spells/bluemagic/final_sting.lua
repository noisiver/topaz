-----------------------------------------
-- Spell: Final Sting
-- Delivers an area of attack attack. Accuracy varies with TP
-- Spell cost: 39 MP
-- Monster Type: Vermin
-- Spell Type: Physical (Ranged)
-- Blue Magic Points: 3
-- Stat Bonus: STR+1 HP+5
-- Level: 60
-- Casting Time: 4 seconds
-- Recast Time: 45 seconds
-- Skillchain property: Transfixion (can open Compression, Reverberation, or Distortion)
-- Combos: Plantoid Killer
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    spell:setFlag(tpz.magic.spellFlag.IGNORE_SHADOWS)
    caster:setLocalVar("final_sting_hp", caster:getHP())
    return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.tpmod = TPMOD_NONE
    params.attackType = tpz.attackType.PHYSICAL
    params.damageType = tpz.damageType.PIERCING
    params.scattr = SC_TRANSFIXION
    params.numhits = 1
    params.multiplier = 1.0
    params.tp150 = 1.0
    params.tp300 = 1.0
    params.azuretp = 1.0
    params.duppercap = 80
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.eco = ECO_VERMIN
    params.shadowbehav = BLUPARAM_IGNORE_SHADOWS

    local playerHP = caster:getLocalVar("final_sting_hp")
    damage = ((playerHP - 1) * 1.25)
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    if (spell:getMsg() ~= tpz.msg.basic.MAGIC_FAIL) then
        caster:setHP(1)
    end

    return damage
end
