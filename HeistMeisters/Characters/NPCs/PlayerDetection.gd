extends "res://Characters/TemplateCharacter.gd"

const FOV_TOLERANCE = 20
const RED = Color(1, 0.25, 0.25)
const WHITE = Color(1, 1, 1)

var Player


func _ready():
	Player = get_node("/root").find_node("Player", true, false)


func _process(delta):
	if Player_in_FOV() and Player_in_LOS():
		$Flashlight.color = RED
		get_tree().call_group("SuspicionMeter", "player_seen")
	else:
		$Flashlight.color = WHITE


func Player_in_LOS():
	var space = get_world_2d().direct_space_state
	var LOS_obstacle = space.intersect_ray(global_position, Player.global_position, [self], collision_mask)
	var distance_to_player = Player.global_position.distance_to(global_position)
	var max_detection_range = $Flashlight.texture.get_size() * 1.5
	var Player_in_range = Player.global_position.distance_to(global_position) < max_detection_range.y
	
	if not LOS_obstacle:
		return false
	
	if LOS_obstacle.collider == Player and Player_in_range:
		return true
	else:
		return false


func Player_in_FOV():
	var npc_facing_direction = Vector2(1,0).rotated(global_rotation)
	if self.name == "CameraBody":
		npc_facing_direction = Vector2(0,-1).rotated(global_rotation)
	var direction_to_player = (Player.position - global_position).normalized()
	
	
	if abs(direction_to_player.angle_to(npc_facing_direction)) < deg2rad(FOV_TOLERANCE):
		return true
	else:
		return false 
