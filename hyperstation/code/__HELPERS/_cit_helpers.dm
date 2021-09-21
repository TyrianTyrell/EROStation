//THIS FILE CONTAINS CONSTANTS, PROCS, AND OTHER THINGS//
/////////////////////////////////////////////////////////

/*/mob/proc/setClickCooldown(var/timeout)
	next_move = max(world.time + timeout, next_move)

	No fkin idea what next_move is and it isn't even declared in the original hyper code kek
	*/

//Genitals and Arousal Lists
GLOBAL_LIST_EMPTY(cock_shapes_icons) //Associated list for names->icon_states for cockshapes.
GLOBAL_LIST_EMPTY(gentlemans_organ_names)

GLOBAL_LIST_EMPTY(balls_shapes_icons)
GLOBAL_LIST_EMPTY(breasts_size_list)
GLOBAL_LIST_EMPTY(genital_fluids_list)

GLOBAL_LIST_EMPTY(breasts_shapes_icons)
GLOBAL_LIST_INIT(cum_into_containers_list, list(/obj/item/reagent_containers/food/snacks/pie)) //Yer fuggin snowflake name list jfc

GLOBAL_LIST_INIT(cum_id_list, /datum/reagent/consumable/semen)
GLOBAL_LIST_INIT(milk_id_list, /datum/reagent/consumable/milk)

//LOOC toggles
/client/verb/listen_looc()
	set name = "Show/Hide LOOC"
	set category = "Preferences"
	set desc = "Toggles seeing LocalOutOfCharacter chat"
	prefs.chat_toggles ^= CHAT_LOOC
	prefs.save_preferences()
	src << "You will [(prefs.chat_toggles & CHAT_LOOC) ? "now" : "no longer"] see messages on the LOOC channel."
	SSblackbox.record_feedback("tally", "admin_verb", 1, "TLOOC") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

//Crew objective and miscreants stuff
/mob/living/carbon/proc/has_ovipositor()
	var/obj/item/organ/genital/G = getorganslot(ORGAN_SLOT_PENIS)
	if(G && istype(G, /obj/item/organ/genital/ovipositor))
		return TRUE
	return FALSE

/mob/living/carbon/human/proc/has_eggsack()
	var/obj/item/organ/genital/G = getorganslot(ORGAN_SLOT_TESTICLES)
	if(G && istype(G, /obj/item/organ/genital/eggsack))
		return TRUE
	return FALSE

/mob/living/carbon/human/proc/is_bodypart_exposed(bodypart)

/mob/living/carbon/proc/is_butt_exposed(var/list/L)
	if(!L)
		L = get_equipped_items()
	for(var/obj/item/I in L)
		if(I.body_parts_covered & GROIN)
			if(!I.do_not_cover_butt)
				return FALSE
			else
				return TRUE
	return TRUE
