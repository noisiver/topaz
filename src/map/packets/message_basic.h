﻿/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#ifndef _CMESSAGEBASICPACKET_H
#define _CMESSAGEBASICPACKET_H

#include "../../common/cbasetypes.h"

#include "basic.h"

/*
 * This contains a list of message IDs for this type of packet. They should be used
 * in the messageID parameter.
 * Located in 1-27-72.xml if using MassExtractor -full-scan
 */
enum MSGBASIC_ID : uint16
{
    MSGBASIC_NONE                   = 0, // Display nothing 
	MSGBASIC_DEFEATS_TARG			= 6, // The <player> defeats <target>. 
    MSGBASIC_MAGIC_RECOVERS_HP      = 7, // <caster> casts <spell>. <target> recovers <amount> HP. 
    MSGBASIC_SELF_HEAL_SECONDARY    = 263,// <target recovers <amount> HP | Used for Curaga 
    MSGBASIC_MISS                   = 15, // The <entity> misses <target>.
    MSGBASIC_DODGE                  = 32, // <target> dodges the attack.
    MSGBASIC_ALREADY_CLAIMED		= 12, // Cannot attack. Your target is already claimed. 
	MSGBASIC_IS_INTERRUPTED			= 16, // The <player>'s casting is interrupted. 
	MSGBASIC_UNABLE_TO_CAST			= 18, // Unable to cast spells at this time. 
    MSGBASIC_FALLS_TO_GROUND        = 20, // The <target> falls to the ground. 
    MSGBASIC_RECOVERS_HP            = 24, // The <target> recovers HP. 
    MSGBASIC_RECOVERS_MP            = 25, // The <target> recovers MP. 
    MSGBASIC_RECOVERS_HP_MP         = 26, // The <target> recovers HP and MP. 
	MSGBASIC_UNABLE_TO_USE_JA		= 87, // Unable to use job ability. 
	MSGBASIC_UNABLE_TO_USE_JA2		= 88, // Unable to use job ability. 
	MSGBASIC_IS_PARALYZED			= 29, // The <player> is paralyzed. 
    MSGBASIC_ANTICIPATE             = 30,
	MSGBASIC_SHADOW_ABSORB			= 31, // .. of <target>'s shadows absorb the damage and disappear. 
	MSGBASIC_NOT_ENOUGH_MP			= 34, // The <player> does not have enough MP to cast (nullptr). 
	MSGBASIC_NO_NINJA_TOOLS			= 35, // The <player> lacks the ninja tools to cast (nullptr). 
    MSGBASIC_CANNOT_CAST_SPELL      = 47, // >player> cannot cast <spell>. 
    MSGBASIC_CANNOT_USE_IN_AREA     = 40, // cannot use in this area 
	MSGBASIC_UNABLE_TO_CAST_SPELLS  = 49, // The <player> is unable to cast spells.
    MSGBASIC_SHIELD_BLOCK           = 69, // <target> blocks the <player>'s attack with his shield.
    MSGBASIC_PARRY                  = 70, //<target> parries the <player>'s attack with his weapon.
    MSGBASIC_MAGIC_NO_EFFECT        = 75, // <caster>'s <spell> has no effect on <target>. 
    MSGBASIC_MAGIC_TELEPORT         = 93, // <caster> casts <spell>. <target> vanishes. 
	MSGBASIC_WAIT_LONGER			= 94, // You must wait longer to perform that action. 
    MSGBASIC_PLAYER_DEFEATED_BY     = 97, // <player> was defeated by the <target>. 
	MSGBASIC_USES_JA				= 100, // The <player> uses .. 
	MSGBASIC_USES_JA2				= 101, // The <player> uses .. 
	MSGBASIC_USES_RECOVERS_HP		= 102, // The <player> uses .. <target> recovers .. HP. 
    MSGBASIC_SKILL_RECOVERS_HP      = 103, // The <player> uses .. <target> recovers .. HP. 
    MSGBASIC_TIME_LEFT              = 202, // Time left: (h:mm:ss) 
	MSGBASIC_USES_JA_TAKE_DAMAGE	= 317, // The <player> uses .. <target> takes .. points of damage. 
	MSGBASIC_IS_INTIMIDATED			= 106, // The <player> is intimidated by <target>'s presence. 
	MSGBASIC_CANNOT_PERFORM_ACTION	= 71,  // The <Player> cannot perform that action. 
	MSGBASIC_CANNOT_ON_THAT_TARG	= 155, // You cannot perform that action on the specified target. 
	MSGBASIC_OUT_OF_RANGE_UNABLE_CAST	= 313, // Out of range unable to cast 
	MSGBASIC_CANNOT_ATTACK_TARGET	= 446, // You cannot attack that target 
	MSGBASIC_NEEDS_2H_WEAPON		= 307, // That action requires a two-handed weapon. 
	MSGBASIC_USES_BUT_MISSES		= 324, // The <player> uses .. but misses <target>. 
	MSGBASIC_CANT_BE_USED_IN_AREA	= 316, // That action cannot be used in this area. 
	MSGBASIC_REQUIRES_SHIELD		= 199, // That action requires a shield. 
    MSGBASIC_JA_MISS                = 158, // <user> uses <ability>, but misses. (no name included) 

