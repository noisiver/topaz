-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Alucard (Vampyr)
-- ID: 17081245
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/salvage")
require("scripts/globals/items")
require("scripts/globals/mobs")
-----------------------------------
local tpMoveList = {2106, 2107, 2108, 2109, 2110, 2111, 2534}
-- Bloodrake, Decollation, Nosferatu's Kiss, Nosferatu's Kiss, Wings of Gehenna, Eternal Damnation, Minax Glare
local auraList =
{
    [2106] = { tpz.effect.GEO_ATTACK_DOWN, 25 },
    [2107] = { tpz.effect.GEO_DEFENSE_DOWN, 25 },
    [2108] = { tpz.effect.GEO_MAGIC_ATK_DOWN, 25 },
    [2109] = { tpz.effect.GEO_MAGIC_DEF_DOWN, 10 },
    [2110] = { tpz.effect.GEO_ACCURACY_DOWN, 25 },
    [2111] = { tpz.effect.GEO_MAGIC_ACC_DOWN, 25 },
    [2534] = { tpz.effect.GEO_SLOW, 3500 }
}
function onMobSpawn(mob)
    local instance = mob:getInstance()
    local chars = instance:getChars()

    for i, v in pairs(chars) do
        v:addStatusEffect(tpz.effect.TERROR, 1, 0, 5)
    end
    salvageUtil.msgGroup(mob, "I come from the darkness of the pit.", 0, "Alucard")
    mob:setDelay(3500)
    mob:setDamage(40)
    mob:setMod(tpz.mod.DEFP, 0)
    mob:setMod(tpz.mod.HTHRES, 1000)
    mob:setMod(tpz.mod.SLASHRES, 1250)
    mob:setMod(tpz.mod.PIERCERES, 750)
    mob:setMod(tpz.mod.RANGEDRES, 500)
    mob:setMod(tpz.mod.IMPACTRES, 1000)
end

function onMobEngaged(mob, target)
    mob:setLocalVar("msgTimer", os.time() + 45)
end

function onMobFight(mob, target)
    local manafontUses = mob:getLocalVar("manafontUses")
    local aura = mob:getLocalVar("aura")
    local hp = mob:getHPP()

    -- Uses Manafont at 89,79,69,59,49,39,29,19,9% HP
    if (hp < 99) then
        if CheckForManafont(mob) then
            mob:setLocalVar("manafontUses", manafontUses +1)
            mob:useMobAbility(691) -- Manafont
        end
    end

    -- Procced by Water skillchains(amnesia)
    mob:addListener("SKILLCHAIN_TAKE", "ALUCARD_SC_TAKE", function(mob, target, element)
        if element == 5 or element == 10 or element == 14 or element == 16 then -- Water damage skillchains
            BreakMob(mob, target, 1, 30, 0)
        end
    end)

    -- Gains an aura after every TP move
    if not mob:hasStatusEffect(tpz.effect.AMNESIA) then
        PeriodicInstanceMessage(mob, target, "The " .. MobName(mob) .. " seems weak to skillchains...", 0xD, none, 30)
        if (aura > 0) then
            AddMobAura(mob, target, 13, auraList[aura][1], auraList[aura][2], 3)
        end
    end
end

function onMobWeaponSkillPrepare(mob, target)
    return tpMoveList[math.random(#tpMoveList)]
end

function onMobWeaponSkill(target, mob, skill)
    -- Set aura for table on TP move, except for Manafont
    if skill:getID() ~= 691 then
        mob:setLocalVar("aura", skill:getID())
    end

    -- Display text on TP moves
    if skill:getID() == 2106 then -- Bloodrake
        salvageUtil.msgGroup(mob, "Don't waste my time.", 0, "Alucard")
    elseif skill:getID() == 2107 then -- Decollation
        salvageUtil.msgGroup(mob, "You fail to amuse me.", 0, "Alucard")
    elseif skill:getID() == 2108 then -- Nosferatu's Kiss
        salvageUtil.msgGroup(mob, "Pitiful.", 0, "Alucard")
    elseif skill:getID() == 2109 then -- Heliovoid
        salvageUtil.msgGroup(mob, "What a foolish ploy.", 0, "Alucard")
    elseif skill:getID() == 2110 then -- Wings of Gehenna
        salvageUtil.msgGroup(mob, "Tremble before me!", 0, "Alucard")
    elseif skill:getID() == 2111 then -- Eternal Damnation
        salvageUtil.msgGroup(mob, "What trickery is this?", 0, "Alucard")
    elseif skill:getID() == 2534 then -- Minax Glare
        salvageUtil.msgGroup(mob, "This will please me.", 0, "Alucard")
    end
end

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    local chars = instance:getChars()

    if isKiller or noKiller then
        -- Nearby door opens
        instance:setProgress(10)
        mob:getEntity(bit.band(ID.npc[6].DOOR, 0xFFF), tpz.objType.NPC):setAnimation(8)
        mob:getEntity(bit.band(ID.npc[6].DOOR, 0xFFF), tpz.objType.NPC):untargetable(true)
        salvageUtil.msgGroup(player, "The way forward is now open.", 0xD, none)
    end
end

function onMobDespawn(mob)
end

function CheckForManafont(mob)
    local manafontUses = mob:getLocalVar("manafontUses")
    local hp = mob:getHPP()
    local thresholds = { 89, 79, 69, 59, 49, 39, 29, 19, 9 }

    return (manafontUses < #thresholds) and (hp <= thresholds[manafontUses + 1])
end
