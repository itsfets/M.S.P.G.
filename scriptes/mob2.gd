extends CharacterBody2D
var timerleftratio: float
var speed=0
func _on_spawn():
	$Timer.wait_time += randf_range(-2,4)
func _process(delta):
	timerleftratio = $Timer.time_left/($Timer.wait_time-4)
	if timerleftratio > 1:
		timerleftratio = 1
	apply_scale(Vector2(sqrt(timerleftratio*4),sqrt(timerleftratio*4)))
	if scale > Vector2(1,1):
		scale = Vector2(1,1)
	speed += position.distance_to(gl_vars.plposition)/1000
	if speed > 500:
		speed = 500
	velocity=speed*position.direction_to(gl_vars.plposition)*timerleftratio
func _physics_process(delta):
	move_and_slide()
	look_at(gl_vars.plposition)
func _on_timer_timeout():
	queue_free()
