extends Node2D
var hitbox:PackedVector2Array
var C_frame=0
@export var frame_count=8
func _new_frame():
	C_frame=$Area2D/AnimatedSprite2D.get_frame()
	for x in frame_count:
		get_node("Area2D/hitbox_"+str(x)).disabled=(x!=C_frame)
#Thanks to https://forum.godotengine.org/u/ubiguchi/ for this code!
