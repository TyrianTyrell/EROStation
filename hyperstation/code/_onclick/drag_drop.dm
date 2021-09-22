/client
	var/list/atom/selected_target[2]
	var/obj/item/active_mousedown_item = null
	var/mouseParams = ""
	var/mouseLocation = null
	var/mouseObject = null
	var/mouseControlObject = null
	var/middragtime = 0
	var/atom/middragatom

/obj/item
	var/canMouseDown = FALSE

/obj/item/gun
	var/automatic = 0 //can gun use it, 0 is no, anything above 0 is the delay between clicks in ds

/datum/proc/onMouseMove(object, location, control, params)
	return
