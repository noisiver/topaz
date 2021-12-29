---------------------------------------------
--  Gigaflare
--  Family: Bahamut
--  Description: Deals massive Fire damage to enemies within a fan-shaped area.
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range:
--  Notes: Used by Bahamut when at 10% of its HP, and can use anytime afterwards at will.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local mobhp = mob:getHPP()

    if (mobhp <= 10) then -- set up Gigaflare for being called by the script again.
        mob:setLocalVar("GigaFlare", 0)
        mob:SetMobAbilityEnabled(false) -- disable mobskills/spells until Gigaflare is used successfully (don't want to delay it/queue Megaflare)
        mob:SetMagicCastingEnabled(false)
    end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
    mob:setLocalVar("GigaFlare", 1) -- When set to 1 the script won't call it.
    mob:setLocalVar("tauntShown", 0)
    mob:SetMobAbilityEnabled(true) -- enable the spells/other mobskills again
    mob:SetMagicCastingEnabled(true)
    if (bit.band(mob:getBehaviour(), tpz.behavior.NO_TURN) == 0) then -- re-enable noturn
        mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
    end

    local dmgmod = MobBreathMove(mob, target, 0.10, 1, tpz.magic.ele.FIRE, 1200)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.FIRE, MOBPARAM_WIPE_SHADOWS)

    target:takeDamage(dmg, mob, tpz.attackType.BREATH, tpz.damageType.FIRE)
    return dmg
end
