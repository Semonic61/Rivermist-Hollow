/mob/living/carbon/human

	var/datum/voicepack/voice_selection = null

GLOBAL_LIST_EMPTY(selectable_voicepacks_female)
GLOBAL_LIST_EMPTY(selectable_voicepacks_male)
GLOBAL_LIST_EMPTY(selectable_voicepacks)


/proc/generate_selectable_voicepacks()
	if(GLOB.selectable_voicepacks.len)
		return

	for(var/voicepack_type_m in subtypesof(/datum/voicepack/male))
		var/datum/voicepack/v_t_m = new voicepack_type_m
		GLOB.selectable_voicepacks_male[v_t_m.name] = voicepack_type_m
		GLOB.selectable_voicepacks[v_t_m.name] = voicepack_type_m
		qdel(v_t_m)

	var/datum/voicepack/v_t_m = new /datum/voicepack/male
	GLOB.selectable_voicepacks_male[v_t_m.name] = /datum/voicepack/male
	GLOB.selectable_voicepacks[v_t_m.name] = /datum/voicepack/male
	qdel(v_t_m)

	sortList(GLOB.selectable_voicepacks_male, GLOBAL_PROC_REF(cmp_text_dsc))

	for(var/voicepack_type_f in subtypesof(/datum/voicepack/female))
		var/datum/voicepack/v_t_f = new voicepack_type_f()
		GLOB.selectable_voicepacks_female[v_t_f.name] = voicepack_type_f
		GLOB.selectable_voicepacks[v_t_f.name] = voicepack_type_f
		qdel(v_t_f)

	var/datum/voicepack/v_t_f = new /datum/voicepack/female
	GLOB.selectable_voicepacks_female[v_t_f.name] = /datum/voicepack/female
	GLOB.selectable_voicepacks[v_t_f.name] = /datum/voicepack/female
	qdel(v_t_f)

	sortList(GLOB.selectable_voicepacks_female, GLOBAL_PROC_REF(cmp_text_dsc))

/datum/voicepack
	var/name 

/datum/voicepack/male
	name = "Male"

/datum/voicepack/male/dwarf
	name = "Male dwarf"

/datum/voicepack/male/dwarf/jester
	name = "Male dwarf jester"

/datum/voicepack/male/elf
	name = "Male elf"

/datum/voicepack/male/elf/jester
	name = "Male elf jester"

/datum/voicepack/male/evil
	name = "Male evil"

/datum/voicepack/male/evil/blkknight
	name = "Male evil blackknight"

/datum/voicepack/male/goblin
	name = "Male goblin"

/datum/voicepack/male/jester
	name = "Male jester"

/datum/voicepack/male/knight
	name = "Male knight"

/datum/voicepack/male/warrior
	name = "Male warrior"

/datum/voicepack/male/zeth
	name = "Male zeth"

/datum/voicepack/male/wizard
	name = "Male wizard"

/datum/voicepack/male/moth
	name = "Male moth"

/datum/voicepack/female
	name = "Female"

/datum/voicepack/female/dwarf
	name = "Female dwarf"

/datum/voicepack/female/elf
	name = "Female elf"

/datum/voicepack/female/goblin
	name = "Female goblin"
	
/datum/voicepack/female/moth
	name = "Female moth"
