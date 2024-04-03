extends RigidBody2D


const speed = 750
@onready var animation_player = $AnimationPlayer

func explode():
	animation_player.play("Explosion")
