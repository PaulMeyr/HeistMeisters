extends Light2D

func _ready():
	add_to_group("locked_doors")

func dark_mode():
	visible = true


func nightvision_mode():
	visible = false
