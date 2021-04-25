-----------------------------------
-- Shadow of Death
-- Scythe weapon skill
-- Skill Level: 70
-- Delivers a dark elemental attack. Damage varies with TP.
-- Aligned with the Snow Gorget & Aqua Gorget.
-- Aligned with the Snow Belt & Aqua Belt.
-- Element: Dark
-- Modifiers: STR:40%  INT:40%
-- 100%TP    200%TP    300%TP
-- 1.00      2.50      3.00
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.ftp100 = 1.0 params.ftp200 = 1.0 params.ftp300 = 1
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 1.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.ele = tpz.magic.ele.DARK
    params.skill = tpz.skill.SCYTHE
    params.includemab = true
	params.enmityMult = 0.5

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.4 params.int_wsc = 0.4
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, action, primary)

    local resist = applyResistanceAddEffect(player, target, tpz.magic.ele.DARK, 0)
    if (damage > 0) and resist >= 0.5 then
            local power = math.floor(player:getMainLvl() / 5 ) + 3)
            local duration = 90 * resist
            target:addStatusEffect(tpz.effect.STR_DOWN, power, 0, duration)
            target:addStatusEffect(tpz.effect.DEX_DOWN, power, 0, duration)
            target:addStatusEffect(tpz.effect.VIT_DOWN, power, 0, duration)
            target:addStatusEffect(tpz.effect.AGI_DOWN, power, 0, duration)
            target:addStatusEffect(tpz.effect.INT_DOWN, power, 0, duration)
            target:addStatusEffect(tpz.effect.MND_DOWN, power, 0, duration)
            target:addStatusEffect(tpz.effect.CHR_DOWN, power, 0, duration)
    end


  
    return tpHits, extraHits, criticalHit, damage
end
