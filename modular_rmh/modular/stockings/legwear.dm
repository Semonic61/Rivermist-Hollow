/datum/sprite_accessory/legwear
	abstract_type = /datum/sprite_accessory/legwear
	icon = 'modular_hearthstone/icons/obj/items/clothes/on_mob/stockings.dmi'
	color_key_name = "Legwear"
	layer = LEGWEAR_LAYER
	var/legwear_type
	//Whether this underwear includes a top (Because gender = FEMALE doesn't actually apply here.). Hides breasts, nothing more.
	var/hides_breasts = FALSE

/datum/sprite_accessory/legwear/get_icon_state(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	var/tag = icon_state
	if(owner.gender == FEMALE)
		tag = tag + "_f"
	if(is_species(owner,/datum/species/dwarf))
		tag = tag + "_dwarf"
	
	return tag

/datum/sprite_accessory/legwear/adjust_appearance_list(list/appearance_list, obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	generic_gender_feature_adjust(appearance_list, organ, bodypart, owner, OFFSET_PANTS, OFFSET_PANTS_F)

/datum/sprite_accessory/legwear/is_visible(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	return is_human_part_visible(owner, HIDEJUMPSUIT)

/datum/sprite_accessory/legwear/stockings
	name = "stockings"
	icon_state = "stockings"
	legwear_type = /obj/item/legwears

/datum/sprite_accessory/legwear/stockings/silk
	name = "silk stockings"
	icon_state = "silk"
	legwear_type = /obj/item/legwears/silk
//Fishnets
/datum/sprite_accessory/legwear/stockings/fishnet
	name = "fishnet stockings"
	icon_state = "fishnet"
	legwear_type = /obj/item/legwears/fishnet
