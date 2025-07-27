/mob/living/carbon/human

	var/datum/moan_pack/moan_selection = null

GLOBAL_LIST_EMPTY(selectable_moanpacks_female)
GLOBAL_LIST_EMPTY(selectable_moanpacks_male)
GLOBAL_LIST_EMPTY(selectable_moanpacks)


/proc/generate_selectable_moanpacks()
	if(GLOB.selectable_moanpacks.len)
		return

	for(var/moanpack_type_m in subtypesof(/datum/moan_pack/male))
		var/datum/moan_pack/m_t_m = new moanpack_type_m
		GLOB.selectable_moanpacks_male[m_t_m.name] = moanpack_type_m
		GLOB.selectable_moanpacks[m_t_m.name] = moanpack_type_m
		qdel(m_t_m)

	var/datum/moan_pack/m_t_m = new /datum/moan_pack/male
	GLOB.selectable_moanpacks_male[m_t_m.name] = /datum/moan_pack/male
	GLOB.selectable_moanpacks[m_t_m.name] = /datum/moan_pack/male
	qdel(m_t_m)

	sortList(GLOB.selectable_moanpacks_male, GLOBAL_PROC_REF(cmp_text_dsc))

	for(var/moanpack_type_f in subtypesof(/datum/moan_pack/female))
		var/datum/moan_pack/m_t_f = new moanpack_type_f()
		GLOB.selectable_moanpacks_female[m_t_f.name] = moanpack_type_f
		GLOB.selectable_moanpacks[m_t_f.name] = moanpack_type_f
		qdel(m_t_f)

	var/datum/moan_pack/m_t_f = new /datum/moan_pack/female
	GLOB.selectable_moanpacks_female[m_t_f.name] = /datum/moan_pack/female
	GLOB.selectable_moanpacks[m_t_f.name] = /datum/moan_pack/female
	qdel(m_t_f)

	sortList(GLOB.selectable_moanpacks_female, GLOBAL_PROC_REF(cmp_text_dsc))

/datum/moan_pack
	var/name 
	var/list/sounds_sexmoanlight
	var/list/sounds_sexmoanhvy
	var/list/sounds_groan
	var/list/sounds_painmoan
	var/list/sounds_whimper
	
/datum/moan_pack/proc/get_moans(key)
	switch(key)
		if("sexmoanlight")
			if(isnull(sounds_sexmoanlight))
				return
			else
				return pick(sounds_sexmoanlight)
		if("sexmoanhvy")
			if(isnull(sounds_sexmoanhvy))
				return
			else
				return pick(sounds_sexmoanhvy)
		if("groan")
			if(isnull(sounds_groan))
				return
			else
				return pick(sounds_groan)
		if("painmoan")
			if(isnull(sounds_painmoan))
				return
			else
				return pick(sounds_painmoan)
		if("whimper")
			if(isnull(sounds_whimper))
				return
			else
				return pick(sounds_whimper)
	return

/datum/moan_pack/male
	name = "Generic Male"
	sounds_sexmoanlight = null
	sounds_sexmoanhvy = null
	sounds_groan = list('sound/vo/male/gen/groan (1).ogg','sound/vo/male/gen/groan (2).ogg','sound/vo/male/gen/groan (3).ogg','sound/vo/male/gen/groan (4).ogg','sound/vo/male/gen/groan (5).ogg','sound/vo/male/gen/groan (6).ogg')
	sounds_painmoan = list('sound/vo/male/gen/painmoan (1).ogg','sound/vo/male/gen/painmoan (2).ogg','sound/vo/male/gen/painmoan (3).ogg','sound/vo/male/gen/painmoan (4).ogg','sound/vo/male/gen/painmoan (5).ogg')
	sounds_whimper = list('sound/vo/male/gen/whimper (1).ogg','sound/vo/male/gen/whimper (2).ogg','sound/vo/male/gen/whimper (3).ogg')

/datum/moan_pack/female
	name = "Generic Female"
	sounds_sexmoanlight = list('sound/vo/female/gen/se/sexlight (1).ogg','sound/vo/female/gen/se/sexlight (2).ogg','sound/vo/female/gen/se/sexlight (3).ogg','sound/vo/female/gen/se/sexlight (4).ogg','sound/vo/female/gen/se/sexlight (5).ogg','sound/vo/female/gen/se/sexlight (6).ogg','sound/vo/female/gen/se/sexlight (7).ogg')
	sounds_sexmoanhvy = list('sound/vo/female/gen/se/sex (1).ogg','sound/vo/female/gen/se/sex (2).ogg','sound/vo/female/gen/se/sex (3).ogg','sound/vo/female/gen/se/sex (4).ogg','sound/vo/female/gen/se/sex (5).ogg','sound/vo/female/gen/se/sex (6).ogg','sound/vo/female/gen/se/sex (7).ogg','sound/vo/female/gen/se/sex (8).ogg')
	sounds_groan = list('sound/vo/female/gen/groan (1).ogg','sound/vo/female/gen/groan (2).ogg','sound/vo/female/gen/groan (3).ogg','sound/vo/female/gen/groan (4).ogg','sound/vo/female/gen/groan (5).ogg')
	sounds_painmoan = list('sound/vo/female/gen/painmoan (1).ogg','sound/vo/female/gen/painmoan (2).ogg','sound/vo/female/gen/painmoan (3).ogg','sound/vo/female/gen/painmoan (4).ogg','sound/vo/female/gen/painmoan (5).ogg','sound/vo/female/gen/painmoan (6).ogg','sound/vo/female/gen/painmoan (7).ogg','sound/vo/female/gen/painmoan (8).ogg')
	sounds_whimper = list('sound/vo/female/gen/whimper (1).ogg','sound/vo/female/gen/whimper (2).ogg','sound/vo/female/gen/whimper (3).ogg')
/*
/datum/moan_pack/male/new_pack // please inherit from male/female packs like this

/datum/moan_pack/female/new_pack*/
