-----------------------------------
-- Area: Alzadaal Undersea Ruins (72)
--  Mob: Nepionic Soulflayer
-----------------------------------
mixins =
{
require("scripts/mixins/job_special"),
require("scripts/mixins/families/soulflayer")
}
-----------------------------------
function onMobSpawn(mob)
	mob:addMod(tpz.mod.DEFP, 25) 
	mob:addMod(tpz.mod.ATTP, 25)
	mob:addMod(tpz.mod.ACC, 30) 
	mob:addMod(tpz.mod.EVA, 30)
	mob:setMod(tpz.mod.UFASTCAST, 50)
	mob:setMod(tpz.mod.STUNRESTRAIT, 100)
	mob:setMod(tpz.mod.POISONRESTRAIT, 100)
	mob:setMod(tpz.mod.SILENCERESTRAIT, 100)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
	mob:setMod(tpz.mod.REFRESH, 400)
	mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
	mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
	mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
end

function onMobFight(mob, target)
	mob:setMod(tpz.mod.REGAIN, 250)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if player:getCharVar("TransformationsProgress") == 4 then
        player:setCharVar("TransformationsProgress", 5)
    end
end
