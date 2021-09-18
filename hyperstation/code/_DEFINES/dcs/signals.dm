// All signals. Format:
// When the signal is called: (signal arguments)
// All signals send the source datum of the signal as the first argument

// global signals
// These are signals which can be listened to by any component on any parent
// start global signals with "!", this used to be necessary but now it's just a formatting choice
/// from base of datum/controller/subsystem/mapping/proc/add_new_zlevel(): (list/args)

/// ingame button pressed (/obj/machinery/button/button)
#define COMSIG_GLOB_BUTTON_PRESSED "!button_pressed"

///from base of atom/Bumped(): (/atom/movable)
#define COMSIG_ATOM_BUMPED "atom_bumped"

///from base of atom/set_light(): (l_range, l_power, l_color)
#define COMSIG_ATOM_SET_LIGHT "atom_set_light"

///from base of atom/wrench_act(): (mob/living/user, obj/item/I)
#define COMSIG_ATOM_WRENCH_ACT "atom_wrench_act"
///from base of atom/multitool_act(): (mob/living/user, obj/item/I)
#define COMSIG_ATOM_MULTITOOL_ACT "atom_multitool_act"
///from base of atom/welder_act(): (mob/living/user, obj/item/I)
#define COMSIG_ATOM_WELDER_ACT "atom_welder_act"
///from base of atom/wirecutter_act(): (mob/living/user, obj/item/I)
#define COMSIG_ATOM_WIRECUTTER_ACT "atom_wirecutter_act"
///from base of atom/crowbar_act(): (mob/living/user, obj/item/I)
#define COMSIG_ATOM_CROWBAR_ACT "atom_crowbar_act"
///from base of atom/analyser_act(): (mob/living/user, obj/item/I)
#define COMSIG_ATOM_ANALYSER_ACT "atom_analyser_act"
	#define COMPONENT_BLOCK_TOOL_ATTACK (1<<0)
///called when an atom stops orbiting another atom: (atom)
#define COMSIG_ATOM_ORBIT_STOP "atom_orbit_stop"
///called on a movable (NOT living) when someone starts pulling it (atom/movable/puller, state, force)
#define COMSIG_ATOM_START_PULL "movable_start_pull"
///called on /living when someone starts pulling it (atom/movable/puller, state, force)
#define COMSIG_LIVING_START_PULL "living_start_pull"
#define COMSIG_MICRO_PICKUP_FEET "micro_force_grabbed"			//From /datum/element/mob_holder/micro
#define COMSIG_MOBSIZE_CHANGED "mobsize_changed"				//Adding this in so items and whatnot can check when someone changes size. -Cap'n

///from base of /mob/Login(): ()
#define COMSIG_MOB_LOGIN "mob_login"
///from base of /mob/Logout(): ()
#define COMSIG_MOB_LOGOUT "mob_logout"
///from base of mob/set_stat(): (new_stat)
#define COMSIG_MOB_STATCHANGE "mob_statchange"
///from base of mob/clickon(): (atom/A, params)
#define COMSIG_MOB_CLICKON "mob_clickon"
///from base of mob/MiddleClickOn(): (atom/A)
#define COMSIG_MOB_MIDDLECLICKON "mob_middleclickon"
	#define COMSIG_MOB_CANCEL_CLICKON (1<<0)
///from base of /mob/living/proc/apply_damage(): (damage, damagetype, def_zone)
#define COMSIG_MOB_APPLY_DAMGE	"mob_apply_damage"
///from base of obj/item/attack_qdeleted(): (atom/target, mob/user, proxiumity_flag, click_parameters)
#define COMSIG_MOB_ITEM_ATTACK_QDELETED "mob_item_attack_qdeleted"			//from base of /mob/transfer_ckey(): (new_character, old_character)
	#define COMPONENT_DO_NOT_PENALIZE_GHOSTING (1<<1)
	#define COMPONENT_FREE_GHOSTING (1<<2)

///from /mob/say_dead(): (mob/speaker, message)
#define COMSIG_MOB_DEADSAY "mob_deadsay"
	#define MOB_DEADSAY_SIGNAL_INTERCEPT (1<<0)
///from /mob/living/emote(): ()
#define COMSIG_MOB_EMOTE "mob_emote"
///from base of mob/swap_hand(): (obj/item)
#define COMSIG_MOB_SWAP_HANDS "mob_swap_hands"
	#define COMPONENT_BLOCK_SWAP (1<<0)

