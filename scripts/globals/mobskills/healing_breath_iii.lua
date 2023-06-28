---------------------------------------------
-- Healing Breath III
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/msg")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local mobs = {
        GetMobByID(mob:GetId() - 3),
        GetMobByID(mob:GetId() - 2),
        GetMobByID(mob:GetId() - 1)
    };
    table.sort(mobs, function(a,b)
        return (a:getHPP() < b:getHPP());
    end

    local lowestShikaree = mobs[1];

    return MobPercentHealMove(mob, lowestShikaree, skill, 0.25)
end

