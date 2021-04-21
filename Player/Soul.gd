extends KinematicBody2D


var velocity = Vector2.ZERO
var speed = 153
var not_in_menu : bool = false

func _ready():
	pass

# warning-ignore:unused_argument
func _physics_process(delta):
	if not_in_menu:
		var input_vector = Vector2.ZERO
		input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		input_vector = input_vector.normalized()
	
		if input_vector != Vector2.ZERO:
			velocity = input_vector * speed
		else:
			velocity = Vector2.ZERO
		
		
		move_and_slide(velocity)
	

