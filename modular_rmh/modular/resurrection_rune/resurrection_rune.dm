
//For revive - your body DIDN'T rot, but it did suffer damage. Unlike being rotted, this one is only timed. Not forever.
/datum/status_effect/debuff/revived/rune
	id = "revived"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/revived/rune
	effectedstats = list("strength" = -1, "perception" = -1, "intelligence" = -1, "endurance" = -1, "constitution" = -1, "speed" = -1, "fortune" = -1)
	duration = 15 MINUTES		//Should be long enough to stop someone from running back into battle. Plus, this stacks with body-rot debuff. RIP.

/atom/movable/screen/alert/status_effect/debuff/revived
	name = "Revival Sickness"
	desc = "You felt lyfe itself course through you, restoring your lux and your essance. You.. live - but your body aches. It still needs time to recover.."
	icon_state = "revived"

#define REVIVAL_FILTER "revival_glow"
/atom/movable/screen/alert/status_effect/debuff/revived/rune
	name = "Revival Afterglow"
	desc = "You have been reknit and transported by unfathomable forces. You need time to recover,"
	icon_state = "revived"

/datum/status_effect/debuff/rune_glow
	var/outline_colour ="#b86cf7"
	id = "rune_revival"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/revived/rune
	duration = 30 SECONDS

/datum/status_effect/debuff/rune_glow/on_apply()
	. = ..()
	var/filter = owner.get_filter(REVIVAL_FILTER)
	owner.SetKnockdown(duration)
	owner.SetStun(duration)
	if (!filter)
		owner.add_filter(REVIVAL_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 200, "size" = 1))

/datum/status_effect/debuff/rune_glow/on_remove()
	. = ..()
	to_chat(owner, span_warning("The revival sickness has eased a little..."))
	owner.remove_filter(REVIVAL_FILTER)

#undef REVIVAL_FILTER

/datum/resurrection_rune_controller
	var/obj/structure/resurrection_rune/control/control_rune
	var/obj/structure/resurrection_rune/sub_rune
	var/list/linked_users = list()
	var/list/linked_users_names = list()
	var/list/linked_users_minds = list()
	var/list/body_mind_link = list()
	var/list/resurrecting = list()
	// If the body is destroyed, what do we spawn for them
	var/mob_type = /mob/living/carbon/human

/datum/resurrection_rune_controller/New()
	.=..()
	START_PROCESSING(SSobj, src)

/datum/resurrection_rune_controller/Destroy()
	.=..()
	STOP_PROCESSING(SSobj, src)

	for(var/el in linked_users)
		UnregisterSignal(el, COMSIG_LIVING_HEALTH_UPDATE, PROC_REF(start_revive))


/datum/resurrection_rune_controller/process()
	if(!linked_users_minds.len)
		return
	for(var/datum/mind/mind_user in linked_users_minds)
		if(!mind_user.current && !(mind_user in resurrecting))
			to_chat(mind_user.get_ghost(TRUE, TRUE), span_blue("Somewhere, you are being remade anew..."))
			resurrecting |= mind_user
			addtimer(CALLBACK(src, PROC_REF(spawn_new_body), mind_user), 90 SECONDS)

/datum/resurrection_rune_controller/proc/spawn_new_body(datum/mind/mind)
	linked_users -= body_mind_link[mind]
	var/turf/T = get_turf(sub_rune)
	var/mob/living/body = new mob_type(T)
	var/mob/ghostie = mind.get_ghost(TRUE)
	if(ghostie.client && ghostie.client.prefs)
		ghostie.client.prefs.copy_to(body)
	mind.current = body //little hack
	mind.transfer_to(body)
	mind.grab_ghost(TRUE)
	body.flash_act()

	linked_users += body
	body.apply_status_effect(/datum/status_effect/debuff/revived)
	body.apply_status_effect(/datum/status_effect/debuff/rune_glow)
	playsound(T, 'sound/misc/vampirespell.ogg', 100, FALSE, -1)
	to_chat(body, span_blue("You are back."))
	resurrecting -= mind

/datum/resurrection_rune_controller/proc/add_user(mob/user)
	if(user in linked_users)
		return FALSE
	linked_users += user
	linked_users_minds += user.mind
	linked_users_names[user.name] += user
	body_mind_link[user.mind] = user
	RegisterSignal(user, COMSIG_LIVING_HEALTH_UPDATE, PROC_REF(start_revive))
	return TRUE

/datum/resurrection_rune_controller/proc/remove_user(mob/user)
	if(!(user in linked_users))
		return FALSE
	linked_users -= user
	linked_users_minds -= user.mind
	linked_users_names[user.name] -= user
	body_mind_link[user.mind] = user
	UnregisterSignal(user, COMSIG_LIVING_HEALTH_UPDATE, PROC_REF(start_revive))
	return TRUE

