extends Node2D

#load laser scene to be able to create a laser object on the level
var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
#do the same with the grenade scene
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")


#custom signal from player node emitted when primary action is pressed (laser has been fired)
func _on_player_laser_fired(pos,direction):
	#instantiate preloaded scene as a node
	var laser = laser_scene.instantiate() as Area2D

	#position the laser node to the position of the pos (marker2d signal)
	laser.position = pos
	#get the correct degree rotation the laser is firing from
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	#update the direction of the laser 
	laser.direction = direction

	#add laser node to scene as child of the level
	$Projectiles.add_child(laser)
	print('shoot laser')

func _on_player_grenade_fired(pos,direction):
	#instantiate preloaded grenade scene
	var grenade = grenade_scene.instantiate() as RigidBody2D
	#add grenade node to child of projectiles
	#position the grenade at the pos signal (marker2d)
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	print('shoot grenade')

func _on_gate_player_entered_body():
	print('player entered area')

func _on_gate_player_exited_body():
	print('player has exited area')

