-----------------------------------
-- Attachment: Volt Gun
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/job_util")
-----------------------------------
-- TODO: Formula

function onEquip(pet)
    local dmg = CalculateVoltGunDmg(pet)
    pet:addMod(tpz.mod.ENSPELL, tpz.magic.element.THUNDER)
    pet:addMod(tpz.mod.ENSPELL_DMG, dmg)
    pet:addMod(tpz.mod.ENSPELL_CHANCE, 100)
    pet:setLocalVar("volt_gun_manuevers", 0)
end

function onUnequip(pet)
    pet:delMod(tpz.mod.ENSPELL, tpz.magic.element.THUNDER)
    pet:delMod(tpz.mod.ENSPELL_DMG, pet:getMod(tpz.mod.ENSPELL_DMG))
    pet:delMod(tpz.mod.ENSPELL_CHANCE, 100)
    pet:setLocalVar("volt_gun_manuevers", 0)
end

function onManeuverGain(pet, maneuvers)
    local voltGunBonus = pet:getLocalVar("volt_gun_manuevers")
    local dmg = CalculateVoltGunDmg(pet)
    if maneuvers == 1 then
        pet:setLocalVar("volt_gun_manuevers", voltGunBonus + 33)
    elseif maneuvers == 2 then
        pet:setLocalVar("volt_gun_manuevers", voltGunBonus + 33)
    elseif maneuvers == 3 then
        pet:setLocalVar("volt_gun_manuevers", voltGunBonus + 33)
    end

    dmg = math.floor(dmg * (1 + (pet:getLocalVar("volt_gun_manuevers")) / 100)) -- +33% dmg per maneuver

    pet:delMod(tpz.mod.ENSPELL, tpz.magic.element.THUNDER)
    pet:delMod(tpz.mod.ENSPELL_DMG, pet:getMod(tpz.mod.ENSPELL_DMG))
    pet:delMod(tpz.mod.ENSPELL_CHANCE, 100)
    pet:addMod(tpz.mod.ENSPELL, tpz.magic.element.THUNDER)
    pet:addMod(tpz.mod.ENSPELL_DMG, dmg)
    pet:addMod(tpz.mod.ENSPELL_CHANCE, 100)
end

function onManeuverLose(pet, maneuvers)
    local voltGunBonus = pet:getLocalVar("volt_gun_manuevers")
    local dmg = CalculateVoltGunDmg(pet)
    if maneuvers == 1 then
        pet:setLocalVar("volt_gun_manuevers", voltGunBonus - 33)
    elseif maneuvers == 2 then
        pet:setLocalVar("volt_gun_manuevers", voltGunBonus - 33)
    elseif maneuvers == 3 then
        pet:setLocalVar("volt_gun_manuevers", voltGunBonus - 33)
    end

    dmg = math.floor(dmg * (1 + (pet:getLocalVar("volt_gun_manuevers")) / 100)) -- +33% dmg per maneuver

    pet:delMod(tpz.mod.ENSPELL, tpz.magic.element.THUNDER)
    pet:delMod(tpz.mod.ENSPELL_DMG, pet:getMod(tpz.mod.ENSPELL_DMG))
    pet:delMod(tpz.mod.ENSPELL_CHANCE, 100)
    pet:addMod(tpz.mod.ENSPELL, tpz.magic.element.THUNDER)
    pet:addMod(tpz.mod.ENSPELL_DMG, dmg)
    pet:addMod(tpz.mod.ENSPELL_CHANCE, 100)
end


function CalculateVoltGunDmg(pet)
    local magicskill = pet:getSkillLevel(jobUtil.GetAutoMainSkill(pet))
	local level = pet:getMainLvl()

    local potency = 3 + math.floor(6 * magicskill / 100)
    if magicskill > 200 then
        potency = 5 + math.floor(5 * magicskill / 100)
    end
	if magicskill == 0 then
		potency = 3 + math.floor(level / 10)
	end

    return potency
end