extends Node2D
var hitbox:PackedVector2Array
var C_frame=0
func _new_frame():
	C_frame=$Area2D/AnimatedSprite2D.get_frame()
	if C_frame==0:
		$Area2D/hitbox_0.disabled=false
	elif C_frame==1:
		$Area2D/hitbox_0.polygon=$Area2D/hitbox_1.polygon
	elif C_frame==2:
		$Area2D/hitbox_0.polygon=$Area2D/hitbox_2.polygon
	elif C_frame==3:
		$Area2D/hitbox_0.polygon=$Area2D/hitbox_3.polygon
	elif C_frame==4:
		$Area2D/hitbox_0.polygon=$Area2D/hitbox_4.polygon
	elif C_frame==5:
		$Area2D/hitbox_0.polygon=$Area2D/hitbox_5.polygon
	elif C_frame==6:
		$Area2D/hitbox_0.polygon=$Area2D/hitbox_6.polygon
	elif C_frame==7:
		$Area2D/hitbox_0.polygon=$Area2D/hitbox_7.polygon
