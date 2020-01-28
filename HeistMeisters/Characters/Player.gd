 extends "res://Characters/TemplateCharacter.gd"

export var disguises = 3
export var disguise_duration = 5
export var disguise_slowdown = .25

var motion = Vector2() 
var disguised = false

func _ready():
	update_disguise_display()


func _physics_process(delta):
	update_movement()
	move_and_slide(motion)
	if disguised:
		$Label.set_rotation(-rotation)
		$Label.text = str($Timer.time_left).pad_decimals(2)


func _input(event):
	if Input.is_action_just_pressed("toggle_vision_mode"):
		update_light()
	if Input.is_action_just_pressed("toggle_disguise"):
		toggle_disguise()


func update_movement():
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("move_down") and not Input.is_action_pressed("move_up"):
		motion.y = clamp(motion.y + SPEED, 0, max_speed)
	elif Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
		motion.y = clamp(motion.y - SPEED, - max_speed, 0)
	else:
		 motion.y = lerp(motion.y, 0, FRICTION)
	if Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		motion.x = clamp(motion.x + SPEED, 0, max_speed)
	elif Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		motion.x = clamp(motion.x - SPEED, - max_speed, 0)
	else:
		motion.x = lerp(motion.x, 0, FRICTION)


func update_light():
	get_tree().call_group("Interface", "cycle_vision_mode")


func toggle_disguise():
	if not disguised and disguises > 0:
		disguise_on()
		disguises -= 1
	elif disguised:
		disguise_off()
	update_disguise_display()

func disguise_on():
	print("disguese on")
	collision_layer = 16
	max_speed *= disguise_slowdown
	$Sprite.texture = load("res://GFX/PNG/Tiles/tile_129.png")
	$CharacterOccluder.occluder = load("res://Characters/BoxOccluder.tres")
	$Timer.start()
	$Label.visible = true
	disguised = true


func disguise_off():
	print("disguise off")
	collision_layer = 1
	max_speed /= disguise_slowdown
	$Sprite.texture = load("res://GFX/PNG/Hitman 1/hitman1_stand.png")
	$CharacterOccluder.occluder = load("res://Characters/CharacterOccluder.tres")
	$Label.visible = false
	disguised = false


func update_disguise_display():
	get_tree().call_group("DisguiseDisplay", "update_disguises", disguises)

func loot_collected():
	print("loot collected player run")
	var loot = Node.new()
	loot.set_name("breifcase")
	add_child(loot)