-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Percipient Zoraal Ja
-----------------------------------
local ID = require("scripts/zones/Wajaom_Woodlands/IDs")
require("scripts/globals/mobs")
require("scripts/globals/status")
mixins = {require("scripts/mixins/weapon_break")}
------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ATTP, 25)
    mob:addMod(tpz.mod.DEFP, 25)
    mob:addMod(tpz.mod.EVA, 25)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
end

function onMobFight(mob, target)
	local RewardTime = mob:getLocalVar("RewardTime")
	local BattleTime = mob:getBattleTime()
    local pet = GetMobByID(ID.mob.ZORAAL_JA_S_PKUUCHA)
	if (pet ~= nil) then
		if RewardTime == 0 then
			mob:setLocalVar("RewardTime", BattleTime + 45)
		elseif BattleTime >= RewardTime and pet:getHPP() < 90 then
			mob:useMobAbility(2005) -- Reward
			mob:setLocalVar("RewardTime", BattleTime + 45)
		end
	end
end

function onMobDeath(mob, player, isKiller, noKiller)
    -- make pkuucha killable
    local pet = GetMobByID(ID.mob.ZORAAL_JA_S_PKUUCHA)
    if (pet ~= nil) then
        pet:setUnkillable(false)
        if (pet:getHPP() <= 1) then
            pet:setHP(0)
        end
    end
end
