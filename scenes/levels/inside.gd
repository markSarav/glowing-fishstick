extends LevelParent

@export var packed_scene_transition: PackedScene

func _on_exit_gate_area_body_entered(_body):
	var tween = create_tween()
	tween.tween_property($Player,"speed",0,.5)
	TransitionLayer.change_scene("res://scenes/levels/outside.tscn")
	
