/obj/structure/roguemachine/vendor/inn_rmh
	keycontrol = "tavern"

/obj/structure/roguemachine/vendor/inn_rmh/Initialize()
    . = ..()

    // Add room keys with a price of 20
    for (var/X in list(/obj/item/roguekey/roomi, /obj/item/roguekey/roomii, /obj/item/roguekey/roomiii, /obj/item/roguekey/roomiv, /obj/item/roguekey/roomv))
        var/obj/P = new X(src)
        held_items[P] = list()
        held_items[P]["NAME"] = P.name
        held_items[P]["PRICE"] = 20

    update_icon()
