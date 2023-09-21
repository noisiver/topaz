-----------------------------------
-- Area: Beaucedine Glacier [S]
--  Mob: Gargouille
-- Note: PH for Grand'Goule
-----------------------------------
local ID = require("scripts/zones/Beaucedine_Glacier_[S]/IDs")
require("scripts/globals/mobs")
mixins = {require("scripts/mixins/families/gargouille")}
-----------------------------------
function onMobDeath(mob, player, isKiller, noKiller)
    local buffs =
    {
        tpz.effect.ABYSSEA_STR,
        tpz.effect.ABYSSEA_DEX,
        tpz.effect.ABYSSEA_VIT,
        tpz.effect.ABYSSEA_AGI,
        tpz.effect.ABYSSEA_INT,
        tpz.effect.ABYSSEA_MND,
        tpz.effect.ABYSSEA_CHR,
    }
    -- 5% chance to apply a random status effect from buffs table onto players
    if isKiller or noKiller then
        if math.random(100) <= 5 then
            local selectedBuff = buffs[math.random(#buffs)]
            local power = 10
            local party = target:getParty()

            for _, partyMember in pairs(party) do
                -- If player has the buff already, increase it's power by 2
                if partyMember:hasStatusEffect(selectedBuff) then
                    power = selectedBuff:getPower() + 2
                end
                partyMember:addStatusEffect(selectedBuff, power, 0, 0)
            end
            MessageGroup(mob, player, 'Your statuses are enhanced!', tpz.msg.textColor.HIDDEN, 0)
        end
    end
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.GRANDGOULE_PH, 20, 3600) -- 1 hour
end
