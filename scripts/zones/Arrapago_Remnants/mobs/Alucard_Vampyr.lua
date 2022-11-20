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
-- Bloodrake, Decollation, Nosferatu's Kiss, Heliovoid, Wings of Gehenna, Eternal Damnation, Minax Glare
local auraList =
{
    [2106] = { tpz.effect.GEO_ATTACK_DOWN, 50 },
    [2107] = { tpz.effect.GEO_DEFENSE_DOWN, 50 },
    [2108] = { tpz.effect.GEO_MAGIC_ATK_DOWN, 50 },
    [2109] = { tpz.effect.GEO_MAGIC_DEF_DOWN, 50 },
    [2110] = { tpz.effect.GEO_ACCURACY_DOWN, 50 },
    [2111] = { tpz.effect.GEO_MAGIC_ACC_DOWN, 50 },
    [2534] = { tpz.effect.GEO_SLOW, 3500 }
}
local msgList =
{
    [2106] = { "Don't waste my time." },
    [2107] = { "You fail to amuse me." },
    [2108] = { "Pitiful." },
    [2109] = { "What a foolish ploy." },
    [2110] = { "Tremble before me!" },
    [2111] = { "What trickery is this?" },
    [2534] = { "This will please me.", }
}

function onMobSpawn(mob)
    local instance = mob:getInstance()
    local chars = instance:getChars()

    for i, v in pairs(chars) do
        v:addStatusEffect(tpz.effect.TERROR, 1, 0, 5)
    end

    salvageUtil.msgGroup(mob, "The night beckons!", 0, "Alucard")
    mob:setDelay(3500)
    mob:setDamage(60)
    mob:setMod(tpz.mod.DEFP, 25)
    mob:setMod(tpz.mod.HTHRES, 1000)
    mob:setMod(tpz.mod.SLASHRES, 1250)
    mob:setMod(tpz.mod.PIERCERES, 750)
    mob:setMod(tpz.mod.RANGEDRES, 500)
    mob:setMod(tpz.mod.IMPACTRES, 1000)
    mob:delImmunity(tpz.immunity.SILENCE) 
end

function onMobEngaged(mob, target)
    mob:setLocalVar("msgTimer", os.time() + 45)
end

function onMobFight(mob, target)
    local manafontUses = mob:getLocalVar("manafontUses")
    local aura = mob:getLocalVar("aura")
    local msg = mob:getLocalVar("msg")
    local hp = mob:getHPP()

    -- Procced by Water skillchains(silence)
    mob:addListener("SKILLCHAIN_TAKE", "ALUCARD_SC_TAKE", function(mob, target, element)
        if element == 5 or element == 10 or element == 14 or element == 16 then -- Water damage skillchains
            BreakMob(mob, target, 1, 30, 1)
        end
    end)

    -- Gains an aura after every TP move
    if not mob:hasStatusEffect(tpz.effect.SILENCE) then
        PeriodicInstanceMessage(mob, target, "The " .. MobName(mob) .. " seems weak to skillchains...", 0xD, none, 30)
        if (aura > 0) then
            AddMobAura(mob, target, 13, auraList[aura][1], auraList[aura][2], 3)
        end
    end

    -- Display TP move message to players
    if (msg > 0) then
        salvageUtil.msgGroup(mob, msgList[msg][1], 0, "Alucard")
        mob:setLocalVar("msg", 0)
    end
end

function onMobWeaponSkillPrepare(mob, target)
    return tpMoveList[math.random(#tpMoveList)]
end

function onMobWeaponSkill(target, mob, skill)
    -- Set aura for table on TP move, except for Manafont
    if skill:getID() ~= 691 then
        mob:setLocalVar("aura", skill:getID())
        mob:setLocalVar("msg", skill:getID())
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
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
