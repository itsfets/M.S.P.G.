extends CharacterBody2D
var target:Vector2
var speed = 0
var touch = []
signal game_over
func _unhandled_input(event):
  if event is InputEventScreenTouch and event.is_pressed():
    target = event.position
    $DTTimer.start()
    touch.append(event)
    if touch.size() >= 2 and $Timer.is_stopped():
      get_tree().call_group("mob", "_on_timer_timeout")
      $Timer.start()
      touch.clear()
  elif event is InputEventMouseButton and event.is_pressed():
    target=get_global_mouse_position()
    if Input.is_action_just_pressed("click",true) and $Timer.is_stopped():
      get_tree().call_group("mob", "_on_timer_timeout")
      $Timer.start()
func start(pos):
  position=pos
  show()
  $Area2D/HitBox.disabled=false
func _process(delta):
  gl_vars.plposition=position
  if speed>=150: 
    $Particles.emitting = true
  else:
    $Particles.emitting = false
func _physics_process(delta):
  speed=position.distance_to(target)*4
  if speed>1200:
    speed=1200
  velocity=position.direction_to(target)*speed
  move_and_slide()
  look_at(target)
func _on_hit(body_rid, body, body_shape_index, local_shape_index):
  emit_signal("game_over")
func _on_dt_timer_timeout():
  touch.clear()
