extends CanvasLayer
var gamestate:int=0
signal game_restart
signal game_start
signal count_start
signal game_exit
func _on_startbutton_pressed():
  $startbutton/waittimer.start()
  $exitbutton.hide()
  $startbutton.hide()
  $MenuButton.hide()
  $waittime.show()
func _process(delta):
    $waittime.text=str($startbutton/waittimer.time_left).pad_decimals(2)
func _on_exitbutton_pressed():
    game_exit.emit()
func _on_waittimer_timeout():
  game_start.emit()
  $waittime.hide()
  $startbutton.hide()
func _on_menu_button_pressed():
  $HTP.visible=true
  $gamename.visible=false
  $startbutton.disabled=true
  $startbutton.visible=false
  $exitbutton.disabled=true
  $exitbutton.visible=false
  $MenuButton.disabled=true
  $MenuButton.visible=false
func _on_button_pressed():
  $HTP.visible=false
  $gamename.visible=true
  $startbutton.disabled=false
  $startbutton.visible=true
  $exitbutton.disabled=false
  $exitbutton.visible=true
  $MenuButton.disabled=false
  $MenuButton.visible=true
func _on_restart_button_pressed():
  game_restart.emit()
