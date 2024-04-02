extends StaticBody2D

signal player_entered_body
signal player_exited_body

func _on_area_2d_body_entered(_body):
	player_entered_body.emit()


func _on_area_2d_body_exited(_body):
	player_exited_body.emit()
