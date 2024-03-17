extends Node2D
var hitbox:PackedVector2Array
var C_frame=0
@export var frame_count=8
func _new_frame():
	C_frame=$Area2D/AnimatedSprite2D.get_frame()
	for x in frame_count:
		get_node("Area2D/hitbox_"+str(x)).disabled=(x!=C_frame)
#Thanks to https://forum.godotengine.org/u/ubiguchi/ for this code!
	print("Hitbox_0 is:",$Area2D/hitbox_0.disabled) 
	print("Hitbox_1 is:",$Area2D/hitbox_1.disabled) 
	print("Hitbox_2 is:",$Area2D/hitbox_2.disabled) 
	print("Hitbox_3 is:",$Area2D/hitbox_3.disabled) 
	print("Hitbox_4 is:",$Area2D/hitbox_4.disabled) 
	print("Hitbox_5 is:",$Area2D/hitbox_5.disabled) 
	print("Hitbox_6 is:",$Area2D/hitbox_6.disabled) 
	print("Hitbox_7 is:",$Area2D/hitbox_7.disabled) 
	print()
