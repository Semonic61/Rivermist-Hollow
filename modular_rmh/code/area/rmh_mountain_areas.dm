//MOUNTAIN MAP AREAS//

/area/rogue/outdoors/mountains/rmh_mountains/frozen
	name = "Dusk Spire Mountains"
	icon_state = "decap"
	ambush_mobs = null
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	droning_sound = 'sound/music/area/decap.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "DUSK SPIRE MOUNTAINS"
	ambush_times = null
	converted_type = /area/rogue/indoors/shelter/mountains/rmh_mountains/frozen
	deathsight_message = "a spire pass"

/area/rogue/indoors/shelter/mountains/rmh_mountains/frozen
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "indoors"
	droning_sound = 'sound/music/area/decap.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/cave/rmh_cave/cold
	name = "Cold Caves"
	first_time_text = "COLD CAVES"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "ice"
	deathsight_message = "a cold cave"

//DUSK SPIRE MANOR

/area/rogue/indoors/town/rmh/manor
	name = "Dusk Spire Manor"
	first_time_text = "DUSK SPIRE MANOR"
	icon_state = "manor"
	droning_sound = list('sound/music/area/manor.ogg', 'sound/music/area/manor2.ogg')
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/rmh/manorgarri
	keep_area = TRUE

/area/rogue/outdoors/exposed/rmh/manorgarri
	name = "Dusk Spire Manor Court"
	first_time_text = "DUSK SPIRE MANOR COURTYARD"
	icon_state = "manorgarri"
	droning_sound = 'sound/music/area/manorgarri.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	keep_area = TRUE
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN

/area/rogue/indoors/town/rmh/manor/basement
	name = "Dusk Spire Manor Basement"
	first_time_text = "DUSK SPIRE MANOR BASEMENT"
	icon_state = "basement"

/area/rogue/indoors/town/rmh/manor/bath
	name = "Dusk Spire Manor Baths"
	first_time_text = "DUSK SPIRE MANOR BATHS"
	icon_state = "bath"
	droning_sound = 'sound/music/area/bath.ogg'

/area/rogue/indoors/town/rmh/manor/vault
	name = "Dusk Spire Manor Vault"
	first_time_text = "DUSK SPIRE MANOR VAULT"
	icon_state = "vault"
	keep_area = TRUE

//KEEP OUTSKIRTS

/area/rogue/outdoors/mountains/rmh_mountains/frozen/lowlands
	name = "Cold Lowlands"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "outdoors"
	first_time_text = "COLD LOWLANDS"
	deathsight_message = "cold lowlands"

/area/rogue/outdoors/mountains/rmh_mountains/frozen/forsaken_village
	name = "Forsaken Village"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "village"
	first_time_text = "FORSAKEN VILLAGE"
	deathsight_message = "a forsaken village"

//KEEP

/area/rogue/indoors/cave/rmh_dwarf_keep
	name = "Kêdnath Acöb"
	first_time_text = "KÊDNATH ACÖB"
	icon_state = "dwarfin"
	droning_sound = 'sound/music/area/dwarf.ogg'
	ambientsounds = AMB_GENCAVE
	ambientnight = AMB_GENCAVE
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/rmh_dwarf_keep

/area/rogue/outdoors/exposed/rmh_dwarf_keep
	name = "Kêdnath Acöb"
	first_time_text = "KÊDNATH ACÖB"
	icon_state = "dwarfin"
	droning_sound = 'sound/music/area/dwarf.ogg'
	ambientsounds = AMB_GENCAVE
	ambientnight = AMB_GENCAVE
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/cave/rmh_dwarf_keep/entrance
	name = "Kêdnath Acöb Entrance Hall"
	first_time_text = "KÊDNATH ACÖB ENTRANCE HALL"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "indoors"

/area/rogue/indoors/cave/rmh_dwarf_keep/living
	name = "Kêdnath Acöb Living Hall"
	first_time_text = "KÊDNATH ACÖB LIVING HALL"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "living"

/area/rogue/indoors/cave/rmh_dwarf_keep/communal
	name = "Kêdnath Acöb Communal Hall"
	first_time_text = "KÊDNATH ACÖB COMMUNAL HALL"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "village"

/area/rogue/indoors/cave/rmh_dwarf_keep/grand
	name = "Kêdnath Acöb Grand Hall"
	first_time_text = "KÊDNATH ACÖB GRAND HALL"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "duke"

/area/rogue/indoors/cave/rmh_dwarf_keep/throne
	name = "Kêdnath Acöb Throne Hall"
	first_time_text = "KÊDNATH ACÖB THRONE HALL"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "manor"

/area/rogue/indoors/cave/rmh_dwarf_keep/treasury
	name = "Kêdnath Acöb Treasury Hall"
	first_time_text = "KÊDNATH ACÖB TREASURY HALL"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "vault"

/area/rogue/indoors/cave/rmh_dwarf_keep/smelters
	name = "Kêdnath Acöb Workshop: Smelters"
	first_time_text = "KÊDNATH ACÖB WORKSHOP: SMELTERS"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "fire_chamber"

/area/rogue/indoors/cave/rmh_dwarf_keep/forge
	name = "Kêdnath Acöb Workshop: Forge"
	first_time_text = "KÊDNATH ACÖB WORKSHOP: FORGE"
	icon = 'modular_rmh/icons/turf/areas.dmi'
	icon_state = "forge"

//TRANSITIONS

/area/rogue/outdoors/rmh_field/tavel/mount_to_rivermist
	name = "Mountain To Rivermist Hollow"
	first_time_text = "TO RIVERMIST HOLLOW"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN

/area/rogue/outdoors/rmh_field/tavel/mount_to_underdark
	name = "Mountain Descent To Underdark"
	first_time_text = "DESCENT TO UNDERDARK"
