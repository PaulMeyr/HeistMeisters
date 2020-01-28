extends Area2D

func _on_Briefcase_body_entered(body):
	get_tree().call_group("Loot", "loot_collected")
	queue_free()
