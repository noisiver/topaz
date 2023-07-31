------------------------------
-- Area: Fort Karugo-Narugo [S]
--   NM: Emela-ntouka
------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
require("scripts/globals/status")
------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 25) 
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.ACC, 30) 
    mob:addMod(tpz.mod.EVA, 30)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 25)
	mob:setMod(tpz.mod.SLEEPRESTRAIT, 100)
	mob:setMod(tpz.mod.LULLABYRESTRAIT, 100)
	mob:setMod(tpz.mod.BINDRESTRAIT, 100)
	mob:setMod(tpz.mod.GRAVITYRESTRAIT, 100)
end

function onMobFight(mob, target)
	mob:setMod(tpz.mod.REGAIN, 250)
end
function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 368 then -- Blockhead
        local Blockhead = mob:getLocalVar("Blockhead")

        Blockhead = Blockhead +1
        mob:setLocalVar("Blockhead", tailroll)

        if tailroll > 1 then
            mob:setLocalVar("Blockhead", 0)
        else
            mob:useMobAbility(368)  -- Blockhead
        end
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.hunts.checkHunt(mob, player, 521)
end
