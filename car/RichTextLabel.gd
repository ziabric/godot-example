extends RichTextLabel

func _ready():
	pass

func _process(delta):
	var angle = get_parent().rotation_speed * 180 / PI
	text = "Speed : " + str(get_parent().speed) + "\nAngle : " + str(int(angle))
