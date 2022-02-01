
--  Removes most if not all equipment and resets job ability timers.
-- 	Additional effect: Knockback
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
abilities =
{
    MIGHTY_STRIKES     = 16,
    HUNDRED_FISTS      = 17,
    BENEDICTION        = 18,
    MANAFONT           = 19,
    CHAINSPELL         = 20,
    PERFECT_DODGE      = 21,
    INVINCIBLE         = 22,
    BLOOD_WEAPON       = 23,
    FAMILIAR           = 24,
    SOUL_VOICE         = 25,
    EAGLE_EYE_SHOT     = 26,
    MEIKYO_SHISUI      = 27,
    MIJIN_GAKURE       = 28,
    SPIRIT_SURGE       = 29,
    ASTRAL_FLOW        = 30,
    BERSERK            = 31,
    WARCRY             = 32,
    DEFENDER           = 33,
    AGGRESSOR          = 34,
    PROVOKE            = 35,
    FOCUS              = 36,
    DODGE              = 37,
    CHAKRA             = 38,
    BOOST              = 39,
    COUNTERSTANCE      = 40,
    STEAL              = 41,
    FLEE               = 42,
    HIDE               = 43,
    SNEAK_ATTACK       = 44,
    MUG                = 45,
    SHIELD_BASH        = 46,
    HOLY_CIRCLE        = 47,
    SENTINEL           = 48,
    SOULEATER          = 49,
    ARCANE_CIRCLE      = 50,
    LAST_RESORT        = 51,
    CHARM              = 52,
    GAUGE              = 53,
    TAME               = 54,
    PET_COMMANDS       = 55,
    SCAVENGE           = 56,
    SHADOWBIND         = 57,
    CAMOUFLAGE         = 58,
    SHARPSHOT          = 59,
    BARRAGE            = 60,
    CALL_WYVERN        = 61,
    THIRD_EYE          = 62,
    MEDITATE           = 63,
    WARDING_CIRCLE     = 64,
    ANCIENT_CIRCLE     = 65,
    JUMP               = 66,
    HIGH_JUMP          = 67,
    SUPER_JUMP         = 68,
    FIGHT              = 69,
    HEEL               = 70,
    LEAVE              = 71,
    SIC                = 72,
    STAY               = 73,
    DIVINE_SEAL        = 74,
    ELEMENTAL_SEAL     = 75,
    TRICK_ATTACK       = 76,
    WEAPON_BASH        = 77,
    REWARD             = 78,
    COVER              = 79,
    SPIRIT_LINK        = 80,
    ENRAGE             = 81,
    CHI_BLAST          = 82,
    CONVERT            = 83,
    ACCOMPLICE         = 84,
    CALL_BEAST         = 85,
    UNLIMITED_SHOT     = 86,
    DISMISS            = 87,
    ASSAULT            = 88,
    RETREAT            = 89,
    RELEASE            = 90,
    BLOOD_PACT_RAGE    = 91,
    RAMPART            = 92,
    AZURE_LORE         = 93,
    CHAIN_AFFINITY     = 94,
    BURST_AFFINITY     = 95
}

    for i, ability in ipairs(abilities) do
        abilities:setRecast(abilities:getRecast())
    end
    MobEncumberMove(mob, target, 16, 60)

	skill:setMsg(tpz.msg.basic.NONE)
    return 0
end