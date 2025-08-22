//traits with no real impact that can be taken freely
//MAKE SURE THESE DO NOT MAJORLY IMPACT GAMEPLAY. those should be positive or negative traits.

/*
/datum/quirk/pineapple_liker
	name = "Ananas Affinity"
	desc = "Has no effect but breaks the game if we remove it."
	value = 0
	gain_text = span_notice("I feel an intense craving for pineapple.")
	lose_text = span_notice("My feelings towards pineapples seem to return to a lukewarm state.")
	medical_record_text = "Patient demonstrates a pathological love of pineapple."

/datum/quirk/pineapple_liker/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food |= PINEAPPLE

/datum/quirk/pineapple_liker/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food &= ~PINEAPPLE

/datum/quirk/pineapple_hater
	name = "Ananas Aversion"
	desc = "Has no effect but breaks the game if we remove it."
	value = 0
	gain_text = span_notice("I find myself pondering what kind of idiot actually enjoys pineapples...")
	lose_text = span_notice("My feelings towards pineapples seem to return to a lukewarm state.")
	medical_record_text = "Patient is correct to think that pineapple is disgusting."

/datum/quirk/pineapple_hater/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.disliked_food |= PINEAPPLE

/datum/quirk/pineapple_hater/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.disliked_food &= ~PINEAPPLE

/datum/quirk/deviant_tastes
	name = "Deviant Tastes"
	desc = "Stuff you like is now the stuff you hate, and other way around. (probably) Has no effect."
	value = 0
	gain_text = span_notice("I start craving something that tastes strange.")
	lose_text = span_notice("I feel like eating normal food again.")
	medical_record_text = "Patient demonstrates irregular nutrition preferences."

/datum/quirk/deviant_tastes/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	var/liked = species.liked_food
	species.liked_food = species.disliked_food
	species.disliked_food = liked

/datum/quirk/deviant_tastes/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food = initial(species.liked_food)
		species.disliked_food = initial(species.disliked_food)
*/

/* no longer necessary due to having male fem pref
/datum/quirk/monsterhunter
	name = "Monster \"Hunter\""
	desc = "Allows targeting by specific monsters (such as werewolves, goblins and minotaurs etc.) for something very lewd. May be unfair to you in combat. (CHOOSE PREF QUIRKS ASWELL)"
	value = 0
	gain_text = span_notice("I want to feel a monster inside.. or inside a monster.")
	lose_text = span_notice("I no longer am a degenerate.")
*/

/*/datum/quirk/monsterhuntermale
	name = "Monster \"Hunter\" (Males)"
	desc = "Allows targeting by specific monsters (such as werewolves, goblins and minotaurs etc.) for something very lewd. May be unfair to you in combat. Male monsters lust for me..."
	value = 0

/datum/quirk/monsterhunterfemale
	name = "Monster \"Hunter\" (Females)"
	desc = "Allows targeting by specific monsters (such as werewolves, goblins and minotaurs etc.) for something very lewd. May be unfair to you in combat. Female monsters lust for me... "
	value = 0*/

/datum/quirk/selfawaregeni
	name = "Sensitiveness"
	desc = "I can tell more about my private bits (may be spammy, exact liquid information and alerts etc.)"
	value = 0

//damn snowflakes.
/*/datum/quirk/weirdo
	name = "Freeky"
	desc = "I can use my 'orifices' to store things and do more strange sexual things that wouldn't come to sane mind."
	value = 0*/

/datum/quirk/virgin
	name = "Virgin"
	desc = "I am a virgin, whether truly, by magic or plot holes. Vampires and cultists are likely to lust for my blood."
	value = 0
	gain_text = span_notice("I am a virgin.")

/datum/quirk/virgin/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.virginity = TRUE
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)

/datum/quirk/resident
	name = "Resident"
	desc = "I'm a resident of Rivermist Hollow. I have an account in the city's treasury and a home in the city."
	value = 0
	mob_trait = TRAIT_RESIDENT

/datum/quirk/resident/on_spawn()
	var/mob/living/carbon/human/recipient = quirk_holder
	if(recipient in SStreasury.bank_accounts)
		SStreasury.generate_money_account(20, recipient)
	else
		SStreasury.create_bank_account(recipient, 20)
	if(HAS_TRAIT(recipient, TRAIT_RESIDENT))
		REMOVE_TRAIT(recipient, TRAIT_OUTLANDER, ADVENTURER_TRAIT)

	var/mapswitch = 0
	if(SSmapping.config.map_name == "Dun Manor")
		mapswitch = 1
	else if(SSmapping.config.map_name == "Dun World")
		mapswitch = 2

	//if(mapswitch == 0)
	//	return
	if(recipient.mind?.assigned_role == "Adventurer" || recipient.mind?.assigned_role == "Mercenary" || recipient.mind?.assigned_role == "Court Agent")
		// Find tavern area for spawning
		var/area/spawn_area
		for(var/area/A in world)
			if(istype(A, /area/rogue/indoors/town/tavern))
				spawn_area = A
				break

		if(spawn_area)
			var/target_z = 3 //ground floor of tavern for dun manor / world
			var/target_y = 70 //dun manor
			var/list/possible_chairs = list()

			if(mapswitch == 2)
				target_y = 234 //dun world huge

			for(var/obj/structure/chair/C in spawn_area)
				//z-level 3, wooden chair, and Y > north of tavern backrooms
				var/turf/T = get_turf(C)
				if(T && T.z == target_z && T.y > target_y && istype(C, /obj/structure/chair/wood/rogue) && !T.density && !T.is_blocked_turf(FALSE))
					possible_chairs += C

			if(length(possible_chairs))
				var/obj/structure/chair/chosen_chair = pick(possible_chairs)
				recipient.forceMove(get_turf(chosen_chair))
				chosen_chair.buckle_mob(recipient)
				to_chat(recipient, span_notice("As a resident of Rivermist Hollow, you find yourself seated at a chair in the local tavern."))
			else
				var/list/possible_spawns = list()
				for(var/turf/T in spawn_area)
					if(T.z == target_z && T.y > (target_y + 4) && !T.density && !T.is_blocked_turf(FALSE))
						possible_spawns += T

				if(length(possible_spawns))
					var/turf/spawn_loc = pick(possible_spawns)
					recipient.forceMove(spawn_loc)
					to_chat(recipient, span_notice("As a resident of Rivermist Hollow, you find yourself in the local tavern."))
