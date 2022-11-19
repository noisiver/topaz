-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Armoury Crate (Mimic)
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/instance")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/salvage")
-----------------------------------
local temps =
{
    4146, -- Revitalizer
    4147, -- Body Boost
    4200, -- Mana Boost
    5385, -- Barbarian
    5386, -- Fighter
    5387, -- Oracle
    5388, -- Assasin
    5389, -- Spy
    5390, -- Braver
    5391, -- Soldier 
    5392, -- Champion
    5393, -- Monarch
    5394, -- Gnostic
    5395, -- Cleric
    5396, -- Shepard
    5397, -- Sprinter
    5431, -- Dusty Poition
    5432, -- Dusty Ether
    5433, -- Dusty Elixir
    5434, -- Fanatics
    5435, -- Fools 
    5436, -- Dusty Reraise
    5437, -- Strange Milk
    5438, -- Strange Juice
    5439, -- Vicars
    5440, -- Dusty Wing
}
function onMobSpawn(mob)
    mob:setDamage(80)
    mob:setDelay(4000)
    mob:setMod(tpz.mod.EVA, 300)
    mob:setMobMod(tpz.mobMod.AGGRO_SIGHT, 0)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 5)
    mob:hideName(true)
end

function onMobEngaged(mob, target)
    mob:hideName(false)
end

function onMobFight(mob, target)
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    local instance = player:getInstance()
    local chars = instance:getChars()
    local temp1 = temps[math.random(#temps)]
    local temp2 = temps[math.random(#temps)]
    local temp3 = temps[math.random(#temps)]

    if isKiller or noKiller then
        -- Give all players 3 random temps
        for _, players in pairs(chars) do
            players:addTempItem(temp1, 1, 0, 0, 0, 0, 0, 0, 0, 0)
            players:addTempItem(temp2, 1, 0, 0, 0, 0, 0, 0, 0, 0)
            players:addTempItem(temp3, 1, 0, 0, 0, 0, 0, 0, 0, 0)
            players:messageName(ID.text.OBTAINED_TEMP_ITEM, player, temp1, 0, 0, 0, nil)
            players:messageName(ID.text.OBTAINED_TEMP_ITEM, player, temp2, 0, 0, 0, nil)
            players:messageName(ID.text.OBTAINED_TEMP_ITEM, player, temp3, 0, 0, 0, nil)
        end
    end
end

function onMobDespawn(mob)
end