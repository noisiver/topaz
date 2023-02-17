-----------------------------------
-- Area: La Vaule [S]
--   NM: Falsespinner Bhudbrodd
-- Beserker Dance is undispellable when used by any orc
-- Doesn't use Fanatics Dance until < 50%
-- Always uses Orcish Counterstance then Berserker Dance together
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/wotg")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    tpz.wotg.NMMods(mob)
end

function onMobEngaged(mob)
    mob:setLocalVar("buffComboTimer", os.time())
end

function onMobFight(mob, target)
    local buffComboTimer = mob:getLocalVar("buffComboTimer")

    -- Always uses Orcish Counterstance then Berserker Dance together
    if os.time() > buffComboTimer and not mob:hasStatusEffect(tpz.effect.COUNTERSTANCE) then
        mob:setLocalVar("buffComboTimer", os.time() + 30)
        mob:useMobAbility(2201)
        mob:useMobAbility(2202)
    end
end

function onMobWeaponSkillPrepare(mob, target)
    local hp = mob:getHPP()
    -- Uses Battle Dance and Fanatics Dance
    -- Doesn't start using Fanatics Dance until < 50%
    if (hp < 50) then
        local tpMoves = {1056, 1061}
        return tpMoves[math.random(#tpMoves)]
    else
        return 1061
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    tpz.wotg.MagianT4(mob, player, isKiller, noKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(7200) -- 2 hours
end
