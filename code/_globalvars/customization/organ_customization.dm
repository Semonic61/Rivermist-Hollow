GLOBAL_LIST_INIT(named_penis_sizes, list(
	"Small" = 1,
	"Average" = 2,
	"Large" = 3,
))

//unselectables included.
GLOBAL_LIST_INIT(uns_named_penis_sizes, list(
	"small" = 1,
	"average" = 2,
	"large" = 3,
	"massive" = 4,
	"enormous" = 5,
))

GLOBAL_LIST_INIT(named_ball_sizes, list(
	"Small" = 1,
	"Average" = 2,
	"Large" = 3,
))

//unselectables included.
GLOBAL_LIST_INIT(uns_named_ball_sizes, list(
	"small" = 1,
	"average" = 2,
	"large" = 3,
	"massive" = 4,
	"enormous" = 5,
	"gigantic" = 6,
))

GLOBAL_LIST_INIT(named_breast_sizes, list(
	"Flat" = 0,
	"Very Small" = 1,
	"Small" = 2,
	"Normal" = 3,
	"Large" = 4,
	"Enormous" = 5
))

//unselectables included.
GLOBAL_LIST_INIT(uns_named_breast_sizes, list(
	"flat" = 0,
	"very small" = 1,
	"small" = 2,
	"normal" = 3,
	"large" = 4,
	"extra large" = 5,
	"massive" = 6,
	"enormous" = 7,
	"towering" = 8,
	"magnificent" = 9,
	"gigantic" = 10,
	"titanic" = 11,
	"gargantuan" = 12,
	"colossal" = 13,
	"unbelieveably big" = 14,
	"godly big" = 15,
	"ungodly big" = 16,
))

GLOBAL_LIST_INIT(named_belly_sizes, list(
	"flat" = 0,
	"small" = 1,
	"medium" = 2,
	"large" = 3,
))

GLOBAL_LIST_INIT(named_butt_sizes, list(
	"flat" = 0,
	"small" = 1,
	"medium" = 2,
	"large" = 3,
	"massive" = 4,
))

//unselectables included.
GLOBAL_LIST_INIT(uns_named_butt_sizes, list(
	"flat" = 0,
	"small" = 1,
	"medium" = 2,
	"large" = 3,
	"massive" = 4,
	"enormous" = 5,
))


GLOBAL_LIST_INIT(customizer_choices, build_customizer_choices())
GLOBAL_LIST_INIT(customizers, build_customizers())

/proc/build_customizer_choices()
	. = list()
	for(var/type in typesof(/datum/customizer_choice))
		if(is_abstract(type))
			continue
		.[type] = new type()
	return .

/proc/build_customizers()
	. = list()
	for(var/type in typesof(/datum/customizer))
		if(is_abstract(type))
			continue
		.[type] = new type()
	return .

/proc/color_pick_sanitized(mob/user, description, title, default_value, min_tag = 0.07, max_tag = 0.80)
	var/color = input(user, description, title, default_value) as color|null
	var/good = TRUE
	if(!color)
		return
	color = sanitize_hexcolor(color)
	var/list/hsl = rgb2hsl(hex2num(copytext(color,1,3)),hex2num(copytext(color,3,5)),hex2num(copytext(color,5,7)))
	if(hsl[3] < min_tag)
		to_chat(user, span_warning("The picked color is too dark! Raising Luminosity to minimum 20%."))
		hsl[3] = min_tag
		good = FALSE
	if(hsl[2] > max_tag)
		to_chat(user, span_warning("The picked color is too bright! Lowering Saturation to maximum 80%."))
		hsl[2] = max_tag
		good = FALSE
	if(!good)
		var/list/rgb = hsl2rgb(arglist(hsl))
		color = sanitize_hexcolor("[num2hex(rgb[1])][num2hex(rgb[2])][num2hex(rgb[3])]")

	return color
