extends Node
var mobs = [preload("res://scenes/mob.tscn"),preload("res://scenes/mob2.tscn")]
var INTenemyamount: int
var score: int
func _process(delta):
	if FileAccess.file_exists("user://save.save"):
		$hud/highscore.text=str("Highscore:", FileAccess.open("user://save.save",FileAccess.READ).get_float())
	else: $hud/highscore.text=str("Highscore:", gl_vars.score)
	$hud/ProgressBar.value=100*(1-$Character/Timer.time_left/$Character/Timer.wait_time)
func _game_start():
	$Character.position=$Marker2D.position
	$Character.target=$Marker2D.position
	$enemyspawntimer.start(1)
	$Character.visible=true
	$Character/Area2D/HitBox.disabled=false
	$hud/scorelabel.visible=true
	$Character/Timer.start()
	$hud/ProgressBar.visible=true
func _on_enemyspawntimer_timeout():
	INTenemyamount = score/5-1
	if INTenemyamount < 1:
		INTenemyamount = 1
	if INTenemyamount > 10:
		INTenemyamount = 10
	for i in range(INTenemyamount):
		var mob = mobs.pick_random().instantiate()
		get_parent().add_child(mob)
		var mob_spos = get_node("Path2D/PathFollow2D")
		mob_spos.progress_ratio = randf()
		mob.position = mob_spos.position
		score += 1
	$hud/scorelabel.text=str("Score: ",score)
	$enemyspawntimer/AudioStreamPlayer.play()
func _on_game_over():
	if score>gl_vars.score:
		FileAccess.open("user://save.save",FileAccess.WRITE).store_float(score)
	$Character.visible=false
	$enemyspawntimer.stop()
	$hud/exitbutton.show()
	$hud/gamename.show()
	get_tree().call_group("mob","queue_free")
	$hud/exitbutton.text=str("Try again")
	$hud/gamename.text=str("You lost!")
	$expl.play()
	$hud/ProgressBar.visible=false
func _on_hud_game_restart():
	get_tree().reload_current_scene()
func _on_hud_game_exit():
	get_tree().quit()
