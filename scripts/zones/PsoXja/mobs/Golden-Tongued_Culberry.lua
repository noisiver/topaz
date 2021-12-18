-----------------------------------
-- Area: Pso'Xja
--   NM: Golden-Tongued Culberry
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
local ID = require("scripts/zones/PsoXja/IDs")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
	mob:setDamage(125)
    mob:addMod(tpz.mod.DEFP, 20) 
    mob:addMod(tpz.mod.ATTP, 10)
    mob:setMod(tpz.mod.MDEF, 100) 
    mob:setMobMod(tpz.mobMod.GIL_MIN, 18000)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, 0)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 6)
end

function onMobFight(mob, target)
    mob:SetAutoAttackEnabled(false)
    mob:SetMobAbilityEnabled(false)
    if target:isPet() then
        mob:setMod(tpz.mod.FASTCAST, 100)
        mob:castSpell(367) -- Insta-death any pet with most enmity.
        mob:setMod(tpz.mod.FASTCAST, 10)
    end
end

function onMobDeath(mob, player, isKiller)
end
