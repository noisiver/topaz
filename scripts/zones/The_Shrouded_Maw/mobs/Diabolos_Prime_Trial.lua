-----------------------------------
-- Area: The Shrouded Maw
--  Mob: Diabolos Prime
-- Involved in Quest: Waking Dreams
-- !addkeyitem vial_of_dream_incense
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/settings")
require("scripts/globals/hunts")
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/status")
local ID = require("scripts/zones/The_Shrouded_Maw/IDs")
-----------------------------------
function onMobSpawn(mob)
    SetGenericNMStats(mob)
    mob:setMod(tpz.mod.UFASTCAST, 25)
    mob:setMod(tpz.mod.REFRESH, 50)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 35)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 1911, hpp = math.random(30,55)}, -- uses ruinous_omen once while near 50% HPP.
        },
    })
end

function onMobEngaged(mob)
    for _,player in ipairs(mob:getBattlefield():getPlayers()) do
        mob:drawIn(player)
    end
end

function onMobFight(mob,target)
    local mobOffset = mob:getID() - ID.mob.DIABOLOS_PRIME_OFFSET;
    if (mobOffset >= 0 and mobOffset <= 14) then
        local inst = math.floor(mobOffset/7);

        local tileDrops =
        {
            {10,"byc1","bya1","byY1"},
            {20,"byc2","bya2","byY2"},
            {30,"byc3","bya3","byY3"},
            {40,"byc4","bya4","byY4"},
            {50,"byc5","bya5","byY5"},
            {65,"byc6","bya6","byY6"},
            {75,"byc7","bya7","byY7"},
            {90,"byc8","bya8","byY8"},
        };

        local hpp = ((mob:getHP()/mob:getMaxHP())*100);
        for k,v in pairs(tileDrops) do
            if (hpp < v[1]) then
                local tileId = ID.npc.DARKNESS_NAMED_TILE_OFFSET + (inst * 8) + (k - 1);
                local tile = GetNPCByID(tileId);
                if (tile:getAnimation() == tpz.anim.CLOSE_DOOR) then
                    SendEntityVisualPacket(tileId, v[inst+2]);  -- Animation for floor dropping
                    SendEntityVisualPacket(tileId, "s123");     -- Tile dropping sound
                    tile:timer(5000, function(tile)
                        tile:setAnimation(tpz.anim.OPEN_DOOR);     -- Floor opens
                    end)
                end
                break;
            end;
        end
    end
end;

function onMobDeath(mob, player, isKiller)
	DespawnMob(mob:getID()+1)
	DespawnMob(mob:getID()+2)
	DespawnMob(mob:getID()+3)
	DespawnMob(mob:getID()+4)
	DespawnMob(mob:getID()+5)
	DespawnMob(mob:getID()+6)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.DISPEL, {chance = 100})
end

function onMobDeath(mob, player, isKiller)
end