/datum/resurrection_rune_controller/proc/start_revive(mob/living/carbon/target)
	SIGNAL_HANDLER


	if(target.IsSleeping())
		return
	
	if(!(target in linked_users)) //sanity check
		return
	
	if(IS_DEAD_OR_INCAP(target))
		if(target in resurrecting)
			return
		start_revival(target)
	return

/datum/resurrection_rune_controller/proc/start_revival(mob/living/carbon/user)
	to_chat(user.mind, span_blue("You feel a faint force tuggung you back to life..."))
	sub_rune.visible_message(span_blue("The rune begins to grow brighter."))
	resurrecting |= user
	addtimer(CALLBACK(src, PROC_REF(revive_linked), user), 60 SECONDS)


/datum/resurrection_rune_controller/proc/revive_linked(mob/living/carbon/user)
	var/turf/T = get_turf(sub_rune)
	var/mob/living/body = user
	if(!body)
		sub_rune.visible_message(span_blue("The rune flickers, connection to a body suddenly severed."))
		resurrecting -= user
		return

	body.forceMove(T)
	body.revive(full_heal = TRUE, admin_revive = TRUE)
	user.grab_ghost(TRUE)
	body.flash_act()
	resurrecting -= user
	body.apply_status_effect(/datum/status_effect/debuff/revived)
	body.apply_status_effect(/datum/status_effect/debuff/rune_glow)
	playsound(T, 'sound/misc/vampirespell.ogg', 100, FALSE, -1)
	to_chat(body, span_blue("You are back."))

/obj/structure/resurrection_rune
	name = "grand rune"
	desc = "It emits an otherwordly hum."
	icon = 'icons/effects/160x160.dmi'
	icon_state = "portal"
	anchored = TRUE
	layer = BELOW_OPEN_DOOR_LAYER
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

	var/datum/resurrection_rune_controller/resrunecontroler
	var/is_main = FALSE
	var/obj/structure/resurrection_rune/control/main_rune_link
	pixel_x = -64
	pixel_y = -64

/obj/structure/resurrection_rune/Initialize()
	. = ..()
	resrunecontroler = new /datum/resurrection_rune_controller()
	resrunecontroler.sub_rune = src
	for(var/rune in GLOB.global_resurrunes)
		if(istype(rune, /obj/structure/resurrection_rune/control) || !(rune == src))
			main_rune_link = rune
			resrunecontroler.control_rune = rune
	GLOB.global_resurrunes += src

/obj/structure/resurrection_rune/Destroy()
	qdel(resrunecontroler)
	. = ..()

/obj/structure/resurrection_rune/attack_hand(mob/user)
	. = ..()

	if(!istype(user, /mob/living/carbon))
		return
	
	if(!resrunecontroler)
		return
	if(!main_rune_link)
		to_chat(user, span_blue("Somehow, the main rune is not connected..."))
		return

	if(main_rune_link.disabled_res || !is_main)
		to_chat(user, span_blue("Your masters have disabled the rune!"))
		return
	
	if(!is_main)
		var/input = input(user, "What do you wish to do?", "Rune of Souls") as anything in list("Link Soul", "Revive a lost Soul")
		switch(input)
			if("Link Soul")
				if(user in resrunecontroler.linked_users)
					to_chat(user, span_blue("Your Soul is already linked."))
					return

				to_chat(user, span_blue("You link your Soul to the Rune."))
				resrunecontroler.add_user(user)
				return
			if("Revive a lost Soul")
				to_chat(user, span_blue("The rune sputters, as if offended."))
				return
			else
				return
	

/obj/structure/resurrection_rune/attacked_by(obj/item/I, mob/living/user)
	return FALSE

/obj/structure/resurrection_rune/control
	name = "master rune"
	is_main = TRUE
	var/disabled_res = FALSE

/obj/structure/resurrection_rune/control/Initialize()
	. = ..()

/obj/structure/resurrection_rune/control/attack_hand(mob/user)
	. = ..()
	var/input = input(user, "What do you wish to do?", "Master Rune") as anything in list("Link Soul", "Unlink a Soul", "Disable Sub Rune")
	switch(input)
		if("Link Soul")
			if(user in resrunecontroler.linked_users)
				to_chat(user, span_blue("Your Soul is already linked."))
				return

			to_chat(user, span_blue("You link your Soul to the Rune."))
			resrunecontroler.add_user(user)
			return
		if("Unlink a Soul")
			var/mob/target = input(user, "Choose.", "Souls") as anything in resrunecontroler.linked_users_names
			resrunecontroler.remove_user(target)
			to_chat(user, span_blue("They are now damned."))
			return
		if("Disable Sub Rune")
			disabled_res = TRUE
			to_chat(user, span_blue("Let them perish."))
			return
		else
			return
