----------------------------------------
--            Moonlight               --
----------------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
----------------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local lvl = player:getSkillLevel(11) -- get club skill
    local damage = lvl * 0.11
    local damagemod = damage * (tp/2000 + 0.5)
    damagemod = damagemod * WEAPON_SKILL_POWER

    return 1, 0, false, damagemod
end
