extends ItemList

func loot_collected():
	add_icon_item(load("res://GFX/Loot/suitcase.png"), false)
	set_icon_scale(.3)