    // Magic 
    MSGBASIC_STATUS_NO_LONGER       = 204, // <target> is no longer${status}. 
    MSGBASIC_GAINS_EFFECT_OF_STATUS = 205, // ${target} gains the effect of ${status}. 
    MSGBASIC_STATUS_WEARS_OFF       = 206, // ${target}'s ${status} effect wears off. 
    MSGBASIC_MAGIC_BURST_BLACK      = 252, // "Magic Burst!" Black Magic   
    MSGBASIC_MAGIC_BURST_BREATH     = 265, // "Magic Burst!" BLU breaths 
	// Distance 
	MSGBASIC_TARG_OUT_OF_RANGE		= 4, // <target> is out of range. 
	MSGBASIC_UNABLE_TO_SEE_TARG		= 5, // Unable to see <target>. 
	MSGBASIC_LOSE_SIGHT				= 36, // You lose sight of <target>. 
	MSGBASIC_TOO_FAR_AWAY			= 78, // <target> is too far away. 
    MSGASIC_CANNOT_SEE_TARGET       = 217,// <You cannot see <target>. 
    MSGASIC_CANNOT_SEE_TARGET2      = 219,// <You cannot see <target>. 
    // Mobskills 
    MSGBASIC_USES                   = 101, // 2 hour mob TP move.            
    MSGBASIC_SKILL_GAIN_EFFECT      = 186, // Buff mob TP move buff.                    
    MSGBASIC_SELF_HEAL              = 238, // Healing mob TP move. 
    MSGBASIC_SKILL_ENFEEB_IS        = 242, // Enfeebling mob TP move. 
    MSGBASIC_SKILL_MISS             = 188, // Mob TP move miss / resist message. 
	// Weaponskills
    MSGBASIC_READIES_WS             = 43,  // ${actor} readies ${weapon_skill}.
    MSGBASIC_UNABLE_TO_USE_WS       = 89,  // Unable to use weaponskill. 
	MSGBASIC_CANNOT_USE_WS			= 190, // The <player> cannot use that weapon ability. 
    MSGBASIC_CANNOT_USE_ANY_WS      = 191, // The <player> is unable to use weapon skills. 
	MSGBASIC_NOT_ENOUGH_TP			= 192, // The <player> does not have enough TP. 
	// Pets 
	MSGBASIC_REQUIRES_A_PET			= 215, // That action requires a pet. 
	MSGBASIC_THAT_SOMEONES_PET		= 235, // That is someone's pet. 
	MSGBASIC_ALREADY_HAS_A_PET		= 315, // The <player> already has a pet. 
	MSGBASIC_NO_EFFECT_ON_PET		= 336, // No effect on that pet. 
	MSGBASIC_NO_JUG_PET_ITEM		= 337, // You do not have the necessary item equipped to call a beast. 
	MSGBASIC_MUST_HAVE_FOOD			= 347, // You must have pet food equipped to use that command. 
	MSGBASIC_PET_CANNOT_DO_ACTION	= 574, // <player>'s pet is currently unable to perform that action. 
	MSGBASIC_PET_NOT_ENOUGH_TP		= 575, // <player>'s pet does not have enough TP to perform that action. 
	// Items 
    MSGBASIC_ITEM_UNABLE_TO_USE     = 55,  // Unable to use item. 
    MSGBASIC_ITEM_UNABLE_TO_USE_2   = 56,  // Unable to use item. 
	MSGBASIC_CANNOT_USE_ITEM_ON		= 92,  // Cannot use the <item> on <target>. 
	MSGBASIC_ITEM_FAILS_TO_ACTIVATE = 62,  // The <item> fails to activate. 
	MSGBASIC_FULL_INVENTORY         = 356, // Cannot execute command. Your inventory is full. 
    MSGBASIC_ITEM_CANNOT_USE        = 445, // Unable to use item. 
    // Gardening 
	MSGBASIC_GARDENING_SEED_SOWN    = 256, // In this flower pot: Seeds sown: <item>
	MSGBASIC_GARDENING_CRYSTAL_NONE = 257, // Crystal used: none
	MSGBASIC_GARDENING_CRYSTAL_USED = 258, // Crystal used: <item>
	// Ranged 
	MSGBASIC_NO_RANGED_WEAPON		= 216, // You do not have an appropriate ranged weapon equipped. 
	MSGBASIC_CANNOT_SEE				= 217, // You cannot see <target>. 
	MSGBASIC_MOVE_AND_INTERRUPT		= 218, // You move and interrupt your aim. 
    MSGBASIC_RANGED_MISS            = 354, // The<player>'s ranged attack misses. 
	// Charm 
	MSGBASIC_CANNOT_CHARM			= 210, // The <player> cannot charm <target>! 
	MSGBASIC_VERY_DIFFICULT_CHARM	= 211, // It would be very difficult for the <player> to charm <target>. 
	MSGBASIC_DIFFICULT_TO_CHARM		= 212, // It would be difficult for the <player> to charm <target>. 
	MSGBASIC_MIGHT_BE_ABLE_CHARM	= 213, // The <player> might be able to charm <target>. 
	MSGBASIC_SHOULD_BE_ABLE_CHARM	= 214, // The <player> should be able to charm <target>. 
    MSGBASIC_ABOUT_TO_WEAR_OFF      = 251,    // he effect of ${status} is about to wear off. (Sneak etc) 
    // Checkparam 
    MSGBASIC_CHECKPARAM_NAME        = 733,
    MSGBASIC_CHECKPARAM_ILVL        = 731,
    MSGBASIC_CHECKPARAM_PRIMARY     = 712,
    MSGBASIC_CHECKPARAM_AUXILIARY   = 713,
    MSGBASIC_CHECKPARAM_RANGE       = 714,
    MSGBASIC_CHECKPARAM_DEFENSE     = 715,
	// BLU 
	MSGBASIC_LEARNS_SPELL			= 419, // <target> learns (nullptr)! 
	// COR 
	MSGBASIC_ROLL_MAIN				= 420, // The <player> uses .. The total comes to ..! <target> receives the effect of .. 
	MSGBASIC_ROLL_SUB				= 421, // <target> receives the effect of .. 
	MSGBASIC_ROLL_MAIN_FAIL			= 422, // The <player> uses .. The total comes to ..! No effect on <target>. 
	MSGBASIC_ROLL_SUB_FAIL			= 423, // No effect on <target>. 
	MSGBASIC_DOUBLEUP				= 424, // The <player> uses Double-Up. The total for . increases to ..! <target> receives the effect of .. 
	MSGBASIC_DOUBLEUP_FAIL			= 425, // The <player> uses Double-Up. The total for . increases to ..! No effect on <target>. 
	MSGBASIC_DOUBLEUP_BUST			= 426, // The <player> uses Double-Up. Bust! <target> loses the effect of .. 
	MSGBASIC_DOUBLEUP_BUST_SUB		= 427, // <target> loses the effect of .. 
	MSGBASIC_NO_ELIGIBLE_ROLL		= 428, // There are no rolls eligible for Double-Up. Unable to use ability. 
	MSGBASIC_ROLL_ALREADY_ACTIVE	= 429, // The same roll is already active on the <player>. 
	// MNK 
	MSGBASIC_PERFECT_COUNTER_MISS	= 592, // <player> attempts to counter <target>'s attack, but misses. 
	MSGBASIC_COUNTER_ABSORBED_DMG	= 606, // The <target> absorbs <player>'s counter. The <target> recovers .. HP. 
	MSGBASIC_COUNTER_ABS_BY_SHADOW	= 14,  // The <player>'s attack is countered by the <target>. .. of <player>'s shadows absorbs the damage and disappears. 
	// THF 
	MSGBASIC_TREASURE_HUNTER_UP		= 603,  // Additional effect: Treasure Hunter effectiveness against <param1> increases to <param2> 
    // PUP 
    MSGBASIC_AUTO_EXCEEDS_CAPACITY  = 745, // Your automaton exceeds one or more elemental capacity values and cannot be activated. 
    // DNC 
	MSGBASIC_NO_FINISHINGMOVES		= 524,
    // TRUST & ALTER EGO 
    MSGBASIC_TRUST_NO_CAST_TRUST    = 700,  // You are unable to use Trust magic at this time.
    MSGBASIC_TRUST_NO_CALL_AE       = 717,  // You cannot call forth alter egos here.
    // GEO 
    MSGBASIC_SAME_EEFECT_LUOPAN     = 660, // The same effect is already active on that luopan! 
    MSGBASIC_LUOPAN_ALREADY_PLACED  = 661, // <player> has already placed a luopan. Unable to use ability. 
    MSGBASIC_REQUIRE_LUOPAN         = 662, // This action requires a luopan. 
    MSGBASIC_LUOPAN_HP_RATE_DOWN    = 663, // <player> uses <ability>. The luopan's HP consumption rate has been reduced. 
    MSGBASIC_LUOPAN_HP_RATE_UP      = 664, // <player> uses <ability>. The luopan's HP consumption rate has been increased. 
    MSGBASIC_HAS_LUOPON_NO_USE      = 665, // <player> has a pet. Unable to use ability. 
	// ROE 
	MSGBASIC_ROE_START              = 704,
	MSGBASIC_ROE_TIMED              = 705, // You have undertaken the timed record X.
	MSGBASIC_ROE_RECORD             = 697, // Records of Eminence: <record>.
	MSGBASIC_ROE_PROGRESS           = 698, // Progress: <amount>/<amount>.
    // Merits 
    MSGBASIC_MERIT_INCREASE         = 380, // Your <merit> modification has risen to level <level>
    MSGBASIC_MERIT_DECREASE         = 381, // Your <merit> modification has dropped to level <level>
	// DEBUG MESSAGES 
	MSGBASIC_DEBUG_RESISTED_SPELL	= 66, // Debug: Resisted spell! 
	MSGBASIC_DEBUG_RECEIVED_STATUS	= 73, // Debug: <target>'s status is now .. 
	MSGBASIC_DEBUG_RECOVERED_STATUS	= 74, // Debug: <target> recovers from .. 
	MSGBASIC_DEBUG_DBLATK_PROC		= 79, // Debug: <target> uses Double Attack (..%) 
	MSGBASIC_DEBUG_TRPATK_PROC		= 80, // Debug: <target> uses Triple Attack (..%) 
	MSGBASIC_DEBUG_SUCCESS_CHANCE	= 255 // DEBUG: ..% chance of success 
};

/************************************************************************
*																		*
*  																		*
*																		*
************************************************************************/

class CBaseEntity;

class CMessageBasicPacket : public CBasicPacket
{
public:

	CMessageBasicPacket(CBaseEntity* PSender, CBaseEntity* PTarget, int32 param, int32 value, uint16 messageID);
    uint16 getMessageID();
};

#endif
