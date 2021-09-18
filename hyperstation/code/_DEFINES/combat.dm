//Actual combat defines

//click cooldowns, in tenths of a second, used for various combat actions
#define CLICK_CD_BREAKOUT 100

//slowdown when in softcrit
#define SOFTCRIT_ADD_SLOWDOWN 6

//Attack types for checking shields/hit reactions
#define MELEE_ATTACK 1
#define UNARMED_ATTACK 2
#define PROJECTILE_ATTACK 3
#define THROWN_PROJECTILE_ATTACK 4
#define LEAP_ATTACK 5

//Shove slowdown
#define SHOVE_SLOWDOWN_ID "shove_slowdown"
#define SHOVE_SLOWDOWN_LENGTH 30
#define SHOVE_SLOWDOWN_STRENGTH 0.85 //multiplier
//Shove disarming item list
GLOBAL_LIST_INIT(shove_disarming_types, typecacheof(list(
	/obj/item/gun)))

//His Grace.
#define EMP_HEAVY 1
#define EMP_LIGHT 2

//bullet_act() return values
#define BULLET_ACT_HIT				"HIT"		//It's a successful hit, whatever that means in the context of the thing it's hitting.
#define BULLET_ACT_BLOCK			"BLOCK"		//It's a blocked hit, whatever that means in the context of the thing it's hitting.
#define BULLET_ACT_FORCE_PIERCE		"PIERCE"	//It pierces through the object regardless of the bullet being piercing by default.
#define BULLET_ACT_TURF				"TURF"		//It hit us but it should hit something on the same turf too. Usually used for turfs.

//items total mass, used to calculate their attacks' stamina costs. If not defined, the cost will be (w_class * 1.25)
#define TOTAL_MASS_TINY_ITEM		1.25
#define TOTAL_MASS_SMALL_ITEM		2.5
#define TOTAL_MASS_NORMAL_ITEM		3.75
#define TOTAL_MASS_BULKY_ITEM		5
#define TOTAL_MASS_HUGE_ITEM		6.25
#define TOTAL_MASS_GIGANTIC_ITEM	7.5

#define TOTAL_MASS_HAND_REPLACEMENT	5 //standard punching stamina cost. most hand replacements are huge items anyway.
#define TOTAL_MASS_MEDIEVAL_WEAPON	3.6 //very, very generic average sword/warpick/etc. weight in pounds.
#define TOTAL_MASS_TOY_SWORD 1.5
