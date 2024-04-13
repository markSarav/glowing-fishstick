extends LevelParent

@export var packed_scene_transition: PackedScene


func _on_exit_gate_area_body_entered(_body):
	var tween = create_tween()
	tween.tween_property($Player,"speed",0,.5)
	get_tree().call_deferred("change_scene_to_packed", packed_scene_transition)
