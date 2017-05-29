//gang_datum.dm
//Datum-based gangs

/datum/gang
	var/name = "ERROR"
	var/color = "white"
	var/color_hex = "#FFFFFF"
	var/list/datum/mind/gangsters = list() //gang B Members
	var/list/datum/mind/bosses = list() //gang A Bosses
	var/list/obj/item/device/gangtool/gangtools = list()
	var/style
	var/fighting_style = "normal"
	var/list/territory = list()
	var/list/territory_new = list()
	var/list/territory_lost = list()
	var/recalls = 1
	var/dom_attempts = 2
	var/inner_outfit
	var/outer_outfit
	var/datum/atom_hud/antag/gang/ganghud
	var/is_deconvertible = TRUE //Can you deconvert normal gangsters from the gang

	var/domination_timer
	var/is_dominating

	var/boss_item_list
	var/boss_category_list
	var/static/list/boss_items = list(
		/datum/gang_item/function/gang_ping,
		/datum/gang_item/function/recall,

		/datum/gang_item/clothing/under,
		/datum/gang_item/clothing/suit,
		/datum/gang_item/clothing/hat,
		/datum/gang_item/clothing/neck,
		/datum/gang_item/clothing/shoes,
		/datum/gang_item/clothing/mask,
		/datum/gang_item/clothing/hands,
		/datum/gang_item/clothing/belt,

		/datum/gang_item/weapon/shuriken,
		/datum/gang_item/weapon/switchblade,
		/datum/gang_item/weapon/improvised,
		/datum/gang_item/weapon/ammo/improvised_ammo,
		/datum/gang_item/weapon/surplus,
		/datum/gang_item/weapon/ammo/surplus_ammo,
		/datum/gang_item/weapon/pistol,
		/datum/gang_item/weapon/ammo/pistol_ammo,
		/datum/gang_item/weapon/sniper,
		/datum/gang_item/weapon/ammo/sniper_ammo,
		/datum/gang_item/weapon/machinegun,
		/datum/gang_item/weapon/uzi,
		/datum/gang_item/weapon/ammo/uzi_ammo,
		/datum/gang_item/equipment/sharpener,
		/datum/gang_item/equipment/spraycan,
		/datum/gang_item/equipment/emp,
		/datum/gang_item/equipment/c4,
		/datum/gang_item/equipment/frag,
		/datum/gang_item/equipment/stimpack,
		/datum/gang_item/equipment/implant_breaker,
		/datum/gang_item/equipment/wetwork_boots,
		/datum/gang_item/equipment/pen,
		/datum/gang_item/equipment/dominator
	)

	var/reg_item_list
	var/reg_category_list
	var/static/list/soldier_items = list(
		/datum/gang_item/clothing/under,
		/datum/gang_item/clothing/suit,
		/datum/gang_item/clothing/hat,
		/datum/gang_item/clothing/neck,
		/datum/gang_item/clothing/shoes,
		/datum/gang_item/clothing/mask,
		/datum/gang_item/clothing/hands,
		/datum/gang_item/clothing/belt,

  	/datum/gang_item/weapon/shuriken,
		/datum/gang_item/weapon/switchblade,
		/datum/gang_item/weapon/improvised,
		/datum/gang_item/weapon/ammo/improvised_ammo,
		/datum/gang_item/weapon/surplus,
		/datum/gang_item/weapon/ammo/surplus_ammo,
		/datum/gang_item/weapon/pistol,
		/datum/gang_item/weapon/ammo/pistol_ammo,
		/datum/gang_item/weapon/sniper,
		/datum/gang_item/weapon/ammo/sniper_ammo,
		/datum/gang_item/weapon/machinegun,
		/datum/gang_item/weapon/uzi,
		/datum/gang_item/weapon/ammo/uzi_ammo,
		/datum/gang_item/equipment/sharpener,
		/datum/gang_item/equipment/spraycan,
		/datum/gang_item/equipment/emp,
		/datum/gang_item/equipment/c4,
		/datum/gang_item/equipment/frag,
		/datum/gang_item/equipment/stimpack,
		/datum/gang_item/equipment/implant_breaker,
		/datum/gang_item/equipment/wetwork_boots,
	)

