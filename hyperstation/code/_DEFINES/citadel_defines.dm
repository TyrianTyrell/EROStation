//HUD stuff
#define  ui_arousal "EAST-1:28,CENTER-4:8"//Below the health doll

//1:1 HUD layout stuff

//organ defines

#define KNOT_GIRTH_RATIO_MAX		3
#define KNOT_GIRTH_RATIO_DEF		2.1
#define KNOT_GIRTH_RATIO_MIN		1.25

#define BALLS_SACK_SIZE_MIN 1
#define BALLS_SACK_SIZE_DEF	8
#define BALLS_SACK_SIZE_MAX 40

#define EGG_GIRTH_MIN		1 //inches
#define EGG_GIRTH_DEF		6
#define EGG_GIRTH_MAX		16

#define BREASTS_SIZE_FLAT	0
#define BREASTS_SIZE_A		1
#define BREASTS_SIZE_B		2
#define BREASTS_SIZE_C		3
#define BREASTS_SIZE_D		4
#define BREASTS_SIZE_E		5
#define BREASTS_SIZE_F		6
#define BREASTS_SIZE_G		7
#define BREASTS_SIZE_H		8
#define BREASTS_SIZE_I		9
#define BREASTS_SIZE_J		10
#define BREASTS_SIZE_K		11
#define BREASTS_SIZE_L		12
#define BREASTS_SIZE_M		13
#define BREASTS_SIZE_N		14
#define BREASTS_SIZE_O		15
#define BREASTS_SIZE_HUGE		16
#define BREASTS_SIZE_MASSIVE		17
#define BREASTS_SIZE_GIGA		25
#define BREASTS_SIZE_IMPOSSIBLE		30

//Bodysize Limits
#define MIN_BODYSIZE		50
#define MAX_BODYSIZE		200

#define BREASTS_SIZE_MIN 	BREASTS_SIZE_A
#define BREASTS_SIZE_MAX 	BREASTS_SIZE_IMPOSSIBLE

#define AROUSAL_MINIMUM_DEFAULT 	0
#define AROUSAL_MAXIMUM_DEFAULT 	100
#define AROUSAL_START_VALUE			1

//Damage stuffs
#define AROUSAL "arousal"

//DNA stuffs. Remember to change this if upstream adds more snowflake options


//Species stuffs. Remember to change this if upstream updates species flags

//Citadel istypes
#define isborer(A) (istype(A, /mob/living/simple_animal/borer))

//stamina stuff
#define STAMINA_SOFTCRIT					100 //softcrit for stamina damage. prevents standing up, prevents performing actions that cost stamina, etc, but doesn't force a rest or stop movement
#define STAMINA_SOFTCRIT_TRADITIONAL		0	//same as STAMINA_SOFTCRIT except for the more traditional health calculations
#define STAMINA_CRIT_TRADITIONAL			-40 //ditto, but for STAMINA_CRIT

//component stuff
#define COMSIG_COMBAT_TOGGLED "combatmode_toggled" //called by combat mode toggle on all equipped items. args: (mob/user, combatmode)

#define COMSIG_VORE_TOGGLED "voremode_toggled" // totally not copypasta