///from base of /obj/item/bodypart/proc/attach_limb(): (new_limb, special) allows you to fail limb attachment
#define COMSIG_LIVING_ATTACH_LIMB "living_attach_limb"
	#define COMPONENT_NO_ATTACH (1<<0)
///sent from borg mobs to itself, for tools to catch an upcoming destroy() due to safe decon (rather than detonation)
#define COMSIG_BORG_SAFE_DECONSTRUCT "borg_safe_decon"

///from /item/organ/proc/Insert() (/obj/item/organ/)
#define COMSIG_CARBON_GAIN_ORGAN "carbon_gain_organ"
///from /item/organ/proc/Remove() (/obj/item/organ/)
#define COMSIG_CARBON_LOSE_ORGAN "carbon_lose_organ"
///from /mob/living/carbon/doUnEquip(obj/item/I, force, newloc, no_move, invdrop, silent)
#define COMSIG_CARBON_EQUIP_HAT "carbon_equip_hat"
///from /mob/living/carbon/doUnEquip(obj/item/I, force, newloc, no_move, invdrop, silent)
#define COMSIG_CARBON_UNEQUIP_HAT "carbon_unequip_hat"

///from base of /turf/proc/levelupdate(). (intact) true to hide and false to unhide
#define COMSIG_OBJ_HIDE	"obj_hide"

///called before marking an object for retrieval, checked in /obj/effect/proc_holder/spell/targeted/summonitem/cast() : (mob/user)
#define COMSIG_ITEM_MARK_RETRIEVAL "item_mark_retrieval"
	#define COMPONENT_BLOCK_MARK_RETRIEVAL (1<<0)

///from base of [/obj/item/proc/tool_check_callback]: (mob/living/user)
#define COMSIG_TOOL_IN_USE "tool_in_use"
///from base of [/obj/item/proc/tool_start_check]: (mob/living/user)
#define COMSIG_TOOL_START_USE "tool_start_use"
#define COMSIG_ITEM_UNWRAPPED "item_unwrapped"
///called when a wrapped up item is opened by hand
	#define COMSIG_ITEM_SPLIT_VALUE  (1<<0)
///called when getting the item's exact ratio for cargo's profit.
#define COMSIG_ITEM_SPLIT_PROFIT "item_split_profits"
///called when getting the item's exact ratio for cargo's profit, without selling the item.
#define COMSIG_ITEM_SPLIT_PROFIT_DRY "item_split_profits_dry"

#define COMSIG_PDA_CHECK_DETONATE "pda_check_detonate"
	#define COMPONENT_PDA_NO_DETONATE (1<<0)

// /obj/item/gun signals
///called in /obj/item/gun/process_fire (user, target, params, zone_override)
#define COMSIG_MOB_FIRED_GUN "mob_fired_gun"

// /obj/mecha signals
///sent from mecha action buttons to the mecha they're linked to
#define COMSIG_MECHA_ACTION_ACTIVATE "mecha_action_activate"

///Whenever EquipRanked is called, called after job is set
#define COMSIG_JOB_RECEIVED "job_received"

// /datum/song signals

///sent to the instrument when a song starts playing
#define COMSIG_SONG_START 	"song_start"
///sent to the instrument when a song stops playing
#define COMSIG_SONG_END		"song_end"

//Creamed

///called when you wash your face at a sink: (num/strength)
#define COMSIG_COMPONENT_CLEAN_FACE_ACT "clean_face_act"

///Mood event that only RnD members listen for
#define COMSIG_ADD_MOOD_EVENT_RND "RND_add_mood"

//Hyperstation Signals (lmao)
//
///from datum/action/cyborg_small_sprite and sends when a cyborg changes modules
#define COMSIG_CYBORG_MODULE_CHANGE "cyborg_module_change"


/* Attack signals. They should share the returned flags, to standardize the attack chain. */
/// tool_act -> pre_attack -> target.attackby (item.attack) -> afterattack
	///Ends the attack chain. If sent early might cause posterior attacks not to happen.
	#define COMPONENT_CANCEL_ATTACK_CHAIN (1<<0)
	///Skips the specific attack step, continuing for the next one to happen.
	#define COMPONENT_SKIP_ATTACK (1<<1)
