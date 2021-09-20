//Global defines for most of the unmentionables.
//Be sure to update the min/max of these if you do change them.
//Measurements are in imperial units. Inches, feet, yards, miles. Tsp, tbsp, cups, quarts, gallons, etc

//Filters
#define CIT_FILTER_STAMINACRIT filter(type="drop_shadow", x=0, y=0, size=-3, color="#04080F")

//organ defines
#define VAGINA_LAYER_INDEX		1
#define TESTICLES_LAYER_INDEX	2
#define GENITAL_LAYER_INDEX		3
#define PENIS_LAYER_INDEX		4

#define GENITAL_LAYER_INDEX_LENGTH 4 //keep it updated with each new index added, thanks.

//genital flags
#define GENITAL_BLACKLISTED		(1<<0) //for genitals that shouldn't be added to GLOB.genitals_list.
#define GENITAL_INTERNAL		(1<<1)
#define GENITAL_HIDDEN			(1<<2)
#define GENITAL_THROUGH_CLOTHES	(1<<3)
#define GENITAL_FUID_PRODUCTION	(1<<4)
#define CAN_MASTURBATE_WITH		(1<<5)
#define MASTURBATE_LINKED_ORGAN	(1<<6) //used to pass our mission to the linked organ
#define CAN_CLIMAX_WITH			(1<<7)
#define GENITAL_CAN_AROUSE		(1<<8)
#define GENITAL_UNDIES_HIDDEN	(1<<9)
#define UPDATE_OWNER_APPEARANCE	(1<<10)
#define GENITAL_CAN_TAUR		(1<<11)


#define DEF_VAGINA_SHAPE	"Human"

//organ defines
#define COCK_SIZE_DEF		6
#define COCK_SIZE_MIN		1
#define COCK_SIZE_MAX		36

#define COCK_DIAMETER_RATIO_MAX		0.42
#define COCK_DIAMETER_RATIO_DEF		0.25
#define COCK_DIAMETER_RATIO_MIN		0.15

#define DEF_COCK_SHAPE		"Human"

#define BALLS_VOLUME_BASE	25
#define BALLS_VOLUME_MULT	1

#define DEF_BALLS_SHAPE		"Single"

#define BALLS_SIZE_MIN		1
#define BALLS_SIZE_DEF		2
#define BALLS_SIZE_MAX		3

#define CUM_RATE			5
#define CUM_RATE_MULT		1
#define CUM_EFFICIENCY		1 //amount of nutrition required per life()

#define BREASTS_VOLUME_BASE	50	//base volume for the reagents in the breasts, multiplied by the size then multiplier. 50u for A cups, 850u for HH cups.
#define BREASTS_VOLUME_MULT	1	//global multiplier for breast volume.

#define BREASTS_SIZE_DEF	"c" //lowercase cause those sprite accessory don't use uppercased letters.

#define DEF_BREASTS_SHAPE	"Pair"

#define MILK_RATE			5
#define MILK_RATE_MULT		1
#define MILK_EFFICIENCY		1

//visibility toggles defines to avoid errors typos code errors.
#define GEN_VISIBLE_ALWAYS "Always visible"
#define GEN_VISIBLE_NO_CLOTHES "Hidden by clothes"
#define GEN_VISIBLE_NO_UNDIES "Hidden by underwear"
#define GEN_VISIBLE_NEVER "Always hidden"

//Individual logging define
#define INDIVIDUAL_LOOC_LOG "LOOC log"

#define ADMIN_MARKREAD(client) "(<a href='?_src_=holder;markedread=\ref[client]'>MARK READ</a>)"//marks an adminhelp as read and under investigation
#define ADMIN_IC(client) "(<a href='?_src_=holder;icissue=\ref[client]'>IC</a>)"//marks and adminhelp as an IC issue
#define ADMIN_REJECT(client) "(<a href='?_src_=holder;rejectadminhelp=\ref[client]'>REJT</a>)"//Rejects an adminhelp for being unclear or otherwise unhelpful. resets their adminhelp timer

//Citadel istypes
#define isgenital(A) (istype(A, /obj/item/organ/genital))

#define CITADEL_MENTOR_OOC_COLOUR "#224724"

//xenobio console upgrade stuff
#define XENOBIO_UPGRADE_MONKEYS				1
#define XENOBIO_UPGRADE_SLIMEBASIC			2
#define XENOBIO_UPGRADE_SLIMEADV			4

//Citadel toggles because bitflag memes
#define MEDIHOUND_SLEEPER	(1<<0)
#define EATING_NOISES		(1<<1)
#define DIGESTION_NOISES	(1<<2)
#define BREAST_ENLARGEMENT	(1<<3)
#define PENIS_ENLARGEMENT	(1<<4)
#define FORCED_FEM			(1<<5)
#define FORCED_MASC			(1<<6)
#define HYPNO				(1<<7)
#define NEVER_HYPNO			(1<<8)
#define NO_APHRO			(1<<9)
#define NO_ASS_SLAP			(1<<10)
#define BIMBOFICATION		(1<<11)
#define NO_AUTO_WAG			(1<<12)
#define GENITAL_EXAMINE		(1<<13)
#define VORE_EXAMINE		(1<<14)
#define TRASH_FORCEFEED		(1<<15)
//#define TOGGLES_CITADEL 0
#define TOGGLES_CITADEL (EATING_NOISES|DIGESTION_NOISES)
//belly sound pref things
#define NORMIE_HEARCHECK 4

//icon states for the default eyes and for a state for no eye
#define DEFAULT_EYES_TYPE			"normal"
#define DEFAULT_LEFT_EYE_STATE		"normal_left_eye"
#define DEFAULT_RIGHT_EYE_STATE		"normal_right_eye"
#define DEFAULT_NO_EYE_STATE		"no_eye"

//special species definitions
#define MINIMUM_MUTANT_COLOR	"#202020" //this is how dark players mutant parts and skin can be

//defines for different matrix sections
#define MATRIX_RED			"red"
#define MATRIX_GREEN		"green"
#define MATRIX_BLUE			"blue"
#define MATRIX_RED_GREEN	"red_green"
#define MATRIX_RED_BLUE		"red_blue"
#define MATRIX_GREEN_BLUE	"green_blue"
#define MATRIX_ALL			"red_green_blue"
#define MATRIX_NONE			"none"

//defines for the two colour schemes, advanced and old
#define OLD_CHARACTER_COLORING			"old_color_system"
#define ADVANCED_CHARACTER_COLORING		"advanced_color_system"

//Hyper stuffs

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
