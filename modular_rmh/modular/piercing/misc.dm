/datum/customizer/bodypart_feature/piercing
	name = "Piercing"
	customizer_choices = list(/datum/customizer_choice/bodypart_feature/piercing)
	allows_disabling = TRUE
	default_disabled = TRUE

/datum/customizer_choice/bodypart_feature/piercing
	name = "Piercing"
	feature_type = /datum/bodypart_feature/piercing
	//default_accessory = /datum/sprite_accessory/legwear/stockings
	sprite_accessories = list(
		/datum/sprite_accessory/legwear/piercing/rings,
		/datum/sprite_accessory/legwear/stockings/beads,
		)