/datum/gang/New(loc,gangname)
	if(!GLOB.gang_colors_pool.len)
		message_admins("WARNING: Maximum number of gangs have been exceeded!")
		throw EXCEPTION("Maximum number of gangs has been exceeded")
		return
	else
		color = pick(GLOB.gang_colors_pool)
		GLOB.gang_colors_pool -= color
		switch(color)
			if("red")
				color_hex = "#DA0000"
				inner_outfit = pick(/obj/item/clothing/under/color/red, /obj/item/clothing/under/lawyer/red)
			if("orange")
				color_hex = "#FF9300"
				inner_outfit = pick(/obj/item/clothing/under/color/orange, /obj/item/clothing/under/geisha)
			if("yellow")
				color_hex = "#FFF200"
				inner_outfit = pick(/obj/item/clothing/under/color/yellow, /obj/item/clothing/under/burial, /obj/item/clothing/under/suit_jacket/tan)
			if("green")
				color_hex = "#A8E61D"
				inner_outfit = pick(/obj/item/clothing/under/color/green, /obj/item/clothing/under/syndicate/camo, /obj/item/clothing/under/suit_jacket/green)
			if("blue")
				color_hex = "#00B7EF"
				inner_outfit = pick(/obj/item/clothing/under/color/blue, /obj/item/clothing/under/suit_jacket/navy)
			if("purple")
				color_hex = "#DA00FF"
				inner_outfit = pick(/obj/item/clothing/under/color/lightpurple, /obj/item/clothing/under/lawyer/purpsuit)
			if("white")
				color_hex = "#FFFFFF"
				inner_outfit = pick(/obj/item/clothing/under/color/white, /obj/item/clothing/under/suit_jacket/white)

	name = (gangname ? gangname : pick(GLOB.gang_name_pool))
	GLOB.gang_name_pool -= name
	outer_outfit = pick(GLOB.gang_outfit_pool)
	ganghud = new()
	ganghud.color = color_hex
	log_game("The [name] Gang has been created. Their gang color is [color].")
	build_item_list()

/datum/gang/proc/build_item_list()
	boss_item_list = list()
	boss_category_list = list()
	for(var/B in boss_items)
		var/datum/gang_item/G = new B()
		boss_item_list[G.id] = G
		var/list/Cat = boss_category_list[G.category]
		if(Cat)
			Cat += G
		else
			boss_category_list[G.category] = list(G)

	reg_item_list = list()
	reg_category_list = list()
	for(var/S in soldier_items)
		var/datum/gang_item/G = new S()
		reg_item_list[G.id] = G
		var/list/Cat = reg_category_list[G.category]
		if(Cat)
			Cat += G
		else
			reg_category_list[G.category] = list(G)

/datum/gang/proc/add_gang_hud(datum/mind/recruit_mind)
	ganghud.join_hud(recruit_mind.current)
	SSticker.mode.set_antag_hud(recruit_mind.current, ((recruit_mind in bosses) ? "gang_boss" : "gangster"))

/datum/gang/proc/remove_gang_hud(datum/mind/defector_mind)
	ganghud.leave_hud(defector_mind.current)
	SSticker.mode.set_antag_hud(defector_mind.current, null)

/datum/gang/proc/domination(modifier=1)
	set_domination_time(determine_domination_time(src) * modifier)
	is_dominating = TRUE
	set_security_level("delta")

/datum/gang/proc/set_domination_time(d)
	domination_timer = world.time + (10 * d)

/datum/gang/proc/domination_time_remaining()
	var/diff = domination_timer - world.time
	return diff / 10

//////////////////////////////////////////// MESSAGING


/datum/gang/proc/message_gangtools(message,beep=1,warning)
	if(!gangtools.len || !message)
		return
	for(var/obj/item/device/gangtool/tool in gangtools)
		var/mob/living/mob = get(tool.loc,/mob/living)
		if(mob && mob.mind && mob.stat == CONSCIOUS)
			if(mob.mind.gang_datum == src)
				to_chat(mob, "<span class='[warning ? "warning" : "notice"]'>\icon[tool] [message]</span>")
			return


//////////////////////////////////////////// INCOME


