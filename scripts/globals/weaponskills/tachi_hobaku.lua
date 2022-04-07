-----------------------------------
-- Tachi Hobaku
-- Great Katana weapon skill
-- Skill Level: 30
-- Stuns enemy. Chance of stun varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Snow Gorget.
-- Aligned with the Snow Belt.
-- Element: None
-- Modifiers: STR:60%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)

    local params = {}
    params.numHits = 1
    params.ftp100 = 1.8 params.ftp200 = 1.8 params.ftp300 = 1.8
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.35 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = 1; params.atk200 = 1; params.atk300 = 1

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.str_wsc = 0.6
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
		if damage > 0 then player:trySkillUp(target, tpz.skill.GREAT_KATANA, tpHits+extraHits) end
		if damage > 0 then target:tryInterruptSpell(player, tpHits+extraHits) end
    local UndaRunes = player:getLocalVar("UndaRunes")
    local RuneDuration = player:getMainLvl() + 15
    if damage > 0 and UndaRunes <=2 then
        for v = 523,527,1 do
            player:delStatusEffectSilent(v)
        end
        for v = 529,530,1 do
            player:delStatusEffectSilent(v)
        end
        player:addStatusEffect(tpz.effect.UNDA, 1, 0, RuneDuration)
    end

    local chance = (tp - 1000) * applyResistanceAddEffect(player, target, tpz.magic.ele.LIGHTNING, 0) > math.random() * 150
    if (damage > 0 and chance) then
        if (target:hasStatusEffect(tpz.effect.STUN) == false) then
            target:addStatusEffect(tpz.effect.STUN, 1, 0, 4)
        end
    end
    return tpHits, extraHits, criticalHit, damage

end
