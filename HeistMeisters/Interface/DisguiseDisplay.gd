extends ItemList

func update_disguises(number):
	clear()
	for i in range(number):
		add_icon_item(load("res://GFX/PNG/Tiles/tile_157.png"), false)
