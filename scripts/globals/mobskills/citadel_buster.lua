---------------------------------------------
-- Citadel Buster
-- Deals extreme Light damage to players in an area of effect.
-- Additional effect: Enmity reset
-- Damage can be approximated based on Calculating Weapon Skill Damage as a magical WS with a level of 85, fTP of 6 and MAB of 4.0. Or, more simply:
-- 2088/(1+MDB%) * (256-MDT)/256 (no day/weather bonus)
-- 2608/MDB * (256-MDT)/256 (weather bonus)
-- 2816/MDB * (256-MDT)/256 (day+weather bonus)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
local ID = require("scripts/zones/Temenos/IDs")

---------------------------------------------
-- https://www.bluegartr.com/threads/56406-Citadel-Buster?p=1965356&viewfull=1#post1965356
-- 6x multiplier?
function onMobSkillCheck(target,mob,skill)
    local phase = mob:getLocalVar("battlePhase")
    if (phase == 4) then
        mob:setLocalVar("citadelBuster", 1)
        mob:SetMobAbilityEnabled(false)
        mob:SetMagicCastingEnabled(false)
        mob:SetAutoAttackEnabled(false)
        mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
        local battlefield = mob:getBattlefield()
        local players = battlefield:getPlayers()
        for _, member in pairs(players) do
            member:messageSpecial(ID.text.CITADEL_BASE)
        end
        mob:timer(10000, function(mob)
            for _, member in pairs(players) do
                member:messageSpecial(ID.text.CITADEL_BASE+1)
            end
            mob:timer(10000, function(mob)
                for _, member in pairs(players) do
                    member:messageSpecial(ID.text.CITADEL_BASE+2)
                end
                mob:timer(5000, function(mob)
                    for _, member in pairs(players) do
                        member:messageSpecial(ID.text.CITADEL_BASE+3)
                    end
                    mob:timer(1000, function(mob)
                        for _, member in pairs(players) do
                            member:messageSpecial(ID.text.CITADEL_BASE+4)
                        end
                        mob:timer(1000, function(mob)
                            for _, member in pairs(players) do
                                member:messageSpecial(ID.text.CITADEL_BASE+5)
                            end
                            mob:timer(1000, function(mob)
                                for _, member in pairs(players) do
                                    member:messageSpecial(ID.text.CITADEL_BASE+6)
                                end
                                mob:timer(1000, function(mob)
                                    for _, member in pairs(players) do
                                        member:messageSpecial(ID.text.CITADEL_BASE+7)
                                    end
                                    mob:timer(1000, function(mob)
                                        mob:useMobAbility(1540)
                                        mob:timer(500, function(mob)
                                            mob:setLocalVar("citadelBuster", 0)
                                            mob:SetMagicCastingEnabled(true)
                                            mob:SetAutoAttackEnabled(true)
                                            mob:SetMobAbilityEnabled(true)
                                            mob:setMobMod(tpz.mobMod.DRAW_IN, 0)
                                        end)
                                    end)
                                end)
                            end)
                        end)
                    end)
                end)
            end)
        end)
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 30
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*6, tpz.magic.ele.LIGHT, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHT, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.LIGHT)
    mob:resetEnmity(target)
    return dmg
end