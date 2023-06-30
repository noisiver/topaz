-----------------------------------
-- Area: Fort Karugo-Narugo [S]
--  Mob: Tipua
-- J/K  Right on the line between them
-----------------------------------
mixins =
{
    require("scripts/mixins/rage"),
    require("scripts/mixins/job_special")
}
local ID = require("scripts/zones/Fort_Karugo-Narugo_[S]/IDs")
require("scripts/globals/status")
require("scripts/globals/mobs")
require("scripts/globals/moblinmazemongers")
-----------------------------------
function onMobSpawn(mob)
    tpz.moblinmazemongers.MobMods(mob) 
    mob:setLocalVar("[rage]timer", 7200) -- 2 hrs
    mob:SetMagicCastingEnabled(false)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.BLOOD_WEAPON, duration = 120, hpp = 75},
            {id = tpz.jsa.BLOOD_WEAPON, duration = 120, hpp = 50},
            {id = tpz.jsa.BLOOD_WEAPON, duration = 120, hpp = 25},
        },
    })
end

function onMobRoam(mob)
    mob:setPos(437.2809,-8.9326,183.0303,0)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobEngaged(mob)
    mob:SetMagicCastingEnabled(true)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobFight(mob, target)
    local hp = mob:getHPP()

    if (hp < 20) then
        AddMobAura(mob, target, 10, tpz.effect.ENMITY_DOWN, 50, 3)
    end
end

function onMobWeaponSkillPrepare(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
    if skill:getID() == 1795 then -- Malediction
         mob:useMobAbility(478) -- Hell Slash
    end
end

function onSpellPrecast(mob, spell)
    if spell:getID() == 252 then -- Stun
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setFlag(tpz.magic.spellFlag.HIT_ALL)
        spell:setRadius(15)
	end
end

function onMobDeath(mob, player, isKiller)
    player:addCurrency("allied_notes", 500)
	if isKiller and math.random(1,100) <= 24 then 
		player:addTreasure(3510, mob)-- Silver Mirror 
	end
    tpz.moblinmazemongers.SpawnChest(mob, player, isKiller)
end

function onMobDespawn(mob)
end
