extends CharacterBody2D

var rotation_speed = 0
var maxRotation1 = 3
var maxRotation = 3
var steeringLimiterRatio = 0.005
var rotationStep = 0.05
var returnStep = 0.2
var speed = 0
var maxAngle = 60
var maxSpeed = 400
var speedStep = 10

func _input(event):
	pass

func _physics_process(delta):
	
	if (Input.is_action_pressed("ui_up") && speed <= maxSpeed):
		speed += speedStep
	if (Input.is_action_pressed("ui_down") && speed >= speedStep):
		speed -= speedStep
	velocity = -(transform.y * sign(speed) * speed)
	
	maxRotation1 = maxRotation - steeringLimiterRatio * speed
	
	if ( Input.is_action_pressed("ui_right") && rotation_speed <= maxRotation1 ) :
		rotation_speed += rotationStep
	elif ( Input.is_action_pressed("ui_left") && rotation_speed >= -maxRotation1 ) :
		rotation_speed -= rotationStep
	else : 
		rotation_speed += -returnStep if rotation_speed > 0 else rotationStep
	
	if (speed > 0) :
		rotation += rotation_speed * delta



	move_and_slide()
