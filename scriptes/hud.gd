extends CanvasLayer
var countingdown
var gamestate=0 
signal game_restart
signal game_start
signal count_start
signal game_exit
func _on_startbutton_pressed():
	gamestate=1
	$startbutton/waittimer.start()
	$exitbutton.hide()
	countingdown = true
func _process(delta):
	if countingdown == true:
		$gamename.text=str("Get ready!")
		$startbutton.hide()
		$waittime.text=str($startbutton/waittimer.time_left).pad_decimals(2)
func _on_exitbutton_pressed():
	if gamestate == 0:
		game_exit.emit()
	elif gamestate == 1:
		game_restart.emit()
func _on_waittimer_timeout():
	game_start.emit()
	$waittime.hide()
	$startbutton.hide()
	$gamename.hide()
	countingdown=false
