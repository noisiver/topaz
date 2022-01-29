-----------------------------------
-- Area: North Gustaberg [S]
--  Mob: Sandworm
-- Note:  Title Given if Sandworm does not Doomvoid
-----------------------------------
mixins ={require("scripts/mixins/rage")}
local ID = require("scripts/zones/Rolanberry_Fields_[S]/IDs")
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
-----------------------------------

function onMobSpawn(mob)
	mob:setDamage(250)
    mob:setMod(tpz.mod.DEF, 522)
    mob:setMod(tpz.mod.EVA, 395) 
    mob:setMod(tpz.mod.REGAIN, 0)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 2064)
	mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
    mob:setLocalVar("[rage]timer", 5400) -- 90 minutes
end

function onMobFight(mob, target)
    --Using this for testing purposes to force Doomvoid TP move.
    local forceDV = mob:getLocalVar("dv")
    
    if forceDV ~= 0 then
        mob:useMobAbility(2192) -- Doomvoid
        mob:setLocalVar("dv", 0)
    end
end
    --TODO: Currently, Doomvoid only takes the primary target and properly creates the instance, taking them inside. Second target executes
    -- the setPos command but ends up inside zone without instance set.
function onMobWeaponSkill (target, mob, skill)
    if skill:getID() == 2192 then
        local Guivre = GetMobByID(17158400)
        local LambtonWorm = GetMobByID(17158401)
        RNG = math.random(1,2)
        -- player:setPos(-289.0951, -20.2527, 54.2799, 0, 127) -- Behemoth's Dominion    
        if RNG == 1 then
            player:setPos(219.9899, -15.6340, -180.4311, 0, 93) -- Ruhotz Silvermines Zone
            Guivre:spawn()
        elseif RNG == 2 then
            player:setPos(19.3717, 0.3757, 139.9185, 0, 93) -- Ruhotz Silvermines Zone
            LambtonWorm:spawn()
        end
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.SANDWORM_WRANGLER)
end
