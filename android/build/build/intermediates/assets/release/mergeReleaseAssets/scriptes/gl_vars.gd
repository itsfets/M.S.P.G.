extends Node
var plposition:Vector2
var score: int 
func _init():
  refresh()
func refresh():
  if FileAccess.file_exists("user://save.save"):
    score=FileAccess.open("user://save.save",FileAccess.READ).get_float()
  else:
    score = 0
