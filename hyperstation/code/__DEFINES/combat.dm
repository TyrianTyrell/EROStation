//Actual combat defines

//click cooldowns, in tenths of a second, used for various combat actions
#define CLICK_CD_BREAKOUT 100

//slowdown when in softcrit

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
