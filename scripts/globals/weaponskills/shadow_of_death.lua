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

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.4 params.int_wsc = 0.4
    end

    if (damage > 0) then
        local chance = (tp-1000) * applyResistanceAddEffect(player, target, tpz.magic.ele.DARK, 0) > math.random() * 150
        if (target:hasStatusEffect(tpz.effect.BIO) == false and chance) then
            local duration = (30 + (tp/1000 * 5)) * applyResistanceAddEffect(player, target, tpz.magic.ele.DARK, 0)
            local power = math.floor(player:getMainLvl() * (tp / 3000) + 1)
            target:addStatusEffect(tpz.effect.BIO, power, 0, duration)
        end
    end

    if DIA_OVERWRITE == 1 and dia ~= nil then
        if dia:getPower() == 1 then
            target:delStatusEffect(tpz.effect.DIA)
        end
    end

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, action, primary)
    return tpHits, extraHits, criticalHit, damage

end
