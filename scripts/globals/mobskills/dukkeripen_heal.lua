---------------------------------------------
-- Dukkeripen
-- Self healing move
-- Type: Magical
---------------------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
     return MobHealMove(target, skill, 1)
end
