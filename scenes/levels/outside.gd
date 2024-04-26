extends LevelParent

func _on_gate_player_entered_body():
	var tween = create_tween()
	tween.tween_property($Player,"speed",0,.6)
	TransitionLayer.change_scene("res://scenes/levels/inside.tscn")

func _on_gate_player_exited_body():
	pass # Replace with function body.

func _on_house_player_entered():
	var tween = get_tree().create_tween()
	#to play the tweens in parallel use
	#tween.set_parallel(true)
	#to change how fast the animation transtions you can use set_trans(Tween.TRANS_FUNCTION)
	tween.tween_property($Player/Camera2D,"zoom",Vector2(1,1),1).set_trans(Tween.TRANS_QUAD)
	#example of tween stacking (invis)
	#we can also designate a starting position for the tween aniation instead of
	#whatever position the player node started in by using from()
	#tween.tween_property($Player,"modulate:a",0,2).from(.5)
	#print("player has entered house")

#return camera back to original zoom level
func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D,"zoom",Vector2(.6,.6),1)
