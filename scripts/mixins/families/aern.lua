-- Aern family mixin
-- Customization:
--   Setting AERN_RERAISE_MAX will determine the number of times it will reraise.
--   By default, this will be 1 40% of the time and 0 the rest (ie. default aern behaviour).
--   For multiple reraises, this can be set on spawn for more reraises.
--   To run a function when a reraise occurs, add a listener to AERN_RERAISE

require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.aern = function(mob)
    mob:addListener("DEATH", "AERN_DEATH", function(mob, killer)
		if not mob:isNM() then
			if killer then
				local reraises = mob:getLocalVar("AERN_RERAISE_MAX")
				local curr_reraise = mob:getLocalVar("AERN_RERAISES")
				if reraises == 0 then
					if math.random() < 0.4 then
						reraises = 1
					end
				end
				if curr_reraise < reraises then
					mob:setMobMod(tpz.mobMod.NO_DROPS, 1) -- Aern will not drop any items if reraising, not even seals.
					local target = mob:getTarget()
					mob:timer(12000, function(mob)
						mob:setHP(mob:getMaxHP())
						mob:setMobMod(tpz.mobMod.NO_DROPS, 0)
						mob:AnimationSub(3)
						mob:setLocalVar("AERN_RERAISES", curr_reraise + 1)
						mob:resetAI()
						mob:stun(3000)
						if target and target:isAlive() and mob:checkDistance(target) < 40 then
							mob:updateClaim(target)
							mob:updateEnmity(target)
						elseif killer:isAlive() and mob:checkDistance(killer) < 40 then
							mob:updateClaim(killer)
							mob:updateEnmity(killer)
						else
							local partySize = killer:getPartySize()
							local i = 1
							for _, partyMember in pairs(killer:getAlliance()) do
								if partyMember:isAlive() and mob:checkDistance(partyMember) < 40 then
									mob:updateClaim(partyMember)
									mob:updateEnmity(partyMember)
									break
								elseif i == partySize then
									mob:disengage()
								end
								i = i + 1
							end
						end
						mob:triggerListener("AERN_RERAISE", mob, curr_reraise + 1)
					end)
				end
			end
		end
    end)
    mob:addListener("SPAWN", "AERN_SPAWN", function(mob)
		mob:AnimationSub(1)
    end)

    mob:addListener("ROAM_TICK", "AERN_ROAM", function(mob)
		mob:AnimationSub(1)
    end)

    mob:addListener("ENGAGE", "AERN_ENGAGE", function(mob, target)
        mob:setLocalVar("BraceletsTime", os.time() + math.random(5, 30))
    end)

    mob:addListener("COMBAT_TICK", "AERN_COMBAT_TICK", function(mob)
	local BraceletsTime = mob:getLocalVar("BraceletsTime")
	local BraceletsOff = mob:getLocalVar("BraceletsOff")
	local Mode = mob:getLocalVar("Mode")

		if BraceletsTime == 0 then
			mob:setLocalVar("BraceletsTime", os.time() + math.random(20, 45))
		elseif os.time() >= BraceletsTime and Mode == 0 then
			mob:setMod(tpz.mod.HASTE_MAGIC, 2500)
			mob:setMod(tpz.mod.ATTP, 100)
			mob:setMod(tpz.mod.MATT, 48)
			mob:setMod(tpz.mod.UDMGPHYS, -60) 
			mob:setMod(tpz.mod.UDMGRANGE, -60)
			mob:setMod(tpz.mod.UDMGMAGIC, -60)
			mob:AnimationSub(2)
			mob:setLocalVar("BraceletsOff", os.time() + math.random(20, 45))
			mob:setLocalVar("Mode", 1)
		end
		if BraceletsOff > 0 and os.time() >= BraceletsOff and Mode == 1 then
			mob:setMod(tpz.mod.HASTE_MAGIC, 0)
			mob:setMod(tpz.mod.ATTP, 0)
			mob:setMod(tpz.mod.MATT, 0)
			mob:setMod(tpz.mod.UDMGPHYS, 0) 
			mob:setMod(tpz.mod.UDMGRANGE, 0)
			mob:setMod(tpz.mod.UDMGMAGIC, 0)
			mob:AnimationSub(1)
			mob:setLocalVar("BraceletsTime", os.time() + math.random(20, 45))
			mob:setLocalVar("Mode", 0)
		end
    end)
end


return g_mixins.families.aern
