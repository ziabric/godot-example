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

var boostCount = 10000
var boostSpeed = 400
var boostSpeedFlag = 0


func _input(event):
	
	if ( event.is_action_pressed("esc") ) :
		get_tree().change_scene_to_file("res://menu/menu.tscn")
	
	if ( event.is_action_pressed("ui_accept") && boostSpeedFlag == 1 ) :
		boostSpeedFlag = 0
	elif ( event.is_action_pressed("ui_accept") && boostSpeedFlag == 0 ) :
		boostSpeedFlag = 1

func _physics_process(delta):
	if (Input.is_action_pressed("ui_up") && speed <= maxSpeed):
		speed += speedStep
	if (Input.is_action_pressed("ui_down") && speed >= speedStep):
		speed -= speedStep
	velocity = -(transform.y * sign(speed) * (speed + boostSpeedFlag * boostSpeed))
	
	maxRotation1 = maxRotation - steeringLimiterRatio * (speed)
	
	if ( Input.is_action_pressed("ui_right") && rotation_speed <= maxRotation1 ) :
		rotation_speed += rotationStep
	elif ( Input.is_action_pressed("ui_left") && rotation_speed >= -maxRotation1 ) :
		rotation_speed -= rotationStep
	else : 
		if ( abs(rotation_speed) <= abs(returnStep) ) : rotation_speed = 0
		else : rotation_speed += -returnStep if rotation_speed > 0 else rotationStep
	
	if (speed > 10) :
		rotation += rotation_speed * delta

	move_and_slide()
