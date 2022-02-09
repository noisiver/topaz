-----------------------------------
-- Area: Rolanberry Fields  [S]
--  Mob: Sandworm
-- Note:  Title Given if Sandworm does not Doomvoid
-----------------------------------
mixins ={require("scripts/mixins/rage")}
local ID = require("scripts/zones/Rolanberry_Fields_[S]/IDs")
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
-----------------------------------
local SandwormID =
{
    17109357, -- East Ronfaure
    17121693, -- Batallia Downs
    17138041, -- North Gustaberg
    --17150317, -- Rolanberry Fields 
    17166720, -- West Sarutabaruta 
    17174888, -- Meriphataud Mountains
    17178901  -- Sauromugue Champaign
}

function onMobSpawn(mob)
	mob:setDamage(100)
    mob:setMod(tpz.mod.DEF, 400)
    mob:setMod(tpz.mod.EVA, 350) 
    mob:setMod(tpz.mod.REGAIN, 0)
    mob:setMod(tpz.mod.REFRESH, 400)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 2064)
    mob:setMobMod(tpz.mobMod.MUG_GIL, 2000)
	mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
    mob:setLocalVar("[rage]timer", 5400) -- 90 minutes
end

function onMobEngaged(mob)
    for i = 1,#SandwormID do -- despawn all sandworms in all zones
        local id = SandwormID[i];
        local Sandworm = GetMobByID(id)
        if Sandworm:isSpawned() and mob ~= id then
            DespawnMob(id)
        end
    end
end

function onMobFight(mob, target)
    for i = 1,#SandwormID do -- despawn all sandworms in all zones
        local id = SandwormID[i];
        local Sandworm = GetMobByID(id)
        if Sandworm:isSpawned() and mob ~= id then
            DespawnMob(id)
        end
    end
    --Using this for testing purposes to force Doomvoid TP move.
    local forceDV = mob:getLocalVar("dv")
    
    if forceDV ~= 0 then
        mob:useMobAbility(2192) -- Doomvoid
        mob:setLocalVar("dv", 0)
    end
end

function onMobWeaponSkillPrepare(mob, target)
    if mob:getHPP() < 40 then
        local rnd = math.random()

        if rnd < 0.5 then
            return 2192 -- doomvoid
        elseif rnd < 0.6 then
            return 2191 -- desiccation
        elseif rnd < 0.7 then
            return 2190 -- extreme_purgation
        elseif rnd < 0.8 then
            return 2189 -- aeolian_void
        elseif rnd < 0.9 then
            return 2188 -- slaverous_gale
        else
            return 2187 -- dustvoid
        end
    end
end

function onMobWeaponSkill (target, mob, skill)
    if skill:getID() == 2192 then -- Doomvoid
        --local Guivre = GetMobByID(17158400)
        local Guivre = GetMobByID(17297511)
        local LambtonWorm = GetMobByID(17297512)
        local RNG = math.random(1,2)
        if RNG == 1 then
            --target:setPos(219.9899, -15.6340, -180.4311, 0, 93) -- Ruhotz Silvermines Zone
            target:setPos(-289.0951, -20.2527, 54.2799, 0, 127) -- Behemoth's Dominion 
            Guivre:spawn()
            DespawnMob(mob:getID())
        elseif RNG == 2 then
            --target:setPos(19.3717, 0.3757, 139.9185, 0, 93) -- Ruhotz Silvermines Zone
            target:setPos(-289.0951, -20.2527, 54.2799, 0, 127) -- Behemoth's Dominion 
            LambtonWorm:spawn()
            DespawnMob(mob:getID())
        end
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.SANDWORM_WRANGLER)
end
