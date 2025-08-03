/obj/item/undies
	var/sprite_acc = /datum/sprite_accessory/underwear/briefs

/obj/item/undies/bikini
	sprite_acc = /datum/sprite_accessory/underwear/bikini

/obj/item/undies/panties
	sprite_acc = /datum/sprite_accessory/underwear/panties

/obj/item/undies/leotard
	sprite_acc = /datum/sprite_accessory/underwear/leotard

/obj/item/undies/athletic_leotard
	sprite_acc = /datum/sprite_accessory/underwear/athletic_leotard

/obj/item/undies/braies
	sprite_acc = /datum/sprite_accessory/underwear/braies

/datum/crafting_recipe/roguetown/sewing/undies
	name = "briefs (1 fibers, 1 cloth)"
	result = list(/obj/item/undies)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/bikini
	name = "bikini (1 fibers, 2 cloth)"
	result = list(/obj/item/undies/bikini)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/panties
	name = "panties (1 cloth)"
	result = list(/obj/item/undies/panties)
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/leotard
	name = "leotard (1 fibers, 1 silk)"
	result = list(/obj/item/undies/leotard)
	reqs = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/athletic_leotard
	name = "athletic leotard (1 fibers, 1 silk)"
	result = list(/obj/item/undies/athletic_leotard)
	reqs = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/braies
	name = "braies (1 cloth)"
	result = list(/obj/item/undies/braies)
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 2
