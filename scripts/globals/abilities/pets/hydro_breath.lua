---------------------------------------------------
-- Hydro Breath
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/ability")
require("scripts/globals/pets/wyvern")
---------------------------------------------------
function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(pet, target, skill, action)
    return OffensiveBreath(pet, target, skill, action, tpz.magic.ele.WATER, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)
end