/datum/gang/proc/income()
	if(!bosses.len)
		return
	var/added_names = ""
	var/lost_names = ""

	//Re-add territories that were reclaimed, so if they got tagged over, they can still earn income if they tag it back before the next status report
	var/list/reclaimed_territories = territory_new & territory_lost
	territory |= reclaimed_territories
	territory_new -= reclaimed_territories
	territory_lost -= reclaimed_territories

	//Process lost territories
	for(var/area in territory_lost)
		if(lost_names != "")
			lost_names += ", "
		lost_names += "[territory_lost[area]]"
		territory -= area

	//Calculate and report influence growth

	//Process new territories
	for(var/area in territory_new)
		if(added_names != "")
			added_names += ", "
		added_names += "[territory_new[area]]"
		territory += area

	//Report territory changes
	var/message = "<b>[src] Gang Status Report:</b>.<BR>*---------*<BR>"
	message += "<b>[territory_new.len] new territories:</b><br><i>[added_names]</i><br>"
	message += "<b>[territory_lost.len] territories lost:</b><br><i>[lost_names]</i><br>"
	//Clear the lists
	territory_new = list()
	territory_lost = list()
	var/control = round((territory.len/GLOB.start_state.num_territories)*100, 1)
	var/sbonus = sqrt(LAZYLEN(territory))  // Bonus given to soldier's for the gang's total territory
	message += "Your gang now has <b>[control]% control</b> of the station.<BR>*---------*<BR>"
	if(is_dominating)
		var/seconds_remaining = domination_time_remaining()
		var/new_time = max(180, seconds_remaining - (territory.len * 2))
		if(new_time < seconds_remaining)
			message += "Takeover shortened by [seconds_remaining - new_time] seconds for defending [territory.len] territories.<BR>"
			set_domination_time(new_time)
		message += "<b>[seconds_remaining] seconds remain</b> in hostile takeover.<BR>"
	else
		for(var/obj/item/device/gangtool/G in gangtools)
			var/pmessage = message
			var/points_new = 0
			if(istype(G, /obj/item/device/gangtool/soldier))
				points_new = max(0,round(3 - G.points/10)) + (sbonus) + (LAZYLEN(G.tags)/2) // Soldier points
				pmessage += "Your influence has increased by [round(sbonus)] from your gang holding [LAZYLEN(territory)] territories, and a bonus of [round(LAZYLEN(G.tags)/2)] for territories you have personally marked and kept intact.<BR>"
			else
				points_new = max(0,round(5 - G.points/10)) + LAZYLEN(territory) // Boss points, more focused on big picture
				pmessage += "Your influence has increased by [round(points_new)] from your gang holding [territory.len] territories<BR>"
			G.points += points_new
			var/mob/living/carbon/human/ganger = get(G.loc, /mob/living)
			var/points_newer = 0
			var/static/inner = inner_outfit
			var/static/outer = outer_outfit
			if(ishuman(ganger) && ganger.mind in (gangsters|bosses))
				for(var/obj/C in ganger.contents)
					if(C.type == inner_outfit)
						points_newer += 2
						continue
					if(C.type == outer_outfit)
						points_newer += 2
						continue
					switch(C.type)
						if(/obj/item/clothing/neck/necklace/dope)
							points_newer += 2
						if(/obj/item/clothing/head/collectable/petehat/gang)
							points_newer += 4
						if(/obj/item/clothing/shoes/gang)
							points_newer += 6
						if(/obj/item/clothing/mask/gskull)
							points_newer += 5
						if(/obj/item/clothing/gloves/gang)
							points_newer += 3
						if(/obj/item/weapon/storage/belt/military/gang)
							points_newer += 4
			if(points_newer)
				G.points += points_newer
				pmessage += "Your influential choice of clothing has further increased your influence by [points_newer] points.<BR>"
			pmessage += "You now have <b>[G.points] influence</b>.<BR>"
			to_chat(ganger, "<span class='notice'>\icon[G] [pmessage]</span>")


//Multiverse

/datum/gang/multiverse
	dom_attempts = 0
	fighting_style = "multiverse"
	is_deconvertible = FALSE

/datum/gang/multiverse/New(loc, multiverse_override)
	name = multiverse_override
	ganghud = new()

/datum/gang/multiverse/income()
	return
