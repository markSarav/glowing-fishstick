extends CharacterBody2D

#custom signal to alert the level node that the laser has been fired
signal laser_fired(pos,direction)
signal grenade_fired(pos,direction)

#timer variables for autocomplete
@onready var laser_timer = $LaserTimer
@onready var grenade_timer = $GrenadeTimer

#variables for projectile cooldown reset
var can_fire_laser: bool = true
var can_fire_grenade: bool = true

#variables for movement
@export var max_speed: int = 500
var speed: int = max_speed


func _process(_delta):
	#get the input mapping from project settings assign them to a vector2 variable
	var direction: Vector2 = Input.get_vector("left","right","up","down")
	#update velocity to the direction of user input and multiply it by the speed
	velocity = direction * speed
	
	#function used to move the body and detect collisions with other bodies see documentation
	#of move_and_slide() for further explantion and behavior
	move_and_slide()
	
	#rotate player with the mouse cursor
	look_at((get_global_mouse_position()))
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	#fire laser
	if Input.is_action_pressed("primary action") && can_fire_laser:
		#randomly select a marker 2d for the laser start
		var laser_marker = $LaserStartPositions.get_children()
		var pos = laser_marker[randi() % laser_marker.size()]
		$GPUParticles2D.emitting = true
		laser_timer.start()
		laser_fired.emit(pos.global_position,player_direction)
		can_fire_laser = false
	
	#fire grenade
	if Input.is_action_pressed("secondary action") && can_fire_grenade:
		#grenade spawning position
		var pos = $LaserStartPositions.get_children()[0]
		#grenade direction when spawned
		grenade_timer.start()
		grenade_fired.emit(pos.global_position,player_direction)
		can_fire_grenade = false


#off cooldown re-arms laser
func _on_laser_timer_timeout():
	can_fire_laser = true

#off cooldown re-arms grenade
func _on_grenade_timer_timeout():
	can_fire_grenade = true;
