extends CanvasLayer



func _on_PlayTutorial_pressed():
	get_tree().change_scene("res://Levels/TutorialLevel.tscn")


func _on_Level1_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")


func _on_Quit_pressed():
	get_tree().quit()
