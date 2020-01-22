extends "res://Doors/Door.gd"

var combination = [0, 0, 0, 0]

func _ready():
	$CanvasLayer/Numpad.combination = combination


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
