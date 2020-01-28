extends ColorRect

func _on_Area2D_body_entered(body):
	print("body entered")
	if body.has_node("breifcase"):
		print("you have the breifcase")
		get_tree().change_scene("res://Interface/Victory!.tscn")
