/datum/bodypart_feature/legwear
	name = "Legwear"
	feature_slot = BODYPART_FEATURE_LEGWEAR
	body_zone = BODY_ZONE_CHEST
	var/obj/item/legwears/legwear_item

/datum/bodypart_feature/legwear/set_accessory_type(new_accessory_type, colors, mob/living/carbon/owner)
	accessory_type = new_accessory_type
	var/datum/sprite_accessory/legwear/accessory = SPRITE_ACCESSORY(accessory_type)
	if(!isnull(colors))
		accessory_colors = colors
	else
		accessory_colors = accessory.get_default_colors(color_key_source_list_from_carbon(owner))
	accessory_colors = accessory.validate_color_keys_for_owner(owner, colors)
	legwear_item = new accessory.legwear_type(owner)
	if(owner.legwear_socks)
		qdel(owner.legwear_socks)
	owner.legwear_socks = legwear_item
	legwear_item.legwears_feature = src
	legwear_item.color = accessory_colors
