-- RNG/RNG
-- Stands back and shoots arrows, does not come in to melee at high HP
-- Immune to Paralyze, Sleep, Bind, Gravity, Break
-- 3s delay on ranged attacks at range
-- 10s delay on ranged attacks in melee range
-- Slght Store TP bonus
-- Uses Goblin Rush and Bomb Toss
-- Summons up to 5 goblin mines after bomb toss
-- Bomb toss is faster than normal bomb toss, unstunnable
-- Pets / Trusts can set off the mines
-- Runs into melee range at 70%
-----------------------------------
-- Area: Beadeaux [S]
--   NM: Ba'Tho Mercifulheart
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
require("scripts/globals/utils")
-----------------------------------

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
    mob:setMod(tpz.mod.STORETP, 25)
    mob:setMobMod(tpz.mobMod.STANDBACK_COOL, 5)
    mob:setMobMod(tpz.mobMod.SPECIAL_COOL, 10)
end

function onMobFight(mob, target)
    local summonMines = mob:getLocalVar("summonMines")

    if (summonMines > 0) then
        local minesplaced
        while minesplaced < summonMines do
            local currentMine = GetMobByID(mob:getID() + minesplaced)
            if not currentMine:isSpawned() then
                currentMine:setSpawn(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
                utils.spawnPetInBattle(mob, currentMine)
                minesplaced = minesplaced +1
            end
        end
        mob:setLocalVar("summonMines", 0)
    end
end


function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 591 then -- Bomb toss
        mob:setLocalVar("summonMines", math.random(1, 5))
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end
