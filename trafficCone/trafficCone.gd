extends Node2D


func _ready():
	pass # Replace with function body.


func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	print(body.name)
	queue_free()
	pass # Replace with function body.
