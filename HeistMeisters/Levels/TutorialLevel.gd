extends Node2D

func _ready():
	update_pointer_position(0)


func update_pointer_position(number):
	var pointer = $ObjectivePointer
	var marker = $ObjectiveMarkers.get_child(number)
	$Tween.interpolate_property(pointer, "position", pointer.position, marker.position, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()
	$AudioStreamPlayer2D.play()
	print("update pointer run")


func _on_ObjectiveMove_body_entered(body):
	print("collided with objectivemove")
	update_pointer_position(0) 


func _on_ObjectiveDoor_body_entered(body):
	print("collided with objectivedoor")
	update_pointer_position(1)


func _on_ObjectiveComputer_body_entered(body):
	print("collided with objectiveComputer")
	update_pointer_position(2)


func _on_ObjectiveLockedDoor_body_entered(body):
	update_pointer_position(3)


func _on_ObjectiveNightVisionn_body_entered(body):
	update_pointer_position(4)


func _on_ObjectiveDisguise_body_entered(body):
	update_pointer_position(5)


func _on_Briefcase_body_entered(body):
	update_pointer_position(6)
