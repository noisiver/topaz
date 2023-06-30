-----------------------------------
-- Mystic Boon
-- Club weapon skill
-- Skill level: N/A
-- Heals, removes all negative status effects, applies regen and grants a MDB bonus to party members in range. Damage varies with TP. Yagrush: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (White Mage) quest.
-- Damage is significantly affected by Attack. Verification Needed
-- Not aligned with any "elemental gorgets" or elemental belts due to it's absence of Skillchain properties.
-- Element: None
-- Modifiers: STR:30%  MND:70%
-- 100%TP    200%TP    300%TP
-- 2.5        4.0        7.0
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 1 params.ftp200 = 1.5 params.ftp300 = 2
    params.str_wsc = 0.3 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0
    params.mnd_wsc = 0.5 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 2; params.atk200 = 2; params.atk300 = 2

    if USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftp100 = 2.5 params.ftp200 = 4 params.ftp300 = 7
        params.mnd_wsc = 0.7
    end

    -- Apply aftermath
    tpz.aftermath.addStatusEffect(player, tp, tpz.slot.MAIN, tpz.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
	if damage > 0 then player:trySkillUp(target, tpz.skill.CLUB, tpHits+extraHits) end
	if damage > 0 then target:tryInterruptSpell(player, tpHits+extraHits) end

    local party = player:getParty()
    local healAmount = math.floor(damage / 2)
    local regenAmount = math.floor(player:getMainLvl() / 4)

    if party ~= nil then
        for _,member in ipairs(party) do
            if ((member:getMaxHP() - member:getHP()) < healAmount) then
                healAmount = (member:getMaxHP() - member:getHP())
            end
            member:addHP(healAmount)
            player:updateEnmityFromCure(member, healAmount)
            member:removeAllNegativeEffects()
            if not member:hasStatusEffect(tpz.effect.REGEN) then
                member:addStatusEffect(tpz.effect.REGEN, regenAmount, 3, 30)
            end
            if not member:hasStatusEffect(tpz.effect.tpz.effect.MAGIC_DEF_BOOST) then
                member:addStatusEffect(tpz.effect.tpz.effect.MAGIC_DEF_BOOST, 25, 0, 60)
            end
        end
    end

    return tpHits, extraHits, criticalHit, damage
end
