extends Node
var mobs=[preload("res://scenes/mob.tscn"),preload("res://scenes/mob2.tscn")]
var INTenemyamount:int
var score:int
var stuffcount=0
@onready var mob_spos=get_node("Path2D/PathFollow2D")
func _process(delta):
	if FileAccess.file_exists("user://save.save"):
		$hud/highscore.text=str("Highscore: ",FileAccess.open("user://save.save",FileAccess.READ).get_float())
	else: $hud/highscore.text=str("Highscore: ",gl_vars.score)
	$hud/ProgressBar.value=100*(1-$Character/Timer.time_left/$Character/Timer.wait_time)
	$hud/stuffcounter.text=str("Stuff's: ",stuffcount)
func _game_start():
	$Character.position=$Marker2D.position
	$Character.target=$Marker2D.position
	$enemyspawntimer.start(1)
	$Character.visible=true
	$Character/Area2D/HitBox.disabled=false
	$hud/scorelabel.visible=true
	$Character/Timer.start()
	$hud/ProgressBar.visible=true
	$stuffspawntimer.start()
func _on_enemyspawntimer_timeout():
	INTenemyamount=sqrt(sqrt(score))
	if INTenemyamount<1:
		INTenemyamount=1
	if INTenemyamount>5:
		INTenemyamount=5
	for i in range(INTenemyamount):
		var mob=mobs.pick_random().instantiate()
		mob_spos.progress_ratio=randf_range(0,1)
		mob.position=mob_spos.position
		while gl_vars.plposition.distance_to(mob_spos.position)<800:
			mob_spos.progress_ratio=randf()
			mob.position=mob_spos.position
		if gl_vars.plposition.distance_to(mob_spos.position)>=800:
			get_parent().add_child(mob)
			score+=1
			$hud/scorelabel.text=str("Score: ",score)
			$enemyspawntimer/AudioStreamPlayer.play()
func _on_stuffspawntimer_timeout():
	$Node2D.position=Vector2(randf_range(200,1720),randf_range(200,880))
	$Node2D.visible=true
	$Node2D/Area2D/CPUParticles2D.restart()
	$Node2D/Area2D/AnimatedSprite2D.play()
	$Node2D/Area2D/AnimatedSprite2D.set_frame_and_progress(0,01)
func _on_area_2d_area_entered(area):
	stuffcount+=1
	$stuffspawntimer.start()
	$Node2D.visible=false
func _on_game_over():
	$hud.gamestate=1
	if score+stuffcount*3>gl_vars.score:
		FileAccess.open("user://save.save",FileAccess.WRITE).store_float(score+stuffcount*3)
		gl_vars._init()
	$Character.visible=false
	$enemyspawntimer.stop()
	$hud/scorelabel.hide()
	$hud/exitbutton.show()
	$hud/gamename.show()
	get_tree().call_group("mob","queue_free")
	$hud/exitbutton.text=str("Try again")
	$hud/gamename.text=str("You lost!\n Your score: ",score+stuffcount*3)
	$expl.play()
	$hud/ProgressBar.visible=false
func _on_hud_game_restart():
	get_tree().reload_current_scene()
func _on_hud_game_exit():
	get_tree().quit()
