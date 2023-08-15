-----------------------------------
--
-- tpz.effect.MOUNTED
--
-----------------------------------
require("scripts/globals/status")

function onEffectGain(target, effect)
    --[[
        Retail sends a music change packet (packet ID 0x5F) in both cases.
    ]]

    if effect:getPower() == 0 then
        if (player:getCharVar("mountMusic") == 1) then
            target:ChangeMusic(4, 212)
        end
        target:setAnimation(tpz.anim.CHOCOBO)
    else
        if (player:getCharVar("mountMusic") == 1) then
            target:ChangeMusic(4, 84)
        end
        target:setAnimation(tpz.anim.MOUNT)
    end
    target:addPetMod(tpz.mod.MOVE, 110)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:setAnimation(tpz.anim.NONE)
    target:delPetMod(tpz.mod.MOVE, 110)
end
