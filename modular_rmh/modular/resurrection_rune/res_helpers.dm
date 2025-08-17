GLOBAL_LIST_EMPTY(global_resurrunes)
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
