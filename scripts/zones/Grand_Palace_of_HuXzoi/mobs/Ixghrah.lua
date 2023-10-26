-----------------------------------
-- Area: Grand Palace of HuXzoi
--  MOB: Ix_ghrah
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/missions")
-----------------------------------

function changeToForm(mob, form)
    -- 0:ball - 1:humanoid - 2:spider - 3:bird

    -- Remove previous form bonuses
	mob:setDamage(100)
	mob:setMod(tpz.mod.ATTP, 10)
    mob:setMod(tpz.mod.EVA, 340)
    mob:setMod(tpz.mod.DMGPHYS, 50)
    mob:setMod(tpz.mod.DMGMAGIC, -50)

    if form == 1 then
		mob:setDamage(50)
        mob:setMod(tpz.mod.ATP, -50)
		mob:setMod(tpz.mod.EVA, 340)
        mob:setMod(tpz.mod.DMGPHYS, -50)
        mob:setMod(tpz.mod.DMGMAGIC, 0)
    elseif form == 2 then
		mob:setDamage(180)
        mob:setMod(tpz.mod.ATP, 50)
		mob:setMod(tpz.mod.EVA, 340)
        mob:setMod(tpz.mod.DMGPHYS, 50)
        mob:setMod(tpz.mod.DMGMAGIC, 50)
    elseif form == 3 then
		mob:setDamage(100)
		mob:setMod(tpz.mod.ATTP, 10)
        mob:setMod(tpz.mod.EVA, 400)
        mob:setMod(tpz.mod.DMGPHYS, 0)
        mob:setMod(tpz.mod.DMGMAGIC, 50)
    end
    mob:AnimationSub(form)
end

function onMobWeaponSkill(target, mob, skill, action)
    -- Change to a different form after performing the form specific skill: hexidiscs, vorpal_blade, damnation_dive, sickle_slash
    if skill:getID() >= 1443 and skill:getID() <= 1446 and not mob:hasStatusEffect(mob:getLocalVar("special_effect")) then
        form = (mob:AnimationSub() + math.random(1, 3)) % 4
        changeToForm(mob, form)
    end
end

function onMonsterMagicPrepare(mob, target)
    if mob:AnimationSub() == 0 then
        local element = VanadielDayElement() -1
        if element == tpz.day.FIRESDAY then
            return 176 -- Firaga III
        elseif element == tpz.day.EARTHSDAY then
            return 191 -- Stonega III
        elseif element == tpz.day.WATERSDAY then
            return 201 -- Waterga III
        elseif element == tpz.day.WINDSDAY then
            return 186 -- Aeroga III
        elseif element == tpz.day.ICEDAY then
            return 181 -- Blizzaga III
        elseif element == tpz.day.LIGHTNINGDAY then
            return 196 -- Thundaga III
        elseif element == tpz.day.LIGHTSDAY then
            return 40 -- Banishga III
        elseif element == tpz.day.DARKSDAY then
            return 274 -- Sleepga II
        end
    end
    return 0
end

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 120)
    mob:setMod(tpz.mod.REGEN, 25)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEFP, 20) 
	mob:setMod(tpz.mod.ATTP, 10)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
    changeToForm(mob, 0)
    mob:setLocalVar("[jobSpecial]hpp", math.random(40, 60))
end

function onMobFight(mob, target)
    if mob:getHPP() <= mob:getLocalVar("[jobSpecial]hpp") then
        form = mob:AnimationSub()
        if form == 0 then
            mob:useMobAbility(tpz.jsa.MANAFONT)
            mob:setLocalVar("special_effect", tpz.effect.MANAFONT)
        elseif form == 1 then
            mob:useMobAbility(tpz.jsa.INVINCIBLE)
            mob:setLocalVar("special_effect", tpz.effect.INVINCIBLE)
        elseif form == 2 then
            mob:useMobAbility(tpz.jsa.MIGHTY_STRIKES)
            mob:setLocalVar("special_effect", tpz.effect.MIGHTY_STRIKES)
        elseif form == 3 then
            mob:useMobAbility(tpz.jsa.PERFECT_DODGE)
            mob:setLocalVar("special_effect", tpz.effect.PERFECT_DODGE)
        end
        mob:setLocalVar("[jobSpecial]hpp", 0)
    end
end

function onMobDeath(mob, player, isKiller, noKiller)
    if (player:getCurrentMission(COP) == tpz.mission.id.cop.A_FATE_DECIDED  and player:getCharVar("PromathiaStatus")==1) then
        player:setCharVar("PromathiaStatus", 2)
    end
end

