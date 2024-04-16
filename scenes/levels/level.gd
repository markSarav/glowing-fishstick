extends Node2D
class_name LevelParent

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
	$UI.update_laser_text()
	#$UI.update_laser_color()
	print('shoot laser')

func _on_player_grenade_fired(pos,direction):
	#instantiate preloaded grenade scene
	var grenade = grenade_scene.instantiate() as RigidBody2D
	#add grenade node to child of projectiles
	#position the grenade at the pos signal (marker2d)
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	$UI.update_grenade_text()
	#$UI.update_grenade_color()
	print('shoot grenade')

#zoom in on player when house entered
#tweens are faster ways of creating smaller animations w/o using the animation player node
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
