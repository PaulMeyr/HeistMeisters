extends "res://Doors/Door.gd"

var combination
export var lock_group = Color("ffffff")


func _ready():
	add_to_group("locked_doors")
	$DoorSprite.self_modulate = lock_group

func _on_Door_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click == true:
		$CanvasLayer/Numpad.popup_centered()
		$CanvasLayer/Numpad.reset_lock()


func _on_Door_body_exited(body):
	if body.collision_layer == 1:
		$CanvasLayer/Numpad.hide()
		can_click = false

func _on_Numpad_combination_correct():
	open()
	$CanvasLayer/Numpad.hide()


func _on_Computer_combination(combo):
	combination = combo
	$CanvasLayer/Numpad.combination = combination


func _on_ExitDetection_body_entered(body):
	open()


func dark_mode():
	$DoorSprite.self_modulate = lock_group


func nightvision_mode():
	$DoorSprite.self_modulate = Color("ffffff")

