extends Area2D

@export var speed: int = 1000
var direction: Vector2 = Vector2.UP

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	# 2 ways to find a method within body
	# body.has_method("method_name")
	# if "method_name" in body:
	#     body.method_name
	# can use this with a property parameter as well
	if "hit" in body:
		body.hit()
	queue_free()

func _on_timer_timeout():
	queue_free()
