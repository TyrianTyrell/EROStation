/obj/item/organ/stomach/var/intestinesolid = 0
/obj/item/organ/stomach/var/intestinegas = 0
/obj/item/var/soiled = FALSE
/mob/living/carbon/human/var/underwearsoiled = FALSE

/mob/living/carbon/proc/fart()
	var/datum/gas_mixture/G = src.loc.return_air()
	G.set_moles(GAS_METHANE, (G.get_moles(GAS_METHANE) + rand(3, 6)))

/mob/living/carbon/proc/shit()
	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		if(H.underwear == "Nude" || H.hidden_underwear == TRUE)
			if(H.w_uniform == null)
				if(H.wear_suit == null)
					new/obj/item/poop(src.loc)
				else
					H.wear_suit.soiled = TRUE
					H.update_inv_wear_suit()
			else
				H.w_uniform.soiled = TRUE
				H.update_inv_w_uniform()
		else
			H.underwearsoiled = TRUE
		H.update_overlays()
		H.update_icon()

/obj/item/organ/stomach/on_life()
	. = ..()
	intestinesolid += (owner.nutrition / 2500)
	intestinegas += (owner.nutrition / 1000)
	if(intestinegas >= 100)
		intestinegas = 0
		owner.fart()
		if(intestinesolid >= 85 && prob(25))
			owner.visible_message("<span class='notice'>A loud, rude noise comes from [owner]'s direction.</span>","<span class='notice'>Your stomach churns as gas erupts from your rear end- followed by something that definitely ISN'T gas.</span>")
			owner.shit()
			intestinesolid = 0
		else
			owner.visible_message("<span class='notice'>A loud, rude noise comes from [owner]'s direction.</span>","<span class='notice'>Your stomach churns as you let loose a rank, smelly, fart.</span>")
	if(intestinesolid >= 100)
		owner.visible_message("<span class='notice'>A loud, rude noise comes from [owner]'s direction.</span>","<span class='notice'>Your stomach churns as you curl your body up and dump a log out of your intestines.</span>")
		intestinesolid = 0
		owner.shit()

/obj/item/poop
	name = "poop"
	desc = "A wad of poop."
	icon = 'icons/pooping/poop.dmi'
	icon_state = "pooplogmed"
	w_class = WEIGHT_CLASS_SMALL
