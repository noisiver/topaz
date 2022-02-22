-----------------------------------
-- Tachi Yukikaze
-- Great Katana weapon skill
-- Skill Level: 200 (Samurai only.)
-- Blinds target. Damage varies with TP.
-- Blind effect duration is 60 seconds when unresisted.
-- Will stack with Sneak Attack.
-- Tachi: Yukikaze appears to have an attack bonus of 50%. http://www.bg-wiki.com/bg/Tachi:_Yukikaze
-- Aligned with the Snow Gorget & Breeze Gorget.
-- Aligned with the Snow Belt & Breeze Belt.
-- Element: None
-- Modifiers: STR:75%
-- 100%TP    200%TP    300%TP
-- 1.5625    2.6875    4.125
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 1.5625 params.ftp200 = 1.875 params.ftp300 = 2.5
    params.str_wsc = 0.75 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1.5; params.atk200 = 1.5; params.atk300 = 1.5

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp200 = 2.6875 params.ftp300 = 4.125
        params.atk100 = 1.5; params.atk200 = 1.5; params.atk300 = 1.5
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
		if damage > 0 then player:trySkillUp(target, tpz.skill.GREAT_KATANA, tpHits+extraHits) end
		if damage > 0 then target:tryInterruptSpell(player, tpHits+extraHits) end
    local IgnisRunes = player:getLocalVar("UndaRunes")
    if damage > 0 and UndaRunes <=2 then
        for v = 523,527,1 do
            player:delStatusEffectSilent(v)
        end
        for v = 529,530,1 do
            player:delStatusEffectSilent(v)
        end
        player:addStatusEffect(tpz.effect.UNDA, 1, 0, 300)
    end
    local effect = tpz.effect.BLINDNESS
    local resist = applyResistanceAddEffect(player, target, tpz.magic.ele.DARK, 0)
    local power = 25

    if damage > 0 and (canOverwrite(target, effect, power)) and resist >= 0.5 then
        local duration = 60 * resist
        target:delStatusEffectSilent(effect)
        target:addStatusEffect(effect, power, 3, duration)
    end
    return tpHits, extraHits, criticalHit, damage

end
