-----------------------------------
--  PET: Avatars / Elementals
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/ability")
require("scripts/globals/msg")
require("scripts/globals/pets")
-----------------------------------
--[[local spells =
{
    earth =
    {
        159 = 13,
        56 = 13,
        238 = 18,
        160 = 26,
        161 = 51,
        210 = 54,
        162 = 68,
    },
}

function onMobFight(mob, target)
    if tpz.pet.id.DARK_SPIRIT then -- Elementals
        mob:castSpell(246) -- Drain II
    end

    for v = tpz.pet.id.FIRE_SPIRIT, tpz.pet.id.DARK_SPIRIT, 1 do
        for key, value in pairs(debuffs) do
            v:castSpell(246) -- Drain II
        end
    end
end]]

function onMobDeath(mob, player)
end