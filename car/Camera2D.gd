extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if ( event.is_action_pressed("zoom_in") ) :
		zoom *= 1.1
	if ( event.is_action_pressed("zoom_out") ) :
		zoom *= 0.9
