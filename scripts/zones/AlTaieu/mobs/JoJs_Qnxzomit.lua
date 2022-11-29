-----------------------------------
-- Area: Al'Taieu
--  MOB: Qn'xzomit
-- Note: Pet for Jailer of Justice
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------

function onMobSpawn(mob)
    local now = os.time()
    mob:setMod(tpz.mod.UDMGMAGIC, 100)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setLocalVar("mijin", now + 35)
end

function onMobFight(mob, target)
    local now = os.time()
    local mijin = mob:getLocalVar("mijin")
    if mijin > 1 and now > mijin then
        mob:setLocalVar("mijin", 1)
        mob:useMobAbility(tpz.jsa.MIJIN_GAKURE)
        mob:stun(6000)
    elseif mijin < 1 and mob:getHP() < mob:getMaxHP() then
        mob:setLocalVar("mijin", now + 5)
    end
end

function onMobDeath(mob, player, isKiller, firstCall)
end 