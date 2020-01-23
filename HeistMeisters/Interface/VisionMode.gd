extends CanvasModulate

const DARK = Color("111111")
const NIGHTVISION = Color("37bf62")


func _ready():
	visible = true
	DARK_mode()


func cycle_vision_mode():
	if $Timer.is_stopped() == true:
		if color == NIGHTVISION:
			DARK_mode()
			$Timer.start()
			get_tree().call_group("locked_doors", "dark_mode")
		else:
			$Timer.start()
			NIGHTVISION_mode()
			get_tree().call_group("locked_doors", "nightvision_mode")


func DARK_mode():
	color = DARK
	$AudioStreamPlayer2D.stream = load("res://SFX/nightvision_off.wav")
	$AudioStreamPlayer2D.play()



func NIGHTVISION_mode():
	color = NIGHTVISION
	$AudioStreamPlayer2D.stream = load("res://SFX/nightvision.wav")
	$AudioStreamPlayer2D.play()