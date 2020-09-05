extends KinematicBody2D

# static variables
const MAX_SPEED = 80
const ACCELERATION = 500
const FRICTION = 500

var velocity = Vector2.ZERO
onready var animationPlayer = $AnimationPlayer

# func _ready():
#	print("hello~")
#	animationPlayer = $AnimationPlayer	
#	pass # Replace with function body.

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		if input_vector.x >= 0:
			animationPlayer.play("RunRight")
			# velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		else:
			animationPlayer.play("RunLeft")
			# velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		if input_vector.x > 0:
			animationPlayer.play("IdleRight")
		elif input_vector.x < 0:
			animationPlayer.play("IdleLeft")
		
			
	velocity =  move_and_slide(velocity)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
