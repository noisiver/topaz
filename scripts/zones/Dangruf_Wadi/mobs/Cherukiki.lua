-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Cherukiki
-- WHM Mythic weapon fight
-----------------------------------
local ID = require("scripts/zones/Dangruf_Wadi/IDs")
require("scripts/globals/instance")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
function onMobInitialize(mob)
end

function onMobSpawn(mob)
    mob:setUnkillable(true)
    ResetVars(mob)
end

function onMobEngaged(mob, target)
    ResetVars(mob)
end

function onMobFight(mob, target)
    local phase = mob:getLocalVar("phase")

    -- Phase 1 ends once Cherukiki gets to 20% HP or less.
    -- Casts benediction on herself then summons her siblings
    -- Buffs them with Protectra V and Shellra V
    if (phase == 1) then
        if (mob:getHPP() <= 20) then
            local makki = mob:getID() +1
            local kukki = mob:getID() +2
            for v = makki, kukki do
                v:spawn()
                v:updateEnmity(mob:getTarget())
            end
            MessageGroup(mob, target, "Feel the fear! The Chebukkis are here!", 0, "Cherukiki")
            MessageGroup(mob, target, "Chebukki Sumo Siblings!", 0, "Kukki-Chebukki")
            MessageGroup(mob, target, "Samurai Sky Pirate Power!", 0, "Makki-Chebukki")
            mob:useMobAbility(tpz.jsa.BENEDICTION)
            mob:castSpell(tpz.magic.spell.PROTECTRA_V, mob)
            mob:castSpell(tpz.magic.spell.SHELLRA_V, mob)
            mob:setLocalVar("phase", 2)
        end
    end

    if (phase == 2) then
    end
    if (phase == 3) then
    end

    -- Remove unkillable if Kukki and Makki are dead
    if AreSiblingsDead(mob) then
        mob:setUnkillable(false)
        mob:setLocalVar("phase", 3)
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDisengage(mob)
    ResetVars(mob)
end

function onMobDeath(mob, player, isKiller, noKiller)
    OnDeathMessage(mob, player, isKiller, noKiller, "Urgh... At least it beats getting smacked around by Prishe...", 0, "Cherukiki")
end

function AreSiblingsDead(mob)
    local makki = mob:getID() +1
    local kukki = mob:getID() +2
    for v = makki, kukki do
        if not GetMobByID(v):isDead() then
            return false
        end
    end

    return true
end

function TryCastSpell(mob)
    local spellTimer = mob:getLocalVar("spellTimer")
    local battleTime = mob:getBattleTime()

    if (spellTimer < battleTime) then
        mob:setLocalVar("spellTimer", battleTime + 10)
    end
end

function GetBestSpell(mob)
    local buffs =
    {
        tpz.effect.SHELL    = tpz.magic.spell.SHELL_V,
        tpz.effect.PROTECT  = tpz.magic.spell.PROTECT_V,
        tpz.effect.HASTE    = tpz.magic.spell.HASTE,
        tpz.effect.REGEN    = tpz.magic.spell.REGEN_III
    }

    local makki = mob:getID() +1
    local kukki = mob:getID() +2
    for v = makki, kukki do
        -- Try to Cure if their HP is below 75%
        if (v:getHPP() <= 75) then
            return tpz.magic.spell.CURE_V
        end
        -- Check for buffs if their HP is ok
        for _, buffs in pairs(buffIds) do
            if not v:hasStatusEffect(buffs[1]) then
                return buffs[2]
            end
        end
    end

    return 0
end

function ResetVars(mob)
    mob:setLocalVar("phase", 1)
    mob:setLocalVar("spellTimer", 0)
end