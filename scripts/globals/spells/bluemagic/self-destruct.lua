-----------------------------------------
-- Spell: Self-Destruct
-- Sacrifices HP to damage enemies within range. Affects caster with Weakness
-- Spell cost: 100 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 3
-- Stat Bonus: STR+2
-- Level: 50
-- Casting Time: 3.25 seconds
-- Recast Time: 21 seconds
-- Magic Bursts on: Liquefaction, Fusion, and Light
-- Combos: Auto Refresh
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/bluemagic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    if caster:isMob() then
        return 1
    end
    caster:setLocalVar("self-destruct_hp", caster:getHP())
    return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC
    params.bonus = 0
    params.attackType = tpz.attackType.MAGICAL
    params.damageType = tpz.damageType.FIRE
    local multi = 0
    params.multiplier = 0
    params.tMultiplier = 0
    params.duppercap = 100
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    local playerHP = caster:getLocalVar("self-destruct_hp")
    local damage = ((playerHP - 1) * 1.25) 
    local resist = applyResistance(caster, target, spell, params)
    damage = math.floor(damage * resist)
    damage = math.floor(addBonuses(caster, spell, target, damage))

	if (target:isUndead()) then
		damage = damage * (1.25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION)/100 + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)/100)
		params.bonus = 25 + caster:getMerit(tpz.merit.MONSTER_CORRELATION) + caster:getMod(tpz.mod.MONSTER_CORRELATION_BONUS)
	end

    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
    if spell:getMsg() ~= tpz.msg.basic.MAGIC_FAIL then
        caster:setHP(1)
    end

    return damage
end
