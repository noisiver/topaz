---------------------------------------------------
-- Ranged Attack
---------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")
require("scripts/globals/weaponskills")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onPetAbility(target, pet, skill)
    local numhits = 1
    local params = {}
    params.ftp100 = 1.0
    params.ftp200 = 1.0
    params.ftp300 = 1.0
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.NO_TP_CONSUMPTION = true

    local damage = AutoPhysicalWeaponSkill(pet, target, skill, tpz.attackType.RANGED, numhits, TP_NONE, params)
    dmg = AutoPhysicalFinalAdjustments(damage.dmg, pet, skill, target, tpz.attackType.RANGED, tpz.damageType.RANGED, damage.hitslanded, params)

    -- Check for Barrage Turbine attachment
    -- Like barrage, once an arrow misses, it stops trying to hit with other arrows
    local barrageCount = pet:getLocalVar("turbine_barrage")
    if pet:getLocalVar("turbine_barrage") > 0 then
        local hitrate = getRangedHitRate(pet, target, true, 0)
        while numhits < barrageCount do
            if (math.random() <= hitrate) then
                numhits = numhits + 1
            else
                break
            end
        end
    end

    dmg = dmg * numhits

    return dmg
end
