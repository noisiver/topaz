-----------------------------------
-- Penta Thrust
-- Polearm weapon skill
-- Skill Level: 150
-- Delivers a five-hit attack. params.accuracy varies with TP.
-- 0.875 Attack penalty
-- Will stack with Sneak Attack.
-- Aligned with the Shadow Gorget.
-- Aligned with the Shadow Belt.
-- Element: None
-- Modifiers: STR:20%  DEX:20%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 5
    params.ftp100 = 1 params.ftp200 = 1 params.ftp300 = 1
    params.str_wsc = 0.2 params.dex_wsc = 0.2 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.accuracyVariesWithTP = true
    params.atk100 = 0.875; params.atk200 = 0.875; params.atk300 = 0.875
    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
	if damage > 0 then player:trySkillUp(target, tpz.skill.POLEARM, tpHits+extraHits) end
	if damage > 0 then target:tryInterruptSpell(player, tpHits+extraHits) end
    local IgnisRunes = player:getLocalVar("IgnisRunes")
    local RuneDuration = 7200
    if player:getMainJob() == tpz.job.SAM then 
        if damage > 0 and IgnisRunes <=2 then
            for v = 524,530,1 do
                player:delStatusEffectSilent(v)
            end
            player:addStatusEffect(tpz.effect.IGNIS, 1, 0, RuneDuration)
        end
    end
    return tpHits, extraHits, criticalHit, damage

end
