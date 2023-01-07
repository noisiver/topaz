-----------------------------------
-- Vorpal Thrust
-- Polearm weapon skill
-- Skill Level: 175
-- Delivers a single-hit attack. Chance of params.critical varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Aqua Gorget & Light Gorget.
-- Aligned with the Aqua Belt & Light Belt.
-- Element: None
-- Modifiers: STR:30%  DEX:30%
-- 100%TP    200%TP    300%TP
-- 1.50      1.50      1.50
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 1.5 params.ftp200 = 1.5 params.ftp300 = 1.5
    params.str_wsc = 0.3 params.dex_wsc = 0.3 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.5 params.crit200 = 0.6 params.crit300 = 0.7
    params.canCrit = true
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.5 params.agi_wsc = 0.5
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
	if damage > 0 then player:trySkillUp(target, tpz.skill.POLEARM, tpHits+extraHits) end
	if damage > 0 then target:tryInterruptSpell(player, tpHits+extraHits) end
    local LuxRunes = player:getLocalVar("LuxRunes")
    local RuneDuration = 7200
    if player:getMainJob() == tpz.job.SAM then 
        if damage > 0 and LuxRunes <=2 then
            for v = 523,528,1 do
                player:delStatusEffectSilent(v)
            end
            player:addStatusEffect(tpz.effect.LUX, 1, 0, RuneDuration)
        end
    end

    return tpHits, extraHits, criticalHit, damage

end
