extends Area2D

var can_click = false
var combination

export var comnbination_length = 4
export var lock_group = Color("ff9999")
signal combination


func _ready():
	add_to_group("locked_doors")
	dark_mode()
	$Light2D.enabled = false
	generate_combo()


func generate_combo():
	var combination_generator = get_tree().get_root().find_node("ComboGenerator", true, false)
	combination = combination_generator.generate_combo(comnbination_length)
	print("computer generate_combo run")
	emit_signal("combination", combination)
	$CanvasLayer/ComputerPopup.set_text(str(combination))
	return combination


func set_popup_text():
	pass


func _on_Computer_body_entered(body):
	if body.name == "Player":
		can_click = true


func _on_Computer_body_exited(body):
	can_click = false
	$Light2D.enabled = false
	$CanvasLayer/ComputerPopup.hide()


func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		set_popup_text()
		generate_combo()
		$CanvasLayer/ComputerPopup.popup_centered()
		$Light2D.enabled = true
		

func dark_mode():
	$Sprite.self_modulate = lock_group

func nightvision_mode():
	$Sprite.self_modulate = Color("ffffff")


func _on_Computer_combination():
	pass # Replace with function body.